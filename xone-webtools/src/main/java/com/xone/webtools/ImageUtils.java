package com.xone.webtools;

import java.io.IOException;

import sun.misc.BASE64Encoder;
import sun.misc.BASE64Decoder;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileReader;
import java.awt.image.BufferedImage;

import javax.imageio.ImageIO;

public class ImageUtils {

	/**
	 * Decode string to image
	 * 
	 * @param imageString
	 *            The string to decode
	 * @return decoded image
	 */
	public static BufferedImage decodeToImage(String imageString) {

		BufferedImage image = null;
		byte[] imageByte;
		try {
			BASE64Decoder decoder = new BASE64Decoder();
			imageByte = decoder.decodeBuffer(imageString);
			ByteArrayInputStream bis = new ByteArrayInputStream(imageByte);
			image = ImageIO.read(bis);
			bis.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return image;
	}

	/**
	 * Encode image to string
	 * 
	 * @param image
	 *            The image to encode
	 * @param type
	 *            jpeg, bmp, ...
	 * @return encoded string
	 */
	public static String encodeToString(BufferedImage image, String type) {
		String imageString = null;
		ByteArrayOutputStream bos = new ByteArrayOutputStream();

		try {
			ImageIO.write(image, type, bos);
			byte[] imageBytes = bos.toByteArray();

			BASE64Encoder encoder = new BASE64Encoder();
			imageString = encoder.encode(imageBytes);

			bos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return imageString;
	}

	public static void main(String args[]) throws IOException {
//		String filename = "8435c8d3jw1e1gj2xrig1j.jpg";
//		File file = new File("C:/Users/Hunny/Downloads/" + filename);
//		String name = file.getName();
//		String[] temp = name.split("\\.");
//		String suffix = name.substring(name.length() - temp[temp.length - 1].length());
//		/* Test image to string and string to image start */
//		BufferedImage img = ImageIO.read(file);
//		BufferedImage newImg;
//		String imgstr;
//		imgstr = encodeToString(img, suffix);
//		System.out.println(imgstr);
//		newImg = decodeToImage(imgstr);
//		ImageIO.write(newImg, suffix, new File("C:/Users/Hunny/Desktop/" + System.currentTimeMillis() + "." + suffix));
//		/* Test image to string and string to image finish */

		
		
//		BufferedReader bufferedReader = new BufferedReader(new FileReader("C:/Users/Hunny/Desktop/imagefile.txt"));
		BufferedReader bufferedReader = new BufferedReader(new FileReader("C:/Users/Hunny/Desktop/encodedImage.txt"));
		StringBuffer b = new StringBuffer();
		String text = null;
		while ((text = bufferedReader.readLine()) != null) {
			b.append(text + "\n");
			System.out.println(text);
		}
		bufferedReader.close();
		BufferedImage newImg = decodeToImage(b.toString());
		String suffix = "png";
		ImageIO.write(newImg, suffix, new File("C:/Users/Hunny/Desktop/" + System.currentTimeMillis() + "." + suffix));
	}
}
