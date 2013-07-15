package com.xone.action.app.assistant;

import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.imageio.ImageIO;

import org.apache.commons.lang.xwork.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.Action;
import com.xone.action.utils.ImageUtils;
import com.xone.model.hibernate.entity.ImageUploaded;
import com.xone.service.app.ImageUploadedService;

public class AssistantAction extends Action {
	
	@Autowired
	protected ImageUploadedService imageUploadedService;
	
	protected String redirect;
	protected Long id;

	public String main() {
		if (null == getUserMap() || getUserMap().isEmpty()) {
			setRedirect("assistant/index.html");
			return "redirect";
		}
		return SUCCESS;
	}
	
	public String image() {
		try {
			if (null == id || id <= 0) {
				redirectToPhotoNotAvailable();
				return null;
			}
			ImageUploaded imageUploaded = getImageUploadedService().findById(id);
			BufferedImage bufferedImage = ImageUtils.decodeToImage(imageUploaded.getImage());
			String type = StringUtils.isBlank(imageUploaded.getImageType()) ? "image/jpeg" : imageUploaded.getImageType();
			response.setContentType(type);
			OutputStream out = response.getOutputStream();
			ImageIO.write(bufferedImage, type.replaceFirst("image/", ""), out);
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
			redirectToPhotoNotAvailable();
		}
		return null;
	}
	
	protected void redirectToPhotoNotAvailable() {
		try {
			response.sendRedirect(getStaticRoot() + "/image/photo-not-available.jpg");
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	/**
	 * 输出图片
	 * @param contextType
	 * @param len
	 * @param inputStream
	 * @throws IOException
	 */
	protected void outputImage(String contextType, int len, InputStream inputStream) throws IOException {
		BufferedInputStream input = null;
		BufferedOutputStream output = null;
		try {
			response.setContentType("image/jpeg");
//			response.setContentLength(len);
		    input = new BufferedInputStream(inputStream);
		    output = new BufferedOutputStream(response.getOutputStream());
		    byte[] buffer = new byte[8192];
		    for (int length = 0; (length = input.read(buffer)) > 0;) {
		        output.write(buffer, 0, length);
		    }
		} finally {
			if (output != null) {
				try {
					output.close();
				} catch (IOException logOrIgnore) {
				}
			}
			if (input != null) {
				try {
					input.close();
				} catch (IOException logOrIgnore) {
				}
			}
		}
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getRedirect() {
		return redirect;
	}

	public void setRedirect(String redirect) {
		this.redirect = redirect;
	}

	public ImageUploadedService getImageUploadedService() {
		return imageUploadedService;
	}

	public void setImageUploadedService(ImageUploadedService imageUploadedService) {
		this.imageUploadedService = imageUploadedService;
	}
	
}
