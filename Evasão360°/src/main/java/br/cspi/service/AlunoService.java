package br.cspi.service;

import br.cspi.dao.AlunoDAO;
import br.cspi.model.Alunos;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

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
        System.out.println("AlunoService.getAluno - matricula: " + matricula);
        return this.alunoDAO.getAluno(matricula);
    }

    public List<Alunos> getAlunosbyRisco(List<Alunos> alunos) {
       List<Alunos> alunosAR = new ArrayList<Alunos>();

       for (Alunos a: alunos ) {
           System.out.println(a.getRisco());
           if (a.getRisco() >= 0.7){
               alunosAR.add(a);
           }
       }

       return alunosAR;
    }

}