package br.cspi.dao;

import br.cspi.model.Alunos;
import br.cspi.model.Centros;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class CentroDAO {

    public ArrayList<Centros> getCentros() {
        ArrayList<Centros> centros = new ArrayList<>();

        try {
            Connection conn = ConectarBancoDados.conectarBancoDados();

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from centros");

            while (rs.next()) {


                Centros c = new Centros();
                c.setId(rs.getInt("id"));
                c.setNome(rs.getString("nome"));
                c.setSigla(rs.getString("sigla"));


                centros.add(c);

            }

        } catch (SQLException e) {
            System.out.println("Erro ao conectar");
            e.printStackTrace();
        } catch (ClassNotFoundException ex) {
            System.out.println("Erro ao conectar");
            ex.printStackTrace();
        }

        return centros;
    }
}

