package com.xone.webtools;

import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

public class TestXmlParse {

	public static void main(String[] args) throws Exception {
		URL u = new URL("http://localhost:8080/xone-app/assistant/subscribe.html");
        URLConnection uc = u.openConnection();
		InputStream inputStream = uc.getInputStream();
//		XmlParser.parse(is);
		Map<String, List<Map<String, String>>> mapResult = new HashMap<String, List<Map<String, String>>>();
		if (inputStream != null) {
//			ByteArrayOutputStream baos = new ByteArrayOutputStream();
//			byte[] buf = new byte[128];
//			int ch = -1;
//			// int count = 0;
//			while ((ch = is.read(buf)) != -1) {
//				baos.write(buf, 0, ch);
//				// count += ch;
//				// if (length > 0) {
//				// // 如果知道响应的长度，调用publishProgress（）更新进度
//				// publishProgress((int) ((count / (float) length) *
//				// 100));
//				// }
//			}
//			s = new String(baos.toByteArray());
			DocumentBuilder db = DocumentBuilderFactory.newInstance().newDocumentBuilder();
			InputSource inputSource = new InputSource();
			inputSource.setByteStream(inputStream);
			Document doc = db.parse(inputSource);
			if (null == doc) {
//				return Collections.emptyMap();
			}
			NodeList roots = doc.getChildNodes();
			if (null == roots || roots.getLength() <= 0 || null == (roots = roots.item(0).getChildNodes())) {
//				return Collections.emptyMap();
			}
			for (int i = 0; i < roots.getLength(); i++) {
				Node element = roots.item(i);
				if (null == element || Node.ELEMENT_NODE != element.getNodeType()) {
					continue;
				}
				String nodeName = element.getNodeName();
				List<Map<String, String>> list = mapResult.get(nodeName);
				if (null == list) {
					list = new ArrayList<Map<String, String>>();
				}
				NodeList childNodes = element.getChildNodes();
				if (null != childNodes && childNodes.getLength() > 0) {
					for (int n = 0; n < childNodes.getLength(); n++) {
						Map<String, String> map = new HashMap<String, String>();
						Node item = childNodes.item(n);
						if (null != item && Node.ELEMENT_NODE == item.getNodeType()) {
							Node child = item.getFirstChild();
							if (null != child && Node.TEXT_NODE == child.getNodeType()) {
								map.put(item.getNodeName(), child.getNodeValue());
								NamedNodeMap attrs = item.getAttributes();
								for (int m = 0; m < attrs.getLength(); m++) {
									Node attr = attrs.item(m);
									map.put(attr.getNodeName(), attr.getNodeValue());
								}
							}
						}
						if (!map.isEmpty()) {
							list.add(map);
						}
					}
				}
				mapResult.put(nodeName, list);
			}
//			inputSource.setCharacterStream(new StringReader(s));
		}
//		return mapResult;// 返回结果
		System.out.println(mapResult);
	}

}
