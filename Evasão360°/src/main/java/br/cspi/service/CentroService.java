package br.cspi.service;

import br.cspi.dao.CentroDAO;
import br.cspi.model.Centros;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.ArrayList;

@Service
public class CentroService {
    private final CentroDAO centroDAO;
    public CentroService(CentroDAO centroDAO) {
        this.centroDAO = centroDAO;
    }

    public ArrayList<Centros> getCentros() {
//        CentroDAO dao = new CentroDAO();
        return this.centroDAO.getCentros();
    }

    public ArrayList<Centros> getCentro(int id) {
        return centroDAO.getCentroById(id);
    }
}
