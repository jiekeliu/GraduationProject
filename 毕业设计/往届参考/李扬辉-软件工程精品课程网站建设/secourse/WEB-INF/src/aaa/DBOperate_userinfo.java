package aaa;
import java.sql.*;
public class DBOperate_userinfo
{
	Statement st;
	Connection con;
	ResultSet rs;	
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
	public ResultSet loginOp(String username,String password) throws Exception//登录
	{
		connection();
		rs=st.executeQuery("select * from user_information where username='"+username+"' and mima='"+password+"'");
		return rs;
	}
	public ResultSet viewInfo(String username) throws Exception//查询
	{
		connection();
		rs=st.executeQuery("select * from user_information where username='"+username+"'");
		return rs;
	}
	public ResultSet listInfo() throws Exception//查询全部
	{
		connection();
		rs=st.executeQuery("select * from user_information ");
		return rs;
	}
	public boolean updatePassword(String username,String password,String newPass) throws Exception//修改密码
	{
		connection();
		rs=st.executeQuery("select * from user_information where username='"+username+"' and mima='"+password+"'");
		if (rs.next())
		{
			st.executeUpdate("update user_information set mima='"+newPass+"' where username='"+username+"'");
			return true;
		}
		return false;
		
	}
	public boolean updateUsername(String newUsername,String username) throws Exception//修改用户名
	{
		connection();
		rs=st.executeQuery("select * from user_information where username='"+newUsername+"'");
		if (rs.next())
		{			
			
			return false;//该用户名已存在
		}
		
		st.executeUpdate("update user_information set username='"+newUsername+"' where username='"+username+"'"); 
		
		return true;
	}
	public int AddNewUser(String username,String mima) throws Exception//注册新用户
	{
		connection();		
		rs=st.executeQuery("select * from user_information where username='"+username+"'");
		if (rs.next())
		{
			return 1;//该用户名已存在
		}
		st.executeUpdate("insert into user_information (username,mima) values('"+username+"','"+mima+"')");
		return 0;
	}

	public void DeleteUser(String xuehao) throws Exception//删除用户
	{
		connection();
		st.executeUpdate("delete from user_information where xuehao='"+xuehao+"'");
		
	}
	public void DeleteUser2(String username) throws Exception//删除用户
	{
		connection();
		st.executeUpdate("delete from user_information where username='"+username+"'");
		
	}
	
	public void closeCon() throws Exception
	{
		con.close();
	}
}