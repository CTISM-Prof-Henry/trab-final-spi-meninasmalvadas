# Documentação: Evasão 360

##[https://github.com/.git](https://github.com/CTISM-Prof-Henry/trab-final-spi-meninasmalvadas.git)

## O que é

O **Evasão 360** é um sistema web desenvolvido para a disciplina do prof Henry, Engenharia de Software II, pela equipe das Meninas Malvadas: Julia Jaeger, Nicole Grazzioli e Willian Potkova. 

A aplicação tem como objetivo principal auxiliar coordenadores e professores de instituições de ensino a identificar estudantes que apresentam um alto risco de evasão (abandono do curso), com base nos dados fornecidos (no caso, fictícios).

## O que faz (funcionalidades)

* **Autenticação de login:** Acesso restrito a usuários autorizados (administradores, coordenadores) através de uma tela de login. Se o login (email e senha) existir na base de dados, o acesso é liberado.
* **Painel de Monitoramento:** Após o login, o usuário é direcionado a um painel central que exibe uma tabela com a lista de alunos: matrícula, nome, curso e nível de risco de evasão de cada aluno (baixo, moderado ou alto). Há um botão de ajuda, que explica o que significa cada nível de risco. Também, pode-se filtrar por centro ou curso.
* **Detalhamento de Alunos:** É possível visualizar as informações completas de um aluno específico, através de uma janela modal:
    * Email
    * CPF
    * Curso
    * Data de nascimento
    * Telefone
    * Frequência
    * Média geral (notas)
    * Endereço
    * Risco
* **Geração de Relatórios:** Uma página que permite a geração de relatórios (PDFs) para análises mais aprofundadas sobre os dados.
    * Comparar cursos
    * Evolução temporal da taxa de evasão (curso)
    * Custo total das evasões (curso)

## Tecnologias Utilizadas

* **Ferramentas:** IntelliJ IDEA
* **Backend:** Java 21, Spring Boot, Spring Web e Spring Data JPA
* **Frontend:** JavaServer Pages (JSP) com JSTL renderizado pelo servidor
* **Build e Dependências:** Apache Maven
* **Banco de Dados:** PostgreSQL
    * **Gerenciamento de Migrações:** Flyway, para versionamento e automação do schema do banco de dados


# Guia de instalação
Como configurar o ambiente e executar o projeto

### Pré requisitos
* Git
* JDK (Java Development Kit) versão 21 ou superior
* Apache Maven
* PostgreSQL
* IDE Java recomendada: IntelliJ IDEA

### Passo a passo
1. Clone o repositório do projeto:
git clone [https://github.com/CTISM-Prof-Henry/trab-final-spi-meninasmalvadas.git](https://github.com/CTISM-Prof-Henry/trab-final-spi-meninasmalvadas.git)

2. Configurar o banco de dados
* Garanta que o serviço do PostgreSQL está rodando
* Crie uma base de dados vazia chamada ```evasao360```
* Ajuste suas credenciais do PostgreSQL para ```usuario: postgres``` e ```senha: 1234``` OU ajuste o arquivo ```scr/main/resources/application.properties``` com as suas credenciais

3. Executar a aplicação
* Abra o projeto clonado na sua IDE
* Execute a classe ```ProjetoSpringBootApplication.java```
* O console da IDE vai mostrar o log de inicialização do Spring Boot, e o Flyway vai criar e popular as tabelas da base de dados

4. Acessar
* Abra o navegador em [http://localhost:8080](http://localhost:8080)
* Use as credenciais padrão de acesso:
    * Email: ```admin@admin.com```
    * Senha: ```admin```
