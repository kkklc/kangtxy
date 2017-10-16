package com.kangtxy.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.kangtxy.dao.UserDao;
import com.kangtxy.entity.User;

@Controller
public class KtxyController {
	
	@RequestMapping(value="")
	public String Index(Model model){
		//如果代码中有用ClassPathXmlApplicationContext去加载spring配置文件，那么每次运行到此处代码，spring都会重新获得一个数据库连接。
		//如果浏览量太大就会导致超出数据库连接
		//用static是一种办法，不是很好的办法
//		ApplicationContext ctx = new ClassPathXmlApplicationContext("jdbc-context.xml");
//        UserDao userDao=(UserDao) ctx.getBean("userDao");
//        User user=new User();
//        //添加两条数据
//        user.setId("aaa");
//        user.setUsername("klc1");
//        user.setPassword("666");
//        userDao.addUser(user);
//        user.setId("bbb");
//        user.setUsername("klc2");
//        user.setPassword("666");
//        userDao.addUser(user);
//        System.out.println("添加成功");
//        //查询数据
//        user.setUsername("klc1");
//        user.setPassword("666");
//        System.out.println(userDao.getUser(user).toString());
//        user.setUsername("klc2");
//        user.setPassword("666");
//        System.out.println(userDao.getUser(user).toString());
//        //修改数据
//        user.setId("ccc");
//        user.setPassword("777");
//        userDao.updateUser(user);
//        System.out.println("修改成功");
//        //删除数据
//        userDao.deleteUser("ccc");
//        System.out.println("删除成功");
        
//		WebApplicationContext wac = ContextLoader.getCurrentWebApplicationContext();
//		UserDao userDao=(UserDao) wac.getBean("userDao");
//		User user=new User();
//		user.setId("klc");
//		user.setUsername("klc");
//		user.setPassword("klc");
//		userDao.addUser(user);
//		
		return "simple/SimpleIndex";
	}
	@RequestMapping(value="simple/Imsimple")
	public String imsimple(Model model){
		return "simple/Imsimple";
	}
	@RequestMapping(value="simple/Build_blog1")
	public String build_blog(Model model){
		return "simple/Build_blog";
	}
	@RequestMapping(value="simple/Build_blog2")
	public String build_blog2(Model model){
		return "simple/Build_blog2";
	}
	@RequestMapping(value="simple/Project_bs1")
	public String project_bs1(Model model){
		return "simple/Project_bs1";
	}
	@RequestMapping(value="simple/Project_bs2")
	public String project_bs2(Model model){
		return "simple/Project_bs2";
	}
	@RequestMapping(value="simple/Svn_control")
	public String svn_control(Model model){
		return "simple/Svn_control";
	}
	@RequestMapping(value="simple/Oracle_function1")
	public String oracle_function1(Model model){
		return "simple/Oracle_function1";
	}
	@RequestMapping(value="simple/Java_swing")
	public String Java_swing(Model model){
		return "simple/Java_swing";
	}
	@RequestMapping(value="simple/Export_excel")
	public String export_excel(Model model){
		return "simple/Export_excel";
	}
	
}
