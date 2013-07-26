package com.xone.webtools;

import java.awt.image.BufferedImage;
import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.imageio.ImageIO;

import org.apache.commons.lang3.StringUtils;

public class ExportImageToDisk {

	protected String driver;
	protected String url;
	protected String username;
	protected String password;
	
	public ExportImageToDisk(String driver, String url, String username, String password) {
		this.driver = driver;
		this.url = url;
		this.username = username;
		this.password = password;
	}
	
	/**
	 * 开始产生表properties及xml数据
	 * @param packageName
	 * @param tableName
	 * @throws Exception
	 */
	public void load(String filePath) throws Exception {
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, username, password); // MySQL
		Statement statement = conn.createStatement();//, image
		ResultSet resultSet = statement.executeQuery("select id, image_type, image from t_image_uploaded ");
		while (resultSet.next()) {
			Long id = resultSet.getLong(1);
			String imageType = resultSet.getString(2);
			System.out.println("id:" + id + " imageType:" + imageType);
			if (!StringUtils.isBlank(imageType)) {
				String image = resultSet.getString(3);
				BufferedImage newImg = ImageUtils.decodeToImage(image);
				String suffix = imageType.replaceFirst("image/", "");
				ImageIO.write(newImg, suffix, new File(filePath + id + "." + suffix));
			}
		}
		conn.close();
	}
	
	public static void main(String[] args) throws Exception {
		new ExportImageToDisk("com.mysql.jdbc.Driver", 
				"jdbc:mysql://mysqllocal.com:4306/sample?useUnicode=true&amp;characterEncoding=utf-8&amp;autoReconnect=true",
				"root", "admin").load("C:/Users/Hunny/Desktop/test/");
	}

}
