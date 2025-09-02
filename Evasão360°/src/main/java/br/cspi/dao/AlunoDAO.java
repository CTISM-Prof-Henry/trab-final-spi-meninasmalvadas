package br.cspi.dao;

import br.cspi.model.Alunos;
import br.cspi.model.Usuario;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AlunoDAO {


    //                 GET ALUNOS
    public ArrayList<Alunos> getAlunos() {
        ArrayList<Alunos> alunos = new ArrayList<>();

        try {
            Connection conn = ConectarBancoDados.conectarBancoDados();

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from aluno");

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
                a.setCurso(rs.getString("curso"));
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
}

