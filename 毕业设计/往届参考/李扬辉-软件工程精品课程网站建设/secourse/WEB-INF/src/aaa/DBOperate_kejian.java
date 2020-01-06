package aaa;

import java.sql.*;

public class DBOperate_kejian {
	Statement st;
	Connection con;
	ResultSet rs;

	public void connection() throws Exception {
		//ODBC
		//Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		//con=DriverManager.getConnection("jdbc:odbc:SEcourse","root","root");
		
		//JDBC
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost/SEcourse?user=root&password=root&characterEncoding=gb2312");
		st = con.createStatement();
	}

	public ResultSet getResult(String sqlstring) throws Exception {
		try {
			connection();
			rs = st.executeQuery(sqlstring);

		} catch (Exception ex) {
			System.out.println("in getResult() : "+ex.getMessage());
		}
		return rs;
	}

	public int executeSQLUpdate(String sql) throws Exception {
		int result = 0;
		try {
			connection();
			result = this.st.executeUpdate(sql);
		} catch (Exception ex) {
			System.err.print(ex.getMessage());
		}
		return result;
	}

	public ResultSet getKejian() throws Exception
	{
		connection();
		rs = st.executeQuery("select * from t_File where fileType='CouseWare' order by fileTime desc");
		return rs;
	}

	public ResultSet getVideo() throws Exception
	{
		connection();
		rs = st.executeQuery("select * from t_File where fileType='Video' order by fileTime desc");
		return rs;
	}

	public ResultSet getAll() throws Exception
	{
		connection();
		rs = st.executeQuery("select * from t_File order by fileTime desc");
		return rs;
	}

	public ResultSet getTask() throws Exception
	{
		connection();
		rs = st.executeQuery("select * from t_File where fileType='Task' order by fileTime desc");
		return rs;
	}
	
	public ResultSet getShiyan() throws Exception
	{
		connection();
		rs = st.executeQuery("select * from t_File where fileType='shiyan' order by fileTime desc");
		return rs;
	}

	public void closeCon() throws Exception {
		con.close();
	}
}