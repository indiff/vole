package com.chinasofti.app.portal.common.fegin;

import com.chinasofti.app.portal.common.fegin.fallback.MenuServiceFallbackImpl;
import com.chinasofti.app.portal.common.vo.SysMenuVO;
import com.chinasofti.app.portal.common.vo.TreeMenu;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;
import java.util.Set;

@FeignClient(name = "vole-portal-data",  fallback = MenuServiceFallbackImpl.class)
public interface MenuService {

    @GetMapping("/menu/findTreeMenusByUserId/{id}")
    List<TreeMenu> findTreeMenusByUserId(@PathVariable("id") String userId);

    @GetMapping("/menu/findMenusByRole/{role}")
    Set<SysMenuVO> findMenusByRole(@PathVariable("role") String roleCode);
}
