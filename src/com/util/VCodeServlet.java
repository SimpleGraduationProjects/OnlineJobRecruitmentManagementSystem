package com.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class VCodeServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6150210809149821126L;
	// 设置图形验证码中字符串的字体和大小
	private Font myFont = new Font("Arial Black", Font.PLAIN, 19);

	@Override
	public void init() throws ServletException {
		super.init();
	}

	// 生成随机颜色
	Color getRandColor(int fc, int bc) {
		Random random = new Random();
		if (fc > 255)
			fc = 255;
		if (bc > 255)
			bc = 255;
		int r = fc + random.nextInt(bc - fc);
		int g = fc + random.nextInt(bc - fc);
		int b = fc + random.nextInt(bc - fc);
		return new Color(r, g, b);
	}

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 阻止生成的页面内容被缓存，保证每次重新生成随机验证码
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/jpeg");
		// 指定图形验证码图片的大小
		int width = 100, height = 30;
		// 生成一张新图片
		BufferedImage image = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_RGB);
		// 在图片中绘制内容
		Graphics g = image.getGraphics();
		Random random = new Random();
		g.setColor(getRandColor(150, 200));
		g.fillRect(1, 1, width - 1, height - 1);
		g.setColor(new Color(102, 102, 102));
		g.drawRect(0, 0, width - 1, height - 1);
		g.setFont(myFont);
		// 随机生成线条，让图片看起来更加杂乱
		g.setColor(getRandColor(160, 200));
		for (int i = 0; i < 155; i++) {
			int x = random.nextInt(width - 1);// 起点的x坐标
			int y = random.nextInt(height - 1);// 起点的y坐标
			int x1 = random.nextInt(6) + 1;// x轴偏移量
			int y1 = random.nextInt(12) + 1;// y轴偏移量
			g.drawLine(x, y, x + x1, y + y1);
		}
		// 随机生成线条，让图片看起来更加杂乱
		for (int i = 0; i < 70; i++) {
			int x = random.nextInt(width - 1);
			int y = random.nextInt(height - 1);
			int x1 = random.nextInt(12) + 1;
			int y1 = random.nextInt(6) + 1;
			g.drawLine(x, y, x - x1, y - y1);
		}

		// 该变量用来保存系统生成的随机字符串
		String sRand = "";
		for (int i = 0; i < 4; i++) {
			// 取得一个随机字符
			String tmp = getRandomChar();
			sRand += tmp;
			// 将系统生成的随机字符添加到图形验证码图片上
			g.setColor(new Color(20 + random.nextInt(110), 20 + random
					.nextInt(110), 20 + random.nextInt(110)));
			g.drawString(tmp, 15 * i + 10, 20);
		}

		// 取得用户Session
		HttpSession session = request.getSession(true);
		// 将系统生成的图形验证码添加
		session.setAttribute("vcode", sRand);
		g.dispose();
		// 输出图形验证码图片
		ImageIO.write(image, "JPEG", response.getOutputStream());

	}

	// 随机生成一个字符
	private String getRandomChar() {
		int rand = (int) Math.round(Math.random() * 2);// 将0～2的小数四舍五入生成整数
		long itmp = 0;
		// char ctmp = '\u0000';
		// 根据rand的值来决定是生成一个大写字母、小写字母和数字
		switch (rand) {
		// 生成大写字母的情形
		// case 1:
		// itmp = Math.round(Math.random() * 25 + 65);
		// ctmp = (char) itmp;
		// return String.valueOf(ctmp);
		// // 生成小写字母
		// case 2:
		// itmp = Math.round(Math.random() * 25 + 97);
		// ctmp = (char) itmp;
		// return String.valueOf(ctmp);
		// // 生成数字
		default:
			itmp = Math.round(Math.random() * 9);
			return String.valueOf(itmp);
		}
	}
}