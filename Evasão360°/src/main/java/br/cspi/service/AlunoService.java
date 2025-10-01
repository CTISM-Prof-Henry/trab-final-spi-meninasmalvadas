package br.cspi.service;

import br.cspi.dao.AlunoDAO;
import br.cspi.model.Alunos;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class AlunoService {

    public ArrayList<Alunos> getAlunos() {
        AlunoDAO dao = new AlunoDAO();
        return dao.getAlunos();
    }

    public ArrayList<Alunos> getAlunosByCurso( int cursoId) {
        AlunoDAO dao = new AlunoDAO();
        return dao.getAlunosByCurso(cursoId);
    }

    public Alunos getAluno(String matricula) {
        AlunoDAO dao = new AlunoDAO();
        return dao.getAluno(matricula);
    }

}
