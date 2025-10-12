package br.cspi.dao;

import br.cspi.model.Alunos;
import br.cspi.model.Usuario;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class AlunoDAO {


    //                 GET ALUNOS
    public ArrayList<Alunos> getAlunos() {
        ArrayList<Alunos> alunos = new ArrayList<>();

        try {
            Connection conn = ConectarBancoDados.conectarBancoDados();

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from alunos");

            while (rs.next()) {
//                    Usuario u = new Usuario();
//                    u.setId(rs.getInt("id"));
//                    u.setNome(rs.getString("nome"));
//                    u.setEmail(rs.getString("email"));
//                    u.setSenha(rs.getString("senha"));
//                    u.setAtivo(rs.getBoolean("ativo"));

                Alunos a = new Alunos();
                a.setMatricula(rs.getString("matricula"));
                a.setNome(rs.getString("nome"));
                a.setCurso_id(rs.getInt("curso_id"));
                a.setRisco(rs.getDouble("risco"));
                a.setEmail(rs.getString("email"));
                a.setCpf(rs.getString("cpf"));
                a.setNascimento(rs.getDate("nascimento").toLocalDate());
                a.setTelefone(rs.getString("telefone"));
                a.setEndereco(rs.getString("endereco"));
                a.setFrequencia(rs.getDouble("frequencia"));
                a.setMedia(rs.getDouble("media"));


                alunos.add(a);

            }

        } catch (SQLException e) {
            System.out.println("Erro ao conectar");
            e.printStackTrace();
        } catch (ClassNotFoundException ex) {
            System.out.println("Erro ao conectar");
            ex.printStackTrace();
        }

        return alunos;
    }

    public ArrayList<Alunos> getAlunosByCurso(int curso_id) {
        ArrayList<Alunos> alunos = new ArrayList<>();

        try {
            Connection conn = ConectarBancoDados.conectarBancoDados();

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from alunos where curso_id = " + curso_id);

            while (rs.next()) {
//                    Usuario u = new Usuario();
//                    u.setId(rs.getInt("id"));
//                    u.setNome(rs.getString("nome"));
//                    u.setEmail(rs.getString("email"));
//                    u.setSenha(rs.getString("senha"));
//                    u.setAtivo(rs.getBoolean("ativo"));

                Alunos a = new Alunos();
                a.setMatricula(rs.getString("matricula"));
                a.setNome(rs.getString("nome"));
                a.setCurso_id(rs.getInt("curso_id"));
                a.setRisco(rs.getDouble("risco"));
                a.setEmail(rs.getString("email"));
                a.setCpf(rs.getString("cpf"));
                a.setNascimento(rs.getDate("nascimento").toLocalDate());
                a.setTelefone(rs.getString("telefone"));
                a.setEndereco(rs.getString("endereco"));
                a.setFrequencia(rs.getDouble("frequencia"));
                a.setMedia(rs.getDouble("media"));


                alunos.add(a);

            }

        } catch (SQLException e) {
            System.out.println("Erro ao conectar");
            e.printStackTrace();
        } catch (ClassNotFoundException ex) {
            System.out.println("Erro ao conectar");
            ex.printStackTrace();
        }

        return alunos;
    }


    public Alunos getAluno(String matricula) {
        String sql = "SELECT a.*, c.nome AS nome_curso FROM alunos a JOIN cursos c ON a.curso_id = c.id WHERE a.matricula = ?";
        try (Connection conn = ConectarBancoDados.conectarBancoDados();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, matricula);
            ResultSet rs = stmt.executeQuery();

            if(rs.next()) {
                Alunos a = new Alunos();
                a.setMatricula(rs.getString("matricula"));
                a.setNome(rs.getString("nome"));
                a.setCurso_id(rs.getInt("curso_id"));
                a.setCursoNome(rs.getString("nome_curso"));
                a.setRisco(rs.getDouble("risco"));
                a.setEmail(rs.getString("email"));
                a.setCpf(rs.getString("cpf"));
                a.setNascimento(rs.getDate("nascimento").toLocalDate());
                a.setTelefone(rs.getString("telefone"));
                a.setEndereco(rs.getString("endereco"));
                a.setFrequencia(rs.getDouble("frequencia"));
                a.setMedia(rs.getDouble("media"));
                return a;
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return null;
    }

    //funcao antiga do will
    /*public Alunos getAluno(String matricula) {
        Alunos a = new Alunos();
        try {
            Connection conn = ConectarBancoDados.conectarBancoDados();

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from alunos where matricula = " + matricula);


            a.setMatricula(rs.getString("matricula"));
            a.setNome(rs.getString("nome"));
            a.setCurso_id(rs.getInt("curso_id"));
            a.setRisco(rs.getDouble("risco"));
            a.setEmail(rs.getString("email"));
            a.setCpf(rs.getString("cpf"));
            a.setNascimento(rs.getDate("nascimento").toLocalDate());
            a.setTelefone(rs.getString("telefone"));
            a.setEndereco(rs.getString("endereco"));
            a.setFrequencia(rs.getDouble("frequencia"));
            a.setMedia(rs.getDouble("media"));


        } catch (SQLException | ClassNotFoundException e) {


        }
        return a;
    }*/

}