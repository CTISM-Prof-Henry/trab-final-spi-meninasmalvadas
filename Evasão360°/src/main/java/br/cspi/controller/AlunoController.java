package br.cspi.controller;

import br.cspi.model.Alunos;
import br.cspi.model.Centros;
import br.cspi.model.Cursos;
import br.cspi.model.Usuario;
import br.cspi.service.AlunoService;
import br.cspi.service.CentroService;
import br.cspi.service.CursoService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
public class AlunoController {
    private final AlunoService alunoService;
    private final CursoService cursoService;
    private final CentroService centroService;

    public AlunoController(AlunoService alunoService, CursoService cursoService, CentroService centroService) {
        this.alunoService = alunoService;
        this.cursoService = cursoService;
        this.centroService = centroService;
    }

    @GetMapping("/home")
    public String paginaPrincipal(
            // parametros de filtro da URL
            @RequestParam(required = false, defaultValue = "-1") Integer centroId,
            @RequestParam(required = false, defaultValue = "-1") Integer cursoId,
            HttpSession session,
            Model model) throws SQLException {

        Usuario usuario = (Usuario) session.getAttribute("usuario");
        System.out.println(usuario.getId() + " - " + usuario.getNome() + " - " + usuario.getPermissao());

        if (usuario.getPermissao() == Usuario.tipo_permissao.GERAL) {

            ArrayList<Centros> centros = this.centroService.getCentros();
            model.addAttribute("centros", centros);


            List<Cursos> cursos = Collections.emptyList();
            if (centroId > -1) {
                cursos = this.cursoService.getCursosbyCentro(centroId);
            }
            model.addAttribute("cursos", cursos);
        } else if (usuario.getPermissao() == Usuario.tipo_permissao.CENTRO) {

            ArrayList<Centros> centros = this.centroService.getCentro(usuario.getCentro_id());
            model.addAttribute("centros", centros);
            centroId = usuario.getCentro_id();


            List<Cursos> cursos = Collections.emptyList();
            if (centroId > -1) {
                cursos = this.cursoService.getCursosbyCentro(centroId);
            }
            model.addAttribute("cursos", cursos);
        } else if (usuario.getPermissao() == Usuario.tipo_permissao.CURSO) {

            List<Cursos> cursos = Collections.emptyList();
            if (usuario.getCurso_id() > -1) {
                cursos = this.cursoService.getCursosbyId(usuario.getCurso_id());
                cursoId = usuario.getCurso_id();
            }
            model.addAttribute("cursos", cursos);

        }

        List<Alunos> alunos = Collections.emptyList();

        if (cursoId > -1) {
            alunos = this.alunoService.getAlunosByCurso(cursoId);


        } else if (centroId > -1) {
            alunos = this.alunoService.getAlunosByCentro(centroId);


        } else if (centroId == -1 && cursoId == -1) {

            if (usuario.getPermissao() == Usuario.tipo_permissao.GERAL) {
                alunos = this.alunoService.getAlunos();

            } else if (usuario.getPermissao() == Usuario.tipo_permissao.CENTRO) {
                alunos = this.alunoService.getAlunosByCentro(usuario.getCentro_id());

            } else if (usuario.getPermissao() == Usuario.tipo_permissao.CURSO) {
                alunos = this.alunoService.getAlunosByCurso(usuario.getCurso_id());
            }
        }
        model.addAttribute("alunos", alunos);

        // passa os IDs para o JSP
        model.addAttribute("centroSelecionadoId", centroId);
        model.addAttribute("cursoSelecionadoId", cursoId);
        model.addAttribute("centroId", centroId);
        model.addAttribute("cursoId", cursoId);


        return "home"; // nome do JSP
    }

    @GetMapping("/aluno")
    @ResponseBody //converte em json
    public Alunos alunoDetalhe(@RequestParam String matricula) {
        System.out.println("--- AlunoController.alunoDetalhe ---");
        System.out.println("Controller - matrícula: [" + matricula + "]");

        if(matricula == null || matricula.trim().isEmpty()) {
            System.err.println("Controller: matrícula inválida (nula ou vazia)");
            return null;
        }

        Alunos aluno = this.alunoService.getAluno(matricula);
        System.out.println("Controller: retornou " + (aluno != null ? aluno.getNome() : "null"));
        return aluno;
    }


}
