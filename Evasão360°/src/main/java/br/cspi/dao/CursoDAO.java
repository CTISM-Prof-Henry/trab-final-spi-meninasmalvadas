package br.cspi.dao;

import br.cspi.model.Cursos;
import org.springframework.stereotype.Repository;
import java.sql.*;
import java.util.ArrayList;

@Repository
public class CursoDAO {

    public ArrayList<Cursos> getPorCentro(int centro_id) {
        ArrayList<Cursos> cursos = new ArrayList<>();

        try {
            Connection conn = ConectarBancoDados.conectarBancoDados();

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from cursos where centro_id=" + centro_id);

            while (rs.next()) {

                Cursos c = new Cursos();
                c.setId(rs.getInt("id"));
                c.setNome(rs.getString("nome"));
                c.setCentro_id(rs.getInt("centro_id"));


                cursos.add(c);

            }

        } catch (SQLException e) {
            System.out.println("Erro ao conectar");
            e.printStackTrace();
        } catch (ClassNotFoundException ex) {
            System.out.println("Erro ao conectar");
            ex.printStackTrace();
        }

        return cursos;
    }

    public ArrayList<Cursos> getCursos() {
        ArrayList<Cursos> cursos = new ArrayList<>();

        try {
            Connection conn = ConectarBancoDados.conectarBancoDados();

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from cursos");

            while (rs.next()) {

                Cursos c = new Cursos();
                c.setId(rs.getInt("id"));
                c.setNome(rs.getString("nome"));
                c.setCentro_id(rs.getInt("centro_id"));


                cursos.add(c);

            }

        } catch (SQLException e) {
            System.out.println("Erro ao conectar");
            e.printStackTrace();
        } catch (ClassNotFoundException ex) {
            System.out.println("Erro ao conectar");
            ex.printStackTrace();
        }

        return cursos;
    }

    public Cursos getCursoById(int id) {
        Cursos c = null;

        try (Connection conn = ConectarBancoDados.conectarBancoDados(); PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM cursos WHERE id = ?")) {

            pstmt.setInt(1, id);

            try (ResultSet rs = pstmt.executeQuery()) {

                if (rs.next()) {
                    c = new Cursos();
                    c.setId(rs.getInt("id"));
                    c.setNome(rs.getString("nome"));
                    c.setCentro_id(rs.getInt("centro_id"));
                }

            }
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Erro ao buscar curso por ID: " + e.getMessage());
            e.printStackTrace();
            return null;
        }

        return c;
    }

}

