package br.cspi.dao;

import br.cspi.model.Centros;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.util.ArrayList;

@Repository
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

    public ArrayList<Centros> getCentroById(int id) {
        // 1. A lista é criada, mas como você busca por ID, ela terá 0 ou 1 elemento.
        ArrayList<Centros> centros = new ArrayList<>();


        // O try-with-resources garante que todos os recursos (conn, pstmt, rs) sejam fechados
        try (Connection conn = ConectarBancoDados.conectarBancoDados(); PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM centros WHERE id = ?")) {

            // 2. Define o valor do parâmetro
            pstmt.setInt(1, id);

            // 3. Executa a consulta
            try (ResultSet rs = pstmt.executeQuery()) {

                // 4. Move o cursor para o primeiro (e único) resultado
                if (rs.next()) {
                    Centros c = new Centros();
                    c.setId(rs.getInt("id"));
                    c.setNome(rs.getString("nome"));
                    c.setSigla(rs.getString("sigla"));

                    // Adiciona o objeto Centro à lista
                    centros.add(c);
                }
            } // O ResultSet é fechado automaticamente aqui

        } catch (SQLException | ClassNotFoundException e) {
            // Trate a exceção de forma adequada no seu projeto (logar, relançar, etc.)
            System.err.println("Erro ao buscar centro: " + e.getMessage());
            e.printStackTrace();
        } // Connection e PreparedStatement são fechados automaticamente aqui

        return centros;
    }
}
