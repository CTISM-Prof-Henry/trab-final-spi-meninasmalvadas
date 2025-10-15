package br.cspi.service;

import br.cspi.dao.AlunoDAO;
import br.cspi.model.Alunos;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class AlunoService {
    private final AlunoDAO alunoDAO;

    public AlunoService(AlunoDAO alunoDAO) {
        this.alunoDAO = alunoDAO;
    }

    public ArrayList<Alunos> getAlunos() {
//        AlunoDAO dao = new AlunoDAO();
        return this.alunoDAO.getAlunos();
    }

    public ArrayList<Alunos> getAlunosByCurso(int cursoId) {
//        AlunoDAO dao = new AlunoDAO();
        return this.alunoDAO.getAlunosByCurso(cursoId);
    }

    public ArrayList<Alunos> getAlunosByCentro(int centroId) {
        return this.alunoDAO.getAlunosByCentro(centroId);
    }

    public Alunos getAluno(String matricula) {
//        AlunoDAO dao = new AlunoDAO();
        return this.alunoDAO.getAluno(matricula);
    }

}