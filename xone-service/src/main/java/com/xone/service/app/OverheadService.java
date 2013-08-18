package com.xone.service.app;

import java.util.List;
import java.util.Map;

import com.xone.model.hibernate.entity.Overhead;
import com.xone.model.hibernate.support.Pagination;

public interface OverheadService {
  public Overhead save(Overhead entity);

  public Overhead update(Overhead entity);

  public Overhead findById(Long id);

  public void delete(Overhead entity);

  public List<Overhead> findAllByMap(Map<String, String> params);

  public Overhead findByMap(Map<String, String> params);

  public Pagination findByParams(Map<String, String> params);

  public int countByRefIdAndType(Long refId, String overheadType, Long currentId);

}
