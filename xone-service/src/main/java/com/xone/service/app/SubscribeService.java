package com.xone.service.app;

import java.util.List;
import java.util.Map;
import com.xone.model.hibernate.entity.Subscribe;

public interface SubscribeService {

	public Subscribe save(Subscribe entity);

	public Subscribe findById(Long id);

	public List<Subscribe> findAllByMap(Map<String, String> params);
}