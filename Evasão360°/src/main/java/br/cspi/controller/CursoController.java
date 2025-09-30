package br.cspi.controller;

import br.cspi.model.Cursos;
import br.cspi.service.CursoService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

@RestController("/cursos")
public class CursoController {

    @GetMapping("/porCentro")
    public ArrayList<Cursos> porCentro(@RequestBody int centroId) {
        System.out.println("passou aqui ");
        return new CursoService().getCursosbyCentro(centroId);

    }
}
