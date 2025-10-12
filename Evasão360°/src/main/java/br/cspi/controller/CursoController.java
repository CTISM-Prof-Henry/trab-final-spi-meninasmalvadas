package br.cspi.controller;

import br.cspi.model.Cursos;
import br.cspi.service.CursoService;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@RestController
@RequestMapping("/cursos")
public class CursoController {
    private final CursoService cursoService;
    public CursoController(CursoService cursoService) {
        this.cursoService = cursoService;
    }

    @GetMapping("/porCentro")
    public ArrayList<Cursos> porCentro(@RequestParam int centroId) {
        System.out.println("passou aqui ");
        return this.cursoService.getCursosbyCentro(centroId);

    }
}
