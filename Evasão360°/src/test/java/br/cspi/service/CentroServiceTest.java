package br.cspi.service;

import br.cspi.dao.CentroDAO;
import br.cspi.model.Centros;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class CentroServiceTest {
    @Test
    public void testConsultaCentroReal() {
        CentroDAO centroDAO = new CentroDAO();
        CentroService centroService = new CentroService(centroDAO);
        int id = 1;

        ArrayList<Centros> c = centroService.getCentro(id);
        assertEquals(id, c.getFirst().getId());

    }

    @Test
    public void testConsultaCentroFantasma() {
        CentroDAO centroDAO = new CentroDAO();
        CentroService centroService = new CentroService(centroDAO);
        int id = 46545;

        ArrayList<Centros> c = centroService.getCentro(id);
        assertEquals(0, c.toArray().length); //retorna um array vazio
    }

}

