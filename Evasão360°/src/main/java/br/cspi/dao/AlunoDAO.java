package br.cspi.dao;

import br.cspi.model.Alunos;
import org.springframework.stereotype.Repository;
import java.sql.*;
import java.util.ArrayList;

@Repository
public class AlunoDAO {

    //auxiliar pra preencher os dados tipo as funçao de criar lista do leandro deusulivre
    private Alunos mapRowToAluno(ResultSet rs) throws SQLException {
        Alunos a = new Alunos();
        a.setMatricula(rs.getString("matricula"));
        a.setNome(rs.getString("nome"));
        a.setCurso_id(rs.getInt("curso_id"));
        a.setCursoNome(rs.getString("nome_curso")); // nome do curso (JOIN)
        a.setRisco(rs.getDouble("risco"));
        a.setEmail(rs.getString("email"));
        a.setCpf(rs.getString("cpf"));
        Date nascimentoDate = rs.getDate("nascimento");
        if (nascimentoDate != null) {
            a.setNascimento(nascimentoDate.toLocalDate());
        }
        a.setTelefone(rs.getString("telefone"));
        a.setEndereco(rs.getString("endereco"));
        a.setFrequencia(rs.getDouble("frequencia"));
        a.setMedia(rs.getDouble("media"));
        return a;
    }

    public ArrayList<Alunos> getAlunos() {
        ArrayList<Alunos> alunos = new ArrayList<>();
        String sql = "SELECT a.*, c.nome as nome_curso FROM alunos a JOIN cursos c ON a.curso_id = c.id ORDER BY a.nome";
        try (Connection conn = ConectarBancoDados.conectarBancoDados();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                alunos.add(mapRowToAluno(rs));
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Erro ao buscar todos os alunos: " + e.getMessage());
            e.printStackTrace();
        }
        return alunos;
    }

    public ArrayList<Alunos> getAlunosByCurso(int curso_id) {
        ArrayList<Alunos> alunos = new ArrayList<>();
        String sql = "SELECT a.*, c.nome as nome_curso FROM alunos a JOIN cursos c ON a.curso_id = c.id WHERE a.curso_id = ? ORDER BY a.nome";
        try (Connection conn = ConectarBancoDados.conectarBancoDados();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, curso_id);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    alunos.add(mapRowToAluno(rs));
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Erro ao buscar alunos por curso: " + e.getMessage());
            e.printStackTrace();
        }
        return alunos;
    }

    public ArrayList<Alunos> getAlunosByCentro(int centroId) {
        ArrayList<Alunos> alunos = new ArrayList<>();
        String sql = "SELECT a.*, cu.nome as nome_curso FROM alunos a " +
                "JOIN cursos cu ON a.curso_id = cu.id " +
                "WHERE cu.centro_id = ? ORDER BY a.nome";
        try (Connection conn = ConectarBancoDados.conectarBancoDados();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, centroId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    alunos.add(mapRowToAluno(rs));
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Erro ao buscar alunos por centro: " + e.getMessage());
            e.printStackTrace();
        }
        return alunos;
    }

    public Alunos getAluno(String matricula) {
        String sql = "SELECT a.*, c.nome AS nome_curso FROM alunos a JOIN cursos c ON a.curso_id = c.id WHERE TRIM(a.matricula) = ?";

        System.out.println("--- AlunoDAO.getAluno ---");
        System.out.println("Matrícula: [" + matricula + "]");

        if (matricula == null || matricula.trim().isEmpty()) {
            System.err.println("DAO: Matrícula nula ou vazia");
            return null;
        }

        try (Connection conn = ConectarBancoDados.conectarBancoDados();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, matricula.trim()); // Faz trim na variável por segurança
            System.out.println("DAO: Executando SQL com parâmetro (matrícula) [" + matricula.trim() + "]");

            try (ResultSet rs = stmt.executeQuery()) {
                System.out.println("DAO: Query executada");
                if (rs.next()) {
                    System.out.println("DAO: Matrícula ENCONTRADA no banco: " + matricula);
                    return mapRowToAluno(rs);
                } else {
                    System.out.println("DAO: Matrícula NÃO encontrada no banco pela query Java: " + matricula);
                    return null;
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("DAO: Erro GERAL (Conexão ou SQL) ao buscar matrícula (" + matricula + "): " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
}