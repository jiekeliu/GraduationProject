package aaa;

import java.sql.*;

public class DBOperate_wenti {
	Statement st;
	Connection con;
	ResultSet rs;

	/*
	 * public void connection() throws Exception {
	 * Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	 * con=DriverManager.getConnection("jdbc:odbc:datastruct","root","");
	 * st=con.createStatement(); }
	 */
	public void connection() throws Exception {
		//ODBC
		//Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		//con=DriverManager.getConnection("jdbc:odbc:SEcourse","root","root");
		
		//JDBC
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost/SEcourse?user=root&password=root");
		// st=con.createStatement();
		st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
				ResultSet.CONCUR_READ_ONLY);
	}

	public ResultSet ListWenti() throws Exception// �����б�
	{
		connection();
		rs = st
				.executeQuery("select * from wenti,user_information where wenti.userID=user_information.userID order by wentiID DESC");
		return rs;
	}

	public ResultSet viewWenti(int id) throws Exception// �鿴����
	{
		connection();
		rs = st
				.executeQuery("select * from wenti,user_information where wenti.userID=user_information.userID and wentiID="
						+ id);
		return rs;
	}

	public ResultSet viewHuifu(int id) throws Exception// �鿴�ظ�
	{
		connection();
		rs = st
				.executeQuery("select * from huifu,user_information where huifu.userID=user_information.userID and huifuID="
						+ id);
		return rs;
	}

	public ResultSet ListHuifu(int id) throws Exception// �ظ��б�
	{
		connection();
		rs = st
				.executeQuery("select * from huifu,user_information where huifu.userID=user_information.userID and wentiID="
						+ id + " order by huifuID ASC");// DESC
		return rs;
	}

	public void AddNewWenti(String title, String content, int userID)
			throws Exception// ���������
	{
		String date = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(new java.util.Date());
		connection();
		st
				.executeUpdate("insert into wenti (userID,wentiTitle,wentiContent,date) values("
						+ userID
						+ ",'"
						+ title
						+ "','"
						+ content
						+ "','"
						+ date + "')");

	}

	public void AddNewHuifu(int wentiID, String content, int userID)
			throws Exception// �ظ�
	{
		String date = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(new java.util.Date());
		connection();
		st
				.executeUpdate("insert into huifu (wentiID,userID,huifuContent,date) values("
						+ wentiID
						+ ","
						+ userID
						+ ",'"
						+ content
						+ "','"
						+ date + "')");

	}

	public void UpdateHuifu(int huifuID, String content) throws Exception// �޸Ļظ�
	{
		String date = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(new java.util.Date());
		connection();
		st.executeUpdate("update huifu set huifuContent='" + content
				+ "',editdate='" + date + "' where huifuID=" + huifuID);

	}

	public void UpdateWenti(int wentiID, String content, String title)
			throws Exception// �޸�����
	{
		String date = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(new java.util.Date());
		connection();
		st.executeUpdate("update wenti set wentiTitle='" + title
				+ "' , wentiContent='" + content + "',editdate='" + date
				+ "' where wentiID=" + wentiID);

	}

	public void DeleteWenti(int wentiID) throws Exception// ɾ������
	{

		connection();
		st.executeUpdate("delete from wenti  where wentiID=" + wentiID);
		st.executeUpdate("delete from huifu  where wentiID=" + wentiID);

	}

	public void DeleteHuifu(int huifuID) throws Exception// ɾ���ظ�
	{

		connection();
		st.executeUpdate("delete from huifu  where huifuID=" + huifuID);

	}

	public void closeCon() throws Exception {
		con.close();
	}
}