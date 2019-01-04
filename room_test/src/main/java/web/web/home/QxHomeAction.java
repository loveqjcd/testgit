package main.java.web.web.home;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.google.gson.JsonObject;
import main.java.common.util.StrUtils;
import main.java.common.util.date.DateUtils;
import main.java.web.web.util.XXSessionHelper;
import main.java.web.web.util.view.JsonView;

/**
 * @author 6.   
 * @time 2015年1月8日 下午2:33:44
 */

public class QxHomeAction extends MultiActionController {
	
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		return new ModelAndView("home/qxHome", map);
	}
	
}
