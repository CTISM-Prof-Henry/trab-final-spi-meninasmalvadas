package br.cspi.service;

import br.cspi.dao.CursoDAO;
import br.cspi.model.Cursos;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class CursoService {
    private final CursoDAO cursoDAO;
    public CursoService(CursoDAO cursoDAO) {
        this.cursoDAO = cursoDAO;
    }

    public ArrayList<Cursos> getCursosbyCentro(int centro_id) {
//        CursoDAO dao = new CursoDAO();
        return this.cursoDAO.getPorCentro(centro_id);
    }

    public ArrayList<Cursos> getCursos( ) {
//        CursoDAO dao = new CursoDAO();
        return this.cursoDAO.getCursos();
    }
    public Cursos getCursoById(int id) {
        System.out.println(this.cursoDAO.getCursoById(id) + "Passou aqui");
        return this.cursoDAO.getCursoById(id);
    }

    public List<Cursos> getCursosbyId(int cursoId) {
        return Collections.singletonList(this.cursoDAO.getCursoById(cursoId));
    }
}
