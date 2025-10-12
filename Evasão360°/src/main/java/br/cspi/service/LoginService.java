package br.cspi.service;

import br.cspi.dao.UsuarioDAO;
import br.cspi.model.Usuario;
import org.springframework.stereotype.Service;

@Service
public class LoginService {
    private final UsuarioDAO usuarioDAO;
    public LoginService(UsuarioDAO usuarioDAO) {
        this.usuarioDAO = usuarioDAO;
    }

    public Usuario autenticar(String email, String senha) {
        for (Usuario usuario : this.usuarioDAO.getUsuarios()) {
            if (usuario.getEmail().equals(email) && usuario.getSenha().equals(senha)) {
                return usuario;
            }
        }

        return null;
    }

}
