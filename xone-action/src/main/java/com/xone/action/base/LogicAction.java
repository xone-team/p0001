package com.xone.action.base;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;

import com.xone.action.utils.ImageUtils;
import com.xone.model.hibernate.entity.ImageUploaded;
import com.xone.service.app.ImageUploadedService;

public abstract class LogicAction extends Action {

	private static final long serialVersionUID = 2053049281978266812L;
	
	protected String image(Long id, String imageUploadedPath, ImageUploadedService imageUploadedService) {
		try {
			if (null == id || id <= 0) {
				redirectToPhotoNotAvailable();
				return null;
			}
			ImageUploaded imageUploaded = imageUploadedService.findById(id);
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
			File file = new File(imageUploadedPath);
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
	
	@SuppressWarnings("unchecked")
	protected List<ImageUploaded> createImageByParams(String imageUploadedPath, ImageUploaded.RefType refType) {
		List<ImageUploaded> images = new ArrayList<ImageUploaded>();
		if (null == imageUploadedPath || null == refType) {
			return images;
		}
		Map<String, String[]> map = (Map<String, String[]>)getRequest().getParameterMap();
		if (null == map || map.isEmpty() || null ==  map.get("images")) {
			return images;
		}
		for (String image : map.get("images")) {
			String [] aImage = image.split(";base64,");
			if (aImage.length != 2 || !aImage[0].startsWith("data:")) {
				continue;
			}
			ImageUploaded iu = new ImageUploaded();
			iu.setImageType(aImage[0].replaceFirst("data:", ""));
			iu.setImage(null);
			iu.setRefType(refType.getValue());
			images.add(iu);
			String suffix = iu.getImageType().replaceFirst("image/", "");
			try {
				File file = new File(imageUploadedPath);
				if (!file.exists()) {
					file.mkdirs();
				}
				String filename = getUniqueId() + "." + suffix;
				ImageIO.write(ImageUtils.decodeToImage(aImage[1]), suffix, new File(file.getCanonicalPath() + File.separator + filename));
				iu.setImage(filename);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return images;
	}
	
}
