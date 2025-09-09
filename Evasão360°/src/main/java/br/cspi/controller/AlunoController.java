package br.cspi.controller;

import br.cspi.model.Alunos;
import br.cspi.service.AlunoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class AlunoController {
    private final AlunoService alunoService;
    public AlunoController(AlunoService alunoService) {
        this.alunoService = alunoService;
    }

    @GetMapping("/home")
    public String viewHome(Model model) {
//        AlunoService service = new AlunoService();
//        List<Alunos> alunos = service.getAlunos();
        List<Alunos> alunos = alunoService.getAlunos();
        model.addAttribute("alunos", alunos);
        //retorna home.jsp
        return "home";
    }
}
