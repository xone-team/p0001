package com.xone.webtools;

import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import javax.imageio.ImageIO;

public class ImageEncode {
	/**
	 * @param args
	 */
	public static String simage;

	public static void main(String[] args) {
		try {
			File f = new File("C:/Users/Hunny/Desktop/7.PNG");
			BufferedImage image = ImageIO.read(f);

			if (image != null) {
				try {
					java.io.ByteArrayOutputStream os = new java.io.ByteArrayOutputStream();
					ImageIO.write(image, "jpg", os);
					byte[] data = os.toByteArray();
					simage = new sun.misc.BASE64Encoder().encode(data);

					// write to file the encoded character
					FileOutputStream fout = null;
					OutputStreamWriter out = null;
					OutputStream bout = null;
					fout = new FileOutputStream("C:/Users/Hunny/Desktop/encodedImage.txt");
					bout = new BufferedOutputStream(fout);
					out = new OutputStreamWriter(bout, "utf-8");
					out.write(simage);
					out.close();

				} catch (java.lang.Exception ex2) {
					System.out.println("Exception: " + ex2);
					ex2.printStackTrace();
				}
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
