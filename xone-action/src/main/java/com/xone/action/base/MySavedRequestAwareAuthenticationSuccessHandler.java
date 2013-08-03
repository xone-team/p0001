package com.xone.action.base;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import com.xone.model.hibernate.entity.Person;
import com.xone.service.app.PersonService;

public class MySavedRequestAwareAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
    
    @Autowired
    PersonService personService;
    
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws ServletException, IOException {
        Map<String, String> loginedUser = new HashMap<String, String>();
        if(authentication != null && authentication instanceof UsernamePasswordAuthenticationToken){
            UsernamePasswordAuthenticationToken u = (UsernamePasswordAuthenticationToken) authentication;
            String username = ((UserDetails)u.getPrincipal()).getUsername();
            if("admin".equals(username)){
                loginedUser.put("username", "admin");
                loginedUser.put("nickName", "管理员");
            }else{
                Map<String, String> params = new HashMap<String, String>();
                params.put("username", username);
                List<Person> list = personService.findAllByMap(params);
                if(list != null && list.size() > 0){
                    Person p = list.get(0);
                    loginedUser.put("username", p.getUsername());
                    loginedUser.put("nickName", p.getNickName() == null ? p.getUsername() : p.getNickName());
                }
            }
        }
        request.getSession().setAttribute("loginedUser", loginedUser);
        super.onAuthenticationSuccess(request, response, authentication);
    }

    public PersonService getPersonService() {
        return personService;
    }

    public void setPersonService(PersonService personService) {
        this.personService = personService;
    }
    
    

}
