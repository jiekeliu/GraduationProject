/*    */ package aaa;
/*    */ 
/*    */ import java.io.File;
/*    */ import java.net.URLEncoder;
/*    */ 
/*    */ public class Utility
/*    */ {
/*    */   public static boolean checkInput(String str)
/*    */   {
/*  9 */     if (str.indexOf('\'') != -1)
/* 10 */       return false;
/* 11 */     if (str.indexOf('=') != -1)
/* 12 */       return false;
/* 13 */     if (str.toLowerCase().indexOf("or") != -1) {
/* 14 */       return false;
/*    */     }
/* 16 */     return str.indexOf("--") == -1;
/*    */   }
/*    */ 
/*    */   public static String cutString(String str, int n)
/*    */   {
/* 21 */     int len = str.length();
/* 22 */     if (len <= n) {
/* 23 */       return str;
/*    */     }
/*    */ 
/* 26 */     return str.substring(0, n - 3) + "...";
/*    */   }
/*    */ 
/*    */   public static boolean delFile(String fname)
/*    */   {
/* 31 */     File file = new File(fname);
/* 32 */     if (file.exists())
/* 33 */       return file.delete();
/* 34 */     return true;
/*    */   }
/*    */ 
/*    */   public static String utfTogbk(String src) {
/* 38 */     String des = "";
/* 39 */     for (int i = 0; i < src.length(); ++i)
/*    */     {
/* 41 */       if (src.charAt(i) == '/')
/*    */       {
/* 43 */         des = des + "/";
/*    */       }
/*    */       else
/*    */       {
/*    */         try
/*    */         {
/* 49 */           des = des + URLEncoder.encode(String.valueOf(src.charAt(i)), "GBK"); } catch (Exception localException) {
/*    */         }
/*    */       }
/*    */     }
/* 53 */     return des;
/*    */   }

public static String utfTogb2312(String src) {
	/* 38 */     String des = "";
	/* 39 */     for (int i = 0; i < src.length(); ++i)
	/*    */     {
	/* 41 */       if (src.charAt(i) == '/')
	/*    */       {
	/* 43 */         des = des + "/";
	/*    */       }
	/*    */       else
	/*    */       {
	/*    */         try
	/*    */         {
	/* 49 */           des = des + URLEncoder.encode(String.valueOf(src.charAt(i)), "GB2312"); } catch (Exception localException) {
	/*    */         }
	/*    */       }
	/*    */     }
	/* 53 */     return des;
	/*    */   }
/*    */ 
/*    */   public static void main(String[] args)
/*    */   {
/*    */   }
/*    */ }
