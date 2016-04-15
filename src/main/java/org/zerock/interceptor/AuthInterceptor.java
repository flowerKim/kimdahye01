package org.zerock.interceptor;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.zerock.service.UserService;

public class AuthInterceptor extends HandlerInterceptorAdapter {
  
  private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
  
  @Inject
  private UserService service;
  
  
  @Override
  public boolean preHandle(HttpServletRequest request,
      HttpServletResponse response, Object handler) throws Exception {
    
    HttpSession session = request.getSession();
    
    
    if (session.getAttribute("login") == null) {
      
      System.out.println("current user is not logined");
      
      saveDest(request);
      
      response.sendRedirect("/user/login");
      return false;
    }
    return true;
  }

  private void saveDest(HttpServletRequest req) {

    String uri = req.getRequestURI();

    String query = req.getQueryString();

    if (query == null || query.equals("null")) {
      query = "";
    } else {
      query = "?" + query;
    }

    if (req.getMethod().equals("GET")) {
      System.out.println("dest: " + (uri + query));
      req.getSession().setAttribute("dest", uri + query);
    }
  }    

}
