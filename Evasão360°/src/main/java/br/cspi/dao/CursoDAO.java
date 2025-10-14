package br.cspi.dao;

import br.cspi.model.Centros;
import br.cspi.model.Cursos;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
        Cursos c = new Cursos();

        try (Connection conn = ConectarBancoDados.conectarBancoDados();
             PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM cursos WHERE id = ?")) {

            // 2. Define o valor do parâmetro
            pstmt.setInt(1, id);

            // 3. Executa a consulta
            try (ResultSet rs = pstmt.executeQuery()) {

                if (rs.next()) {

                    c.setId(rs.getInt("id"));
                    c.setNome(rs.getString("nome"));
                    c.setCentro_id(rs.getInt("centro_id"));

                    // Adiciona o objeto Centro à lista

                }


            }
        } catch (SQLException e) {
            System.out.println("Erro ao conectar");
            e.printStackTrace();
        } catch (ClassNotFoundException ex) {
            System.out.println("Erro ao conectar");
            ex.printStackTrace();
        }

        return c;
    }
}

