package br.cspi.service;

import br.cspi.dao.AlunoDAO;
import br.cspi.model.Alunos;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;


//ALA TB NAO DEU ERRP
public class AlunoServiceTest {
    @Test
    public void testConsultaAlunoReal() {
        // TODO testar consultar um aluno que existe no banco de dados.
        // TODO tem que retornar o aluno corretamente
//        Alunos a = new AlunoService().getAluno(matricula);
//        assertEquals(a.getMatricula(), matricula);
        AlunoDAO alunoDAO = new AlunoDAO();
        AlunoService alunoService = new AlunoService(alunoDAO);
        String matricula = "20230076";

        Alunos a = alunoService.getAluno(matricula);
        assertEquals(matricula, a.getMatricula());

    }

    @Test
    public void testConsultaAlunoFantasma() {
        AlunoDAO alunoDAO = new AlunoDAO();
        AlunoService alunoService = new AlunoService(alunoDAO);
        String matriculaFantasma = "ABCDEFGH";

        Alunos a = alunoService.getAluno(matriculaFantasma);

//        assertEquals(matriculaFantasma, a.getMatricula());
        assertNull(a);
    }

    // TODO testar consultar um aluno que NÃO existe no banco de dados.
    // TODO tem que dar um erro
//        String matricula2 = "ABCDEFGH";
//        Alunos b = new AlunoService().getAluno(matricula2);
//        assertThrows(b.getMatricula(), matricula2);

}
