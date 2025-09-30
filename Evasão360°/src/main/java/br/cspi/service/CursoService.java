package br.cspi.service;

import br.cspi.dao.CursoDAO;
import br.cspi.model.Cursos;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class CursoService {

    public ArrayList<Cursos> getCursosbyCentro(int centro_id) {
        CursoDAO dao = new CursoDAO();

        return dao.getPorCentro(centro_id);
    }

    public ArrayList<Cursos> getCursos( ) {
        CursoDAO dao = new CursoDAO();
        return dao.getCursos();
    }
}
