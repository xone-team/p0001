package com.xone.statics;

import java.awt.*;  
import java.awt.image.BufferedImage;  

public class ShowPictureSevlet {
//	 extends HttpServlet
//	 private static final String GIF="image/gif;charset=GB2312";
//	 public void init()   
//			 throws ServletException     {     }     
//			  public void doGet(HttpServletRequest request, HttpServletResponse response)                    
//			throws IOException, ServletException     
//			  {        doPost(request, response);     }     
//			 public void doPost(HttpServletRequest request, HttpServletResponse response)                  
//			 throws IOException, ServletException   
//			  {                  
//			String spec=request.getParameter("spec");  
//			//输出图片的类型的标志  
//			 int int_spec=Integer.parseInt(spec);       
//			   if(spec==1)            {        
//			      String imagePath="/jfgg/b1.jpg";  
//			//图片相对web应用的位置        }         
//			 else        {              
//			  String imagePath="/jfgg/b2.gif"; 
//			 }               
//		      OutputStream output = response.getOutputStream();//得到输出流        
//		 
//		if(imagePath.toLowerCase().endsWith(".jpg"))//使用编码处理文件流的情况：     
//		 
//		   {     response.setContentType(JPG);//设定输出的类型          
//		  //得到图片的真实路径                
//		  imagePath = getServletContext().getRealPath(imagePath);
//		  InputStream imageIn = new FileInputStream(new File(imagePath));         
//		  //得到输入的编码器，将文件流进行jpg格式编码     
//		  JPEGImageDecoder decoder = JPEGCodec.createJPEGDecoder(imageIn);         //得到编码后的图片对象           
//		BufferedImage image = decoder.decodeAsBufferedImage();   //得到输出的编码器   
//		 
//		JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(output);        
//		 
//		    encoder.encode(image);//对图片进行输出编码       
//		     imageIn.close();//关闭文件流       }      
//		 
//		   if(imagePath.toLowerCase().endsWith(".gif"))//不使用编码处理文件流的情况：    
//		 
//		    {    response.setContentType(GIF);    ServletContext context = getServletContext();//得到背景对象   
//		 
//		   InputStream imageIn=context.getResourceAsStream(imagePath);//文件流          
//		 
//		BufferedInputStream bis=new BufferedInputStream(imageIn);//输入缓冲流      
//		 
//		BufferedOutputStream bos=new BufferedOutputStream(output);//输出缓冲流     
//		 
//		byte data[]=new byte[4096];//缓冲字节数    
//		 
//		  int size=0;     size=bis.read(data);     
//		 while (size!=-1)    {        
//		 bos.write(data,0,size);            
//		  size=bis.read(data);    }     
//		 bis.close();    bos.flush();//清空输出缓冲流     
//		      bos.close();    }      
//		  output.close();    } 

}
