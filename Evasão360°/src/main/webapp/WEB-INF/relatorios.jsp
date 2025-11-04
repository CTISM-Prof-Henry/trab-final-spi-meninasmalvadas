<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="shared/header.jsp"/>

    <title>Home</title>
</head>
<body class="flex items-center justify-center w-full h-[100vh]">
<div class="card bg-primary mx-[10%] h-[75%]">
    <ul class="nav flex items-center justify-between mb-3">
        <div class="flex flex-nowrap">
            <li class="nav-item">
                <a class="nav-link" aria-current="page" href="/home">Início</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="/relatorios"><u>Relatórios</u></a>
            </li>
        </div>

        <li class="nav-item">
            <a class="nav-link" href="/logout">Sair <i class="fa-solid fa-right-from-bracket"></i></a>
        </li>
    </ul>

    <div class="flex flex-col gap-3">
        <div class="flex flex-nowrap gap-3 font-bold items-center justify-center w-full">
            <img width="6%" src="${pageContext.request.contextPath}/img/logo-ufsm.webp"/>
            <h1>EVASÃO 360</h1>
        </div>

        <div class="flex items-center justify-center w-full relative">
            <h3 class="text-secondary"><i>Gere um relatório</i></h3>
        </div>

        <div class="mt-4">
            <h6>Relatórios Gerais</h6>

            <c:choose>
                <c:when test="${permissao == 'GERAL'}">
                    <a href="/relatorioGeral" class="btn btn-danger btn-md mt-2">
                        <i class="fa-solid fa-file-pdf"></i>
                        <b>Gerar Relatório Geral de Alunos</b>
                    </a>
                </c:when>

                <c:otherwise>
                    <button class="btn btn-danger btn-md mt-2" disabled
                            title="Apenas administradores podem gerar este relatório">
                        <i class="fa-solid fa-lock"></i>
                        <b>Relatório Geral de Alunos (Restrito)</b>
                    </button>
                </c:otherwise>
            </c:choose>
        </div>
<%--        <div class="flex flex-col gap-5 mt-3">--%>
<%--            <div>--%>
<%--                <h6>Comparar cursos</h6>--%>
<%--                <div class="flex flex-nowrap gap-3">--%>
<%--                    <select class="form-select max-w-[300px]" aria-label="Default select example">--%>
<%--                        <option selected>Selecione</option>--%>
<%--                        <option value="1">One</option>--%>
<%--                        <option value="2">Two</option>--%>
<%--                        <option value="3">Three</option>--%>
<%--                    </select>--%>

<%--                    <select class="form-select max-w-[300px]" aria-label="Default select example">--%>
<%--                        <option selected>Selecione</option>--%>
<%--                        <option value="1">One</option>--%>
<%--                        <option value="2">Two</option>--%>
<%--                        <option value="3">Three</option>--%>
<%--                    </select>--%>

<%--                    <button type="button" class="btn btn-light">--%>
<%--                        <i class="fa-solid fa-plus"></i>--%>
<%--                    </button>--%>
<%--                </div>--%>
<%--                <a href="#" class="btn btn-primary btn-md mt-2">--%>
<%--                    <b>Gerar</b>--%>
<%--                </a>--%>
<%--            </div>--%>

            <div >
                <h6>Evolução por curso</h6>
                    <form class="flex flex-nowrap gap-3" action="/relatorios" method="get">
                        <select name="centroId" class="form-select max-w-[300px]" id="centroSelect" onchange="this.form.submit()">
                            <option value="">Centros</option>
                            <c:forEach var="centro" items="${centros}">
                                <option value="${centro.id}" <c:if test="${centroSelecionadoId == centro.id}">selected</c:if>>
                                        ${centro.nome}
                                </option>
                            </c:forEach>
                        </select>

                        <select name="cursoId" class="form-select max-w-[300px]" id="cursoSelect" onchange="this.form.submit()">
                            <option value="">Cursos</option>
                            <c:forEach var="curso" items="${cursos}">
                                <option value="${curso.id}" <c:if test="${cursoSelecionadoId == curso.id}">selected</c:if>>
                                        ${curso.nome}
                                </option>
                            </c:forEach>
                        </select>
                        <a href="#"
                           class="btn btn-primary btn-md mt-2"
                           onclick="gerarRelatorio()">
                            <b>Gerar</b>
                        </a>
                    </form>

            </div>
        </div>
    </div>
</div>
<script>
    function gerarRelatorio() {
        const centroId = document.getElementById("centroSelect").value;
        const cursoId = document.getElementById("cursoSelect").value;

        if (!centroId) {
            alert("Por favor, selecione um centro antes de gerar o relatório.");
            return;
        }

        let url;
        if (cursoId) {
            // Relatório específico de curso
            url = `/relatorioByCurso/${cursoId}`;
        } else {
            // Relatório geral do centro
            url = `/relatorioByCentro/${centroId}`;
        }

        window.location.href = url;
    }
</script>
</body>
</html>
