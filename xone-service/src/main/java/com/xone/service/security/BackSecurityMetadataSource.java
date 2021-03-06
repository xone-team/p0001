package com.xone.service.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;

import com.xone.model.hibernate.entity.Resources;
import com.xone.model.hibernate.entity.Roles;
import com.xone.service.app.ResourcesService;

/**
 * //1 加载资源与权限的对应关系
 * 
 */
public class BackSecurityMetadataSource implements
		FilterInvocationSecurityMetadataSource {

	/**
	 * TODO 该部分可改进到放入在Ehcache中，后期进行。
	 */
	private static Map<String, Collection<ConfigAttribute>> resourceMap = null;
    
    public static String CONSOLE_ADMIN = "CONSOLE_ADMIN";
    
	@Autowired
	private ResourcesService resourcesService;

	// 由spring调用
	public BackSecurityMetadataSource(ResourcesService resourcesService) {
		this.resourcesService = resourcesService;
		loadResourceDefine();
	}

	// 加载所有资源与权限的关系
	private void loadResourceDefine() {
		if (resourceMap == null) {
			resourceMap = new HashMap<String, Collection<ConfigAttribute>>();
			Map<String, String> params = new HashMap<String, String>();
			Map<Resources, List<Roles>> mapResourcesRoles = getResourcesService().findMapByParams(
					params);
			
			
			for (Map.Entry<Resources, List<Roles>> m : mapResourcesRoles.entrySet()) {
				Collection<ConfigAttribute> configAttributes = new ArrayList<ConfigAttribute>();
				List<Roles> rolesList = m.getValue();
				for (Roles roles : rolesList) {
					// 以权限名封装为Spring的security Object
					ConfigAttribute configAttribute = new SecurityConfig(
							roles.getName());
					configAttributes.add(configAttribute);
				}
				resourceMap.put(m.getKey().getResourceUrl(), configAttributes);
			}
		}

//		Set<Entry<String, Collection<ConfigAttribute>>> resourceSet = resourceMap
//				.entrySet();
//		Iterator<Entry<String, Collection<ConfigAttribute>>> iterator = resourceSet
//				.iterator();

	}

	/**
	 * 返回所请求资源所需要的权限
	 */
	@Override
	public Collection<ConfigAttribute> getAttributes(Object object)
			throws IllegalArgumentException {
		String requestUrl = ((FilterInvocation) object).getRequestUrl();
		System.out.println("requestUrl is " + requestUrl);
		if (null == resourceMap) {
			loadResourceDefine();
		}
		Set<String> urls = resourceMap.keySet();
		for (String url : urls) {
			if (requestUrl.matches(url)) {
				return resourceMap.get(url);
			}
		}
		// 增加后台管理员权限
		Collection<ConfigAttribute> configAttributes = new ArrayList<ConfigAttribute>();
        configAttributes.add(new SecurityConfig(CONSOLE_ADMIN));
		return configAttributes;
	}

	@Override
	public Collection<ConfigAttribute> getAllConfigAttributes() {
		return null;
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return true;
	}

	public ResourcesService getResourcesService() {
		return resourcesService;
	}

	public void setResourcesService(ResourcesService resourcesService) {
		this.resourcesService = resourcesService;
	}

}
