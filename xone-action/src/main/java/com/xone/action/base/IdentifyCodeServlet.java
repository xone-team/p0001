package com.xone.action.base;

import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IdentifyCodeServlet extends HttpServlet {

	private static final long serialVersionUID = 2068809620780074262L;
	public static final String IDENTIFY_CODE_KEY = "IDENTIFY_CODE_KEY";

	public IdentifyCodeServlet() {
		super();
	}

	public void init() throws ServletException {
		super.init();
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 设置不缓存图片
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "No-cache");
		response.setDateHeader("Expires", 0);
		// 指定生成的相应图片
		response.setContentType("image/jpeg");
		IdentifyCode idCode = new IdentifyCode();
		BufferedImage image = new BufferedImage(idCode.getWidth(),
				idCode.getHeight(), BufferedImage.TYPE_INT_BGR);
		Graphics2D g = image.createGraphics();
		// 定义字体样式
		Font myFont = new Font("黑体", Font.BOLD, 20);
		// 设置字体
		g.setFont(myFont);
		g.setColor(idCode.getRandomColor(200, 250));
		// 绘制背景
		g.fillRect(0, 0, idCode.getWidth(), idCode.getHeight());
		g.setColor(idCode.getRandomColor(180, 200));
		idCode.drawRandomLines(g, 32);
		String identifyCode = idCode.drawRandomString(4, g);
		request.getSession().setAttribute("IDENTIFY_CODE_KEY", identifyCode);
		g.dispose();
		ImageIO.write(image, "JPEG", response.getOutputStream());
	}
}
