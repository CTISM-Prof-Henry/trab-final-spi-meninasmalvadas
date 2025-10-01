package br.cspi.controller;

import br.cspi.dao.CentroDAO;
import br.cspi.model.Alunos;
import br.cspi.model.Centros;
import br.cspi.model.Cursos;
import br.cspi.service.AlunoService;
import br.cspi.service.CursoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
public class AlunoController {
    private final AlunoService alunoService;
    public AlunoController(AlunoService alunoService) {
        this.alunoService = alunoService;
    }

    @GetMapping("/home")
    public String paginaPrincipal(
            // Recebe os parâmetros de filtro da URL
            @RequestParam(required = false, defaultValue = "-1") Integer centroId,
            @RequestParam(required = false, defaultValue = "-1") Integer cursoId,
            Model model) {

        // 1. Carrega todos os centros para o primeiro dropdown
        ArrayList<Centros> centros = new CentroDAO().getCentros();
        model.addAttribute("centros", centros);

        // 2. Lógica para carregar os Cursos, dependendo do Centro selecionado
        List<Cursos> cursos = Collections.emptyList();
        if ( centroId > -1) {
            cursos = new CursoService().getCursosbyCentro(centroId);
        }
        model.addAttribute("cursos", cursos);

        // 3. Lógica para carregar os Alunos, dependendo do Curso selecionado
        List<Alunos> alunos = Collections.emptyList();
        if (cursoId > -1) {
            alunos = new AlunoService().getAlunosByCurso(cursoId);
        }
        model.addAttribute("alunos", alunos);

        // 4. Repassa os IDs selecionados para o JSP manter a seleção após o refresh
        model.addAttribute("centroSelecionadoId", centroId);
        model.addAttribute("cursoSelecionadoId", cursoId);


        return "home"; // Nome do seu arquivo JSP
    }


}
