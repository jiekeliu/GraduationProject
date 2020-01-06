package aaa;
import java.sql.*;
public class DBOperate_admin
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
			st=con.createStatement();
	}
	public ResultSet AdminloginOp(String ID,String password) throws Exception//µÇÂ¼
	{
		connection();
		rs=st.executeQuery("select * from t_admin where AdminID='"+ID+"' and password='"+password+"'");
		return rs;
	}
	
	public void closeCon() throws Exception
	{
		con.close();
	}
}