<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <jsp:include page="shared/header.jsp"/>
    <title>Sobre - Evasão 360</title>
</head>

<body class="flex items-center justify-center w-full min-h-screen bg-gray-100">
<div class="card bg-primary text-white mx-8 md:mx-[8%] h-[85vh] rounded-2xl shadow-lg flex flex-col justify-between">
    <div class="card-body flex flex-col justify-between gap-6 overflow-auto p-5 md:p-8">

        <div class="flex flex-wrap gap-2 font-bold items-center justify-center w-full text-center mb-3">
            <img class="w-14 md:w-16" src="${pageContext.request.contextPath}/img/logo-ufsm.webp" alt="Logo UFSM"/>
            <h1 class="text-2xl md:text-3xl font-extrabold tracking-wide">EVASÃO 360</h1>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 text-justify px-2 md:px-4 leading-relaxed text-base md:text-lg">
            <div>
                <h3 class="text-secondary text-xl font-semibold mb-2 text-center md:text-left">O que é o Evasão 360</h3>
                <h6>
                    &nbsp;&nbsp; O Evasão360 é um projeto que prevê a probabilidade de um estudante abandonar a
                    graduação, analisando diversos fatores que influenciam essa decisão, como desempenho acadêmico,
                    situação financeira e engajamento. Com essa visão completa, o objetivo é ajudar as instituições a
                    identificar alunos em risco e agir preventivamente, oferecendo suporte personalizado. Dessa forma, é
                    possível antecipar problemas e direcionar recursos de forma mais eficiente, aumentando as chances de
                    que os estudantes permaneçam e concluam seus cursos.
                </h6>
            </div>

            <div>
                <h3 class="text-secondary text-xl font-semibold mb-2 text-center md:text-left">Funcionalidades</h3>
                <h6>
                    &nbsp;&nbsp; O Evasão360 utiliza dados acadêmicos e pessoais dos estudantes para identificar padrões
                    e calcular a probabilidade de evasão. Por meio dessa análise, o sistema gera relatórios detalhados e
                    envia alertas que permitem às instituições de ensino monitorar de forma proativa os alunos com maior
                    risco de abandono. Com essas informações, as instituições conseguem desenvolver estratégias mais
                    eficazes de apoio e retenção, direcionando recursos e ações específicas para ajudar os estudantes a
                    superar dificuldades e continuar seus estudos com sucesso.
                </h6>
            </div>

            <div>
                <h3 class="text-secondary text-xl font-semibold mb-2 text-center md:text-left">Utilidade UFSM</h3>
                <h6>
                    &nbsp;&nbsp; O Evasão360 auxilia a UFSM a identificar alunos com risco de evasão de maneira
                    antecipada, possibilitando que a universidade tome ações rápidas e direcionadas para apoiar esses
                    estudantes. Com esse acompanhamento proativo, a UFSM consegue oferecer intervenções personalizadas
                    que aumentam a permanência dos alunos na graduação, promovendo um ambiente educacional mais
                    acolhedor e eficiente. Dessa forma, a universidade melhora seus índices de retenção e o sucesso
                    acadêmico dos estudantes de forma significativa.
                </h6>
            </div>
        </div>

        <div class="flex items-center justify-center mt-4">
            <a href="/login"
               class="btn btn-primary bg-secondary text-white px-6 py-2 rounded-lg shadow-md hover:bg-secondary/90 transition text-sm md:text-base">
                Entrar
            </a>
        </div>

    </div>
</div>
</body>
</html>
