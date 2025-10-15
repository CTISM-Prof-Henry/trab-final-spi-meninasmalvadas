package br.cspi.service;

import br.cspi.dao.CentroDAO;
import br.cspi.model.Centros;
import org.junit.jupiter.api.Test;

import java.sql.SQLException;
import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;

public class CentroServiceTest {
    @Test
    public void testConsultaCentroReal() throws SQLException {
        CentroDAO centroDAO = new CentroDAO();
        CentroService centroService = new CentroService(centroDAO);
        int id = 1;

        ArrayList<Centros> c = centroService.getCentro(id);
        assertEquals(id, c.getFirst().getId());
//        CursoDAO cursoDAO = new CursoDAO();
//        CursoService cursoService = new CursoService(cursoDAO);
//        int id = 1;
//
//        Cursos c = cursoService.getCursoById(id);
//        assertEquals(id, c.getId());

    }

    @Test
    public void testConsultaCentroFantasma() {
        CentroDAO centroDAO = new CentroDAO();
        CentroService centroService = new CentroService(centroDAO);
        int id = 46545;

        ArrayList<Centros> c = centroService.getCentro(id);
        assertEquals(0, c.toArray().length); //retorna um array vazio
//        assertNull(c);
//        CursoDAO cursoDAO = new CursoDAO();
//        CursoService cursoService = new CursoService(cursoDAO);
//        int idF = 984356;
//
//        Cursos c = cursoService.getCursoById(idF);
//        assertNull(c);
    }

}

