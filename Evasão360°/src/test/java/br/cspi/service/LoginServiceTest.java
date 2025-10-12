package br.cspi.service;

import br.cspi.dao.UsuarioDAO;
import br.cspi.model.Alunos;
import br.cspi.model.Usuario;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.when;

class LoginServiceTest {
    // TODO testar consultar um login que existe no banco de dados.
    // TODO tem que retornar o usuario corretamente
//        String email = "admin@admin.com";
//        String senha = "admin";
//        Usuario u = new LoginService().autenticar(email, senha);
//        assertEquals(u.getEmail(), email);
//        assertEquals(u.getSenha(), senha);

    // TODO testar consultar um login que NÃO existe no banco de dados.
    // TODO tem que dar um erro
//        String email2 = "admin@errado.com";
//        String senha2 = "errado";
//        Usuario u2 = new LoginService().autenticar(email2, senha2);
//        assertEquals(u.getEmail(), email2);
//        assertEquals(u.getSenha(), senha2);

    //TA FUNCOONANDO ISSO AQUI EIN
    @Test
    public void testLoginReal() { //teste de integração
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        LoginService loginService = new LoginService(usuarioDAO);
        String email = "admin@admin.com";
        String senha = "admin";

        Usuario u = loginService.autenticar(email, senha);
        assertEquals(u.getEmail(), email);
        assertEquals(u.getSenha(), senha);

    }

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