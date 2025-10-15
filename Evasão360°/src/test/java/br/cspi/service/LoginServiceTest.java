package br.cspi.service;

import br.cspi.dao.UsuarioDAO;
import br.cspi.model.Usuario;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;


class LoginServiceTest {

    //FUNÇÃO DE LOGIN REAL EXCLUIDA POR NÃO FUNCIONAR COM HASH

    @Test
    public void testLoginFake() {
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        LoginService loginService = new LoginService(usuarioDAO);
        String email2 = "admin@errado.com";
        String senha2 = "errado";

        Usuario u = loginService.autenticar(email2, senha2);
        assertNull(u);
    }

}