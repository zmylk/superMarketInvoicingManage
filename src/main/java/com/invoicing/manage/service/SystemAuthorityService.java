package com.invoicing.manage.service;

import com.invoicing.manage.entity.SystemAuthorityEntity;

import java.util.Map;
import java.util.List;

import com.invoicing.manage.comment.entity.PageInfo;
/**
 *
 * @time 2017年07月27日 20:20:48
 * @version 1.0
 *
 **/

public interface SystemAuthorityService  {
  	/**
	 * 通过主键id 删除
	 * @param id
	 * @return
	 */
	int deleteByPrimaryKey(Long id);
	/**
	 * 插入实体
	 * @param record
	 * @return
	 */
	int insertSelective(SystemAuthorityEntity record);
	/**
	 * 通过主键id 获取实体对象
	 * @param id
	 * @return
	 */
	SystemAuthorityEntity selectByPrimaryKey(Long id);
	/**
	 * 通过主键id 更新实体
	 * @param record
	 * @return 1成功  其它失败
	 */
	int updateByPrimaryKeySelective(SystemAuthorityEntity record);
	/**
	 * 通过map参数获取列表
	 * @param params
	 * @return List<SystemAuthorityEntity>
	 */
	List<SystemAuthorityEntity> getList(Map<String,Object> params);
	/**
	 * 通过map参数获取列表 分页
	 * @param params
	 * @return PageInfo<SystemAuthorityEntity>
	 */
	PageInfo<SystemAuthorityEntity> getList(PageInfo<SystemAuthorityEntity> pageInfo,Map<String,Object> params);
	/**
	 * 通过map参数获取 总数
	 * @param params
	 * @return int
	 */
	int getListCount(Map<String,Object> params);
	
	/**
	 * getAuthMenuList 菜单列表 方法
	 * @param params（roleId：角色ID）
	 * @return 返回类型为 List<SystemAuthorityEntity>
	 * @exception
	 * @since JDK 1.7
	 */
	public List<SystemAuthorityEntity> getAuthMenuList(Long roleId);
	
	/**
	 * getZTree 加载菜单树方法
	 * @param params
	 * @return 返回类型为 List<SystemAuthorityEntity>
	 * @exception
	 * @since JDK 1.7
	 */
	List<SystemAuthorityEntity> getZTree(Map<String,Object> params);

}