package cn.colg.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.colg.entity.Department;

/**
 * 部门Mapper
 *
 * @author colg
 */
public interface DepartmentMapper {
    
    /**
     * 获取所有的id
     *
     * @return id列表
     * @author colg
     */
    List<Integer> findAllId();

    /**
     * 根据id查询部门
     *
     * @param id
     * @return
     */
    Department findById(@Param("id") Integer id);

    /**
     * 根据id查询部门，把员工也查询出来；
     * 
     * 方式一：关联查询
     *
     * @param id
     * @return
     */
    Department findByIdPlus(@Param("id") Integer id);

    /**
     * 根据id查询部门，把员工也查询出来；
     * 
     * 方式二：分步查询
     *
     * @param id
     * @return
     */
    Department findByIdStep(@Param("id") Integer id);
    
    /**
     * 分组查询员工列表（每个部门）
     * 
     * 方式一：关联查询
     *
     * @return
     * @author colg
     */
    List<Department> selectGroupPlus();
    
    /**
     * 分组查询员工列表（每个部门）
     * 
     * 方式二：分步查询
     *
     * @return
     * @author colg
     */
    List<Department> selectGroupStep();
}
