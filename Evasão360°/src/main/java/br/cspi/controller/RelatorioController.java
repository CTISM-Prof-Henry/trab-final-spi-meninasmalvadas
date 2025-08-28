package br.cspi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RelatorioController {

    @GetMapping("/relatorios")
    public String viewRelatorios() {
        //retorna relatorios.jsp
        return "relatorios";
    }
}
