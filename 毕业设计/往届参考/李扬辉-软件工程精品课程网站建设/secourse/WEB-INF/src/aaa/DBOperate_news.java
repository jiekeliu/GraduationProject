package aaa;

import java.sql.*;

public class DBOperate_news {
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

	public ResultSet Listnews() throws Exception// 新闻列表
	{
		connection();
		rs = st.executeQuery("select * from news_t order by newsID DESC");// 降序
		return rs;
	}

	public ResultSet viewNews(int id) throws Exception// 查看新闻
	{
		connection();
		rs = st.executeQuery("select * from news_t where newsID=" + id);
		return rs;
	}

	public void AddNews(String title, String content, String author)
			throws Exception// 增加新闻
	{
		String date = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(new java.util.Date());
		connection();
		st.executeUpdate("insert into news_t (title,content,author,date) values('"
						+ title
						+ "','"
						+ content
						+ "','"
						+ author
						+ "','"
						+ date + "')");

	}

	public void UpdateNews(int newsID, String title, String content,
			String author) throws Exception// 修改题目
	{
		String date = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(new java.util.Date());
		connection();
		st.executeUpdate("update news_t set tilte='" + title + "',content='"
				+ content + "',author='" + author + "',update_date='" + date
				+ "' where newsID=" + newsID);

	}

	public void DeleteNews(int newsID) throws Exception// 删除题目
	{

		connection();
		st.executeUpdate("delete from news_t where newsID=" + newsID);
	}

	public void closeCon() throws Exception {
		con.close();
	}
}