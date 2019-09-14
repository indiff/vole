package com.chinasofti.app.gateway.feign;


import com.chinasofti.app.gateway.entity.vo.PermissionVO;
import com.chinasofti.app.gateway.feign.fallback.RemotePermissionServiceFallbackImpl;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.Set;


@FeignClient(name = "app-mps", fallback = RemotePermissionServiceFallbackImpl.class)
public interface RemotePermissionService {
    /**
     * 通过角色名查询菜单
     *
     * @param role 角色名称
     * @return 菜单列表
     */
    @GetMapping(value = "/rest/permission/findPermissionByRole/{role}")
    Set<PermissionVO> findPermissionByRole(@PathVariable("role") String role);
}
