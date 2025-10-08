package br.cspi.service;

import br.cspi.model.Alunos;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

public class AlunoServiceTest {
    @Test
    public void testConsultaAlunos() {

        // TODO testar consultar um aluno que existe no banco de dados.
        // TODO tem que retornar o aluno corretamente
        String matricula = "20230076";
        Alunos a = new AlunoService().getAluno(matricula);
        assertEquals(a.getMatricula(), matricula);

        // TODO testar consultar um aluno que NÃO existe no banco de dados.
        // TODO tem que dar um erro

        matricula = "ABCDEFGH";
        assertThrows(new AlunoService().getAluno(matricula));
    }

}
