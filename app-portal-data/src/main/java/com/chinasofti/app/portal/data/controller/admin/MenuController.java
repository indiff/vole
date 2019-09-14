package com.chinasofti.app.portal.data.controller.admin;

import com.chinasofti.app.portal.data.model.vo.SysMenuVO;
import com.chinasofti.app.portal.data.model.vo.TreeMenu;
import com.chinasofti.app.portal.data.service.ISysMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController()
@RequestMapping("/menu")
public class MenuController {
    /**
     * 菜单服务
     */
    @Autowired
    private ISysMenuService sysMenuService;

    @GetMapping("/findTreeMenusByUserId/{id}")
    public List<TreeMenu> findTreeMenusByUserId (@PathVariable("id") String id){
       return  sysMenuService.selectTreeMenuByUserId(id);
    }

    @GetMapping("/findMenusByRole/{role}")
    public List<SysMenuVO> findMenuByRole (@PathVariable("role") String roleCode){
        return  sysMenuService.findMenusByRoleName(roleCode);
    }
}
