package br.cspi.service;

import br.cspi.dao.CursoDAO;
import br.cspi.model.Cursos;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;

public class CursoServiceTest {
    @Test
    public void testConsultaCursoReal() {
        CursoDAO cursoDAO = new CursoDAO();
        CursoService cursoService = new CursoService(cursoDAO);
        int id = 1;

        Cursos c = cursoService.getCursoById(id);
        assertEquals(id, c.getId());

    }

    @Test
    public void testConsultaCursoFantasma() {
        CursoDAO cursoDAO = new CursoDAO();
        CursoService cursoService = new CursoService(cursoDAO);
        int idF = 984356;

        Cursos c = cursoService.getCursoById(idF);
        assertNull(c);
    }
}
