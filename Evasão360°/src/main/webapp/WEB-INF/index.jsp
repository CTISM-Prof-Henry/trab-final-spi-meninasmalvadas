<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <jsp:include page="shared/header.jsp"/>

    <title>Sobre</title>
</head>
<body class="flex items-center justify-center w-full h-[100vh]">
<div class="card bg-primary mx-[10%] h-[80%]">
    <div class="card-body flex flex-col justify-between gap-5">
        <div class="flex flex-nowrap gap-3 font-bold items-center justify-center w-full">
            <img width="6%" src="${pageContext.request.contextPath}/img/logo-ufsm.webp"/>
            <h1>EVASÃO 360</h1>
        </div>

        <div class="grid grid-cols-3 gap-5 text-justify px-5">
            <div>
                <h3 class="text-secondary">O que é o Evasão 360</h3>
                <h5>&nbsp;&nbsp; O Evasão360 é um projeto que prevê a probabilidade de um estudante abandonar a
                    graduação, analisando diversos fatores que influenciam essa decisão, como desempenho acadêmico,
                    situação financeira e engajamento. Com essa visão completa, o objetivo é ajudar as instituições a
                    identificar alunos em risco e agir preventivamente, oferecendo suporte personalizado. Dessa forma, é
                    possível antecipar problemas e direcionar recursos de forma mais eficiente, aumentando as chances de
                    que os estudantes permaneçam e concluam seus cursos.</h5>
            </div>

            <div>
                <h3 class="text-secondary">Funcionalidades</h3>
                <h5>&nbsp;&nbsp; O Evasão360 utiliza dados acadêmicos e pessoais dos estudantes para identificar padrões
                    e calcular a probabilidade de evasão. Por meio dessa análise, o sistema gera relatórios detalhados e
                    envia alertas que permitem às instituições de ensino monitorar de forma proativa os alunos com maior
                    risco de abandono. Com essas informações, as instituições conseguem desenvolver estratégias mais
                    eficazes de apoio e retenção, direcionando recursos e ações específicas para ajudar os estudantes a
                    superar dificuldades e continuar seus estudos com sucesso.</h5>
            </div>

            <div>
                <h3 class="text-secondary">Utilidade UFSM</h3>
                <h5>&nbsp;&nbsp; O Evasão360 auxilia a UFSM a identificar alunos com risco de evasão de maneira
                    antecipada, possibilitando que a universidade tome ações rápidas e direcionadas para apoiar esses
                    estudantes. Com esse acompanhamento proativo, a UFSM consegue oferecer intervenções personalizadas
                    que aumentam a permanência dos alunos na graduação, promovendo um ambiente educacional mais
                    acolhedor e eficiente. Dessa forma, a universidade melhora seus índices de retenção e o sucesso
                    acadêmico dos estudantes de forma significativa.</h5>
            </div>
        </div>

        <div class="flex flex-nowrap gap-3 font-bold items-center justify-center w-full">
            <a href="/login" class="btn btn-primary btn-lg">
                Entrar
            </a>
        </div>
    </div>
</div>
</body>
</html>
