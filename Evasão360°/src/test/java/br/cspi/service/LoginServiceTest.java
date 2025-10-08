package br.cspi.service;

import br.cspi.dao.UsuarioDAO;
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

@ExtendWith(MockitoExtension.class)
class LoginServiceTest {

    @Mock
    private UsuarioDAO usuarioDAOMock; // 1. Criamos um "dublê" do UsuarioDAO

    @InjectMocks
    private LoginService loginService; // 2. Criamos a instância do LoginService, injetando o dublê acima

    private ArrayList<Usuario> listaDeUsuarios;

    @BeforeEach
    void setUp() {
        // Prepara uma lista de usuários de teste antes de cada teste
        listaDeUsuarios = new ArrayList<>();
        listaDeUsuarios.add(new Usuario(1, "Admin", "admin@admin.com", "admin", true));
        listaDeUsuarios.add(new Usuario(2, "Nicole", "nicole@email.com", "1234", true));
    }

    @Test
    @DisplayName("Deve autenticar usuário com credenciais corretas")
    void autenticar_ComCredenciaisCorretas_DeveRetornarUsuario() {
        // ARRANGE (Arrumar)
        String emailCorreto = "admin@admin.com";
        String senhaCorreta = "admin";
        // Dizemos ao Mockito: "Quando o método getUsuarios() do nosso DAO dublê for chamado, retorne a nossa lista de teste"
        when(usuarioDAOMock.getUsuarios()).thenReturn(listaDeUsuarios);

        // ACT (Agir)
        Usuario usuarioAutenticado = loginService.autenticar(emailCorreto, senhaCorreta);

        // ASSERT (Verificar)
        assertNotNull(usuarioAutenticado, "O usuário não deveria ser nulo para credenciais corretas.");
        assertEquals(emailCorreto, usuarioAutenticado.getEmail(), "O email do usuário autenticado está incorreto.");
    }

    @Test
    @DisplayName("Não deve autenticar usuário com senha incorreta")
    void autenticar_ComSenhaIncorreta_DeveRetornarNull() {
        // ARRANGE
        String emailCorreto = "admin@admin.com";
        String senhaIncorreta = "senhaerrada";
        when(usuarioDAOMock.getUsuarios()).thenReturn(listaDeUsuarios);

        // ACT
        Usuario usuarioAutenticado = loginService.autenticar(emailCorreto, senhaIncorreta);

        // ASSERT
        assertNull(usuarioAutenticado, "O usuário deveria ser nulo para credenciais incorretas.");
    }
}