package br.cspi.service;

import br.cspi.dao.UsuarioDAO;
import br.cspi.model.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

    @Autowired
    private PasswordEncoder passwordEncoder;


    private final UsuarioDAO usuarioDAO;

    public LoginService(UsuarioDAO usuarioDAO) {
        this.usuarioDAO = usuarioDAO;

    }

    public Usuario autenticar(String email, String senha) {

        Usuario usuario = usuarioDAO.getUsuarioByEmail(email); // Assumindo que você tem este método

        if (usuario == null) {
            return null;
        }
        boolean senhaCorreta = passwordEncoder.matches(senha, usuario.getSenha());

        if (senhaCorreta) {
            return usuario;
        } else {
            return null;
        }
    }

}
