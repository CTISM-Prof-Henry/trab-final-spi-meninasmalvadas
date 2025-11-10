<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <jsp:include page="shared/header.jsp"/>
    <title>Relatórios - Evasão 360</title>
</head>

<body class="flex items-center justify-center w-full min-h-screen bg-gray-50 p-4 sm:p-6">
<div class="card bg-primary text-white w-full sm:w-[90%] md:w-[80%] lg:w-[70%] xl:w-[60%] h-auto md:h-[75vh] rounded-2xl shadow-lg p-4 sm:p-6 flex flex-col gap-6">

    <!-- NAV -->
    <ul class="nav flex flex-wrap items-center justify-between mb-4 gap-3 text-sm sm:text-base">
        <div class="flex flex-wrap gap-2">
            <li class="nav-item">
                <a class="nav-link" href="/home">Início</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active font-semibold" href="/relatorios"><u>Relatórios</u></a>
            </li>
        </div>

        <li class="nav-item">
            <a class="nav-link" href="/logout">Sair <i class="fa-solid fa-right-from-bracket"></i></a>
        </li>
    </ul>

    <!-- LOGO E TÍTULO -->
    <div class="flex flex-wrap gap-3 font-bold items-center justify-center text-center">
        <img class="w-12 sm:w-16 md:w-16" src="${pageContext.request.contextPath}/img/logo-ufsm.webp" alt="Logo UFSM"/>
        <h1 class="text-lg sm:text-2xl md:text-xl text-white">EVASÃO 360</h1>
    </div>

    <!-- TÍTULO SECUNDÁRIO -->
    <div class="flex items-center justify-center w-full relative">
        <h3 class="text-secondary text-center text-sm sm:text-base"><i>Gere um relatório</i></h3>
    </div>

    <!-- RELATÓRIO GERAL -->
    <div class="flex flex-col gap-2">
        <h6 class="text-sm sm:text-base">Relatórios Gerais</h6>

        <c:choose>
            <c:when test="${permissao == 'GERAL'}">
                <a href="/relatorioGeral" class="btn btn-danger btn-sm sm:btn-md mt-2">
                    <i class="fa-solid fa-file-pdf"></i>
                    <b>Gerar Relatório Geral de Alunos</b>
                </a>
            </c:when>

            <c:otherwise>
                <button class="btn btn-danger btn-sm sm:btn-md mt-2" disabled
                        title="Apenas administradores podem gerar este relatório">
                    <i class="fa-solid fa-lock"></i>
                    <b>Relatório Geral de Alunos (Restrito)</b>
                </button>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- RELATÓRIO POR CENTRO OU CURSO -->
    <div class="flex flex-col gap-2">
        <h6 class="text-sm sm:text-base">Evasão por Centro ou Curso</h6>

        <form class="flex flex-col sm:flex-row gap-3 w-full" action="/relatorios" method="get">
            <select name="centroId" class="form-select text-sm sm:text-base w-full sm:w-auto" id="centroSelect" onchange="this.form.submit()">
                <option value="">Centros</option>
                <c:forEach var="centro" items="${centros}">
                    <option value="${centro.id}" <c:if test="${centroSelecionadoId == centro.id}">selected</c:if>>
                            ${centro.nome}
                    </option>
                </c:forEach>
            </select>

            <select name="cursoId" class="form-select text-sm sm:text-base w-full sm:w-auto" id="cursoSelect" onchange="this.form.submit()">
                <option value="">Cursos</option>
                <c:forEach var="curso" items="${cursos}">
                    <option value="${curso.id}" <c:if test="${cursoSelecionadoId == curso.id}">selected</c:if>>
                            ${curso.nome}
                    </option>
                </c:forEach>
            </select>

            <a href="#" class="btn btn-primary btn-sm sm:btn-md mt-2 sm:mt-0 self-center sm:self-auto" onclick="gerarRelatorio()">
                <b>Gerar</b>
            </a>
        </form>
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
            url = `/relatorioByCurso/${cursoId}`;
        } else {
            url = `/relatorioByCentro/${centroId}`;
        }

        window.location.href = url;
    }
</script>

</body>
</html>
