package com.xone.action.app.assistant;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;

import com.xone.action.base.Action;
import com.xone.model.hibernate.entity.ImageUploaded;
import com.xone.service.app.ImageUploadedService;

public class AssistantAction extends Action {
	
	private static final long serialVersionUID = -334632510092302567L;

	@Autowired
	protected ImageUploadedService imageUploadedService;
	
	protected String imageUploadPath;
	
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
//			BufferedImage bufferedImage = ImageUtils.decodeToImage(imageUploaded.getImage());
//			String type = StringUtils.isBlank(imageUploaded.getImageType()) ? "image/jpeg" : imageUploaded.getImageType();
//			response.setContentType(type);
//			OutputStream out = response.getOutputStream();
//			ImageIO.write(bufferedImage, type.replaceFirst("image/", ""), out);
//			out.close();
			OutputStream output = response.getOutputStream();//得到输出流
			String filename = "photo-not-available.jpg";
			String contentType = "image/jpg";
			if (null != imageUploaded && null != imageUploaded.getImage()) {
				filename = imageUploaded.getImage();
				contentType = null == imageUploaded.getImageType() ? "image/*" : imageUploaded.getImageType();
			}
			File file = new File(getImageUploadPath());
			File imageFile = new File(file.getCanonicalPath() + File.separator + filename);
			InputStream imageIn = new FileInputStream(imageFile);
			byte data[] = new byte[1000];
            while (imageIn.read(data) > 0) {
            	output.write(data);  
            }  
            imageIn.close();
//            response.setHeader("Content-Type", getServletContext().getMimeType(image.getFilename()));
            response.setHeader("Content-Disposition", "inline; filename=\"" + imageFile.getName() + "\"");
            response.setContentType(contentType); // 设置返回的文件类型  
            output.write(data); // 输出数据
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
	
	public String getImageUploadPath() {
		return imageUploadPath;
	}

	public void setImageUploadPath(String uploadPath) {
		this.imageUploadPath = uploadPath;
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
