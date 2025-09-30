package br.cspi.service;

import br.cspi.dao.CentroDAO;
import br.cspi.model.Centros;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class CentroService {

    public ArrayList<Centros> getCentros() {
        CentroDAO dao = new CentroDAO();
        return new CentroDAO().getCentros();
    }
}
