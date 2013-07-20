package com.xone.service.app;

import java.util.List;
import java.util.Map;
import com.xone.model.hibernate.entity.UserRoles;

public interface UserRolesService {

	public UserRoles save(UserRoles entity);

	public UserRoles findById(Long id);

	public List<UserRoles> findAllByMap(Map<String, String> params);
}