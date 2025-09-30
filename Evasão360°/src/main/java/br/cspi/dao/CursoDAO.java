package br.cspi.dao;

import br.cspi.model.Alunos;
import br.cspi.model.Cursos;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CursoDAO {

    private final JdbcTemplate jdbcTemplate;

    public CursoDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Cursos> getPorCentro(Integer centroId) {
        String sql = "SELECT * FROM curso WHERE centro_id = ?";
        return jdbcTemplate.query(sql, new Object[]{centroId}, new RowMapper<Cursos>() {
            @Override
            public Cursos mapRow(ResultSet rs, int rowNum) throws SQLException {
                return new Cursos(
                        rs.getInt("id"),
                        rs.getString("nome"),
                        rs.getInt("centro_id")
                );
            }
        });
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
}

