package br.cspi.controller;

import br.cspi.model.Usuario;
import br.cspi.service.LoginService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {
    private final LoginService loginService;

    public LoginController(LoginService loginService) {
        this.loginService = loginService;
    }


    @GetMapping("/") //default
    public String viewSobre() {
        //retorna index.jsp
        return "index";
    }

    @GetMapping("/login")
    public String viewLogin() {
        //retorna login.jsp
        return "login";
    }

    @GetMapping("/logout")
    public String handleLogout(HttpSession session) {
        session.invalidate();
        return "index";
    }

    @PostMapping("/login")
    public String login(String email, String senha, HttpSession session) {
        System.out.println("Realizando o login o usuario" + email);
        System.out.println(email);
        System.out.println(senha);


        Usuario user = this.loginService.autenticar(email, senha);

        if (user != null) {
            session.setAttribute("usuario", user);
            System.out.println("Login com sucesso");
            return "redirect:/home";
        } else {
//            model.addAttribute("msg", "Login ou senha incorreto!");
            return "login";
        }
    }

}
