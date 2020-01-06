package aaa;
import java.sql.*;
public class DBOperate_xuexi
{
	Statement st;
	Connection con;
	ResultSet rs;
	/*
	public void  connection() throws Exception
	{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con=DriverManager.getConnection("jdbc:odbc:datastruct","root","");
			st=con.createStatement();
	}
	*/
	public void  connection() throws Exception
	{
		//ODBC
		//Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		//con=DriverManager.getConnection("jdbc:odbc:SEcourse","root","root");
		
		//JDBC
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost/SEcourse?user=root&password=root");
			//st=con.createStatement();
			st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
	}
	
	public ResultSet ListQuestion() throws Exception//��Ŀ�б�
	{
		connection();
		rs=st.executeQuery("select * from t_question order by qID ASC");
		return rs;
	}
	public ResultSet TypeQuestion(int type) throws Exception//��Ŀ����
	{
		connection();
		rs=st.executeQuery("select * from t_question where type="+type);
		return rs;
	}
	public ResultSet ZhangjieQuestion(int zhangjie) throws Exception//��Ŀ����
	{
		connection();
		rs=st.executeQuery("select * from t_question where zhangjie="+zhangjie);
		return rs;
	}
	public ResultSet viewQuestion(int id) throws Exception//�鿴��Ŀ
	{
		connection();
		rs=st.executeQuery("select * from t_question where qID="+id);
		return rs;
	}

	public void AddNewQuestion(String question,String answer,int zhengjie,int type) throws Exception//������Ŀ
	{
		//String date=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
		connection();
		st.executeUpdate("insert into t_question (question,answer,zhangjie,type) values('"+question+"','"+answer+"',"+zhengjie+","+type+")");
		
	}
	
	public void UpdateQuestion(int qID,String question,String answer,int zhangjie,int type) throws Exception//�޸���Ŀ
	{
		//String date=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
		connection();
		st.executeUpdate("update t_question set question='"+question+"',answer='"+answer+"',zhangjie="+zhangjie+",type="+type+" where qID="+qID);
		
	}
	
	public void DeleteQuestion(int qID) throws Exception//ɾ����Ŀ
	{
		
		connection();
		st.executeUpdate("delete from t_question where qID="+qID);		
		
	}
	
	public void closeCon() throws Exception
	{
		con.close();
	}
}