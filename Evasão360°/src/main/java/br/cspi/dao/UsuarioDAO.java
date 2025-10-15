package br.cspi.dao;

import br.cspi.model.Usuario;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class UsuarioDAO {

    //ALTERAR
    public String alterer(Usuario usuario, int id) {
        try {
            Connection conn = ConectarBancoDados.conectarBancoDados();
            PreparedStatement stmt = conn.prepareStatement("UPDATE usuario SET email = ?, senha = ?, nome = ?, ativo = ?, permissao = ? WHERE id = ?"
            );

            stmt.setString(1, usuario.getEmail());
            stmt.setString(2, usuario.getSenha());
            stmt.setBoolean(3, usuario.isAtivo());
            stmt.setString(4, usuario.getNome());
            stmt.setString(5, usuario.getPermissao().toString());
            stmt.setInt(6, id);

            stmt.execute();


        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);

        }

        return "Alterado com Sucesso";
    }

    //EXCLUIR
    public String excluir(int id) {

        try {

            Connection conn = ConectarBancoDados.conectarBancoDados();
            PreparedStatement stmt = conn.prepareStatement("delete from usuario  where id = ?"
            );

            stmt.setInt(1, id);
            stmt.execute();

            if (stmt.getUpdateCount() <= 0) {
                return "Nenhuem usuario exculuido";
            }


        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);

        }
        return "Excluido com sucesso";
    }

    //INSERIR
    public String inserir(Usuario usuario) {


        try {
            Connection conn = ConectarBancoDados.conectarBancoDados();
            PreparedStatement stmt = conn.prepareStatement("insert into usuario(email, senha, ativo, nome, permissao) values(?, ?, ?, ?, ?)"
            );

            stmt.setString(1, usuario.getEmail());
            stmt.setString(2, usuario.getSenha());
            stmt.setBoolean(3, usuario.isAtivo());
            stmt.setString(4, usuario.getNome());
            stmt.setString(5, usuario.getPermissao().toString());


            stmt.execute();


        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);

        }

        return "Inserido com Sucesso";
    }

    //                 GET USUARIOS
    public ArrayList<Usuario> getUsuarios() {
        ArrayList<Usuario> usuarios = new ArrayList<>();

        try {
            Connection conn = ConectarBancoDados.conectarBancoDados();

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from usuario");

            while (rs.next()) {
                Usuario u = new Usuario();
                u.setId(rs.getInt("id"));
                u.setNome(rs.getString("nome"));
                u.setEmail(rs.getString("email"));
                u.setSenha(rs.getString("senha"));
                u.setAtivo(rs.getBoolean("ativo"));
                u.setPermissao(Usuario.tipo_permissao.valueOf(rs.getString("permissao")));
                u.setCentro_id(rs.getInt("centro_id"));
                u.setCurso_id(rs.getInt("curso_id"));


                usuarios.add(u);

            }

        } catch (SQLException e) {
            System.out.println("Erro ao conectar");
            e.printStackTrace();
        } catch (ClassNotFoundException ex) {
            System.out.println("Erro ao conectar");
            ex.printStackTrace();
        }

        return usuarios;
    }


    public List<Usuario> listarTodos() {
        return getUsuarios();
    }
}