package br.cspi.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
    //isso aqui ta incompleto


    @GetMapping("/login")
    public String viewLogin() {
        //retorna login.jsp
        return "login";
    }

    @GetMapping("/home")
    public String viewHome() {
        //retorna home.jsp
        return "home";
    }

    @GetMapping("/") //default
    public String viewSobre() {
        //retorna index.jsp
        return "index";
    }

    @GetMapping("/relatorios")
    public String viewRelatorios() {
        //retorna relatorios.jsp
        return "relatorios";
    }

    @GetMapping("/logout")
    public String handleLogout(HttpSession session) {
        session.invalidate();
        return "index";
    }
}
