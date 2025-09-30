package br.cspi.controller;

import br.cspi.dao.CentroDAO;
import br.cspi.model.Alunos;
import br.cspi.model.Centros;
import br.cspi.model.Cursos;
import br.cspi.service.AlunoService;
import br.cspi.service.CursoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
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
        List<Centros> centros = new CentroDAO().getCentros();
        List<Cursos> cursos = new CursoService().getCursos();
        model.addAttribute("alunos", alunos);
        model.addAttribute("centros", centros);
        model.addAttribute("cursos", cursos);
        //retorna home.jsp
        return "home";
    }
}
