<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <jsp:include page="shared/header.jsp" />

    <title>Home</title>
</head>

<body class="flex items-center justify-center w-full h-[100vh]">
<div class="card bg-primary mx-[10%] h-[75%]">
    <ul class="nav flex items-center justify-between mb-3">
        <div class="flex flex-nowrap">
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="/home"><u>Início</u></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/relatorios">Relatórios</a>
            </li>
        </div>

        <li class="nav-item">
            <a class="nav-link" href="/login">Sair <i class="fa-solid fa-right-from-bracket"></i></a>
        </li>
    </ul>

    <div class="flex flex-col gap-3">
        <div class="flex flex-nowrap gap-3 font-bold items-center justify-center w-full">
            <img width="6%" src="${pageContext.request.contextPath}/img/logo-ufsm.webp" />
            <h1>EVASÃO 360</h1>
        </div>

        <div class="flex items-center justify-between w-full relative">
            <div class="absolute left-1/2 transform -translate-x-1/2">
                <h3 class="text-secondary"><i>Alunos com risco de evasão</i></h3>
            </div>

            <div></div>

            <div class="flex flex-nowrap gap-1">
                <select class="form-select" aria-label="Default select example">
                    <option selected>Centos</option>
                    <option value="1">CEFD</option>
                    <option value="2">CCSH</option>
                    <option value="3">CAL</option>
                </select>

                <select class="form-select" aria-label="Default select example">
                    <option selected>Curso</option>
                    <option value="1">Sistemas para Internet</option>
                    <option value="2">ED.Fisica</option>
                    <option value="3">Artes Visuais</option>
                </select>
            </div>
        </div>


        <div class="overflow-auto max-w-full max-h-85 modal-content">
            <table id="example" class="table table-striped">
                <thead>
                <tr>
                    <th>Matrícula</th>
                    <th>Nome</th>
                    <th>Curso</th>
                    <th>Risco de Evasão</th>
                    <th>+</th>
                </tr>
                </thead>
                <tbody id="table-body">
                </tbody>
            </table>
        </div>
    </div>


    <div class="pt-3">
        <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#tutorialModal">
            <img width="6%" src="${pageContext.request.contextPath}/img/losango.png" class="float-left" alt="coiso la" style="width: 40px; height: 60px; padding-top: 15px;">
            <p style="padding-top: 20px; padding-left: 50px;">Tutorial risco</p>
        </button>
    </div>
</div>

<div class="modal fade" id="studentModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="studentModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body" id="modal-body-content">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">X</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="tutorialModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="tutorialModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body" id="modal-body-content">
                <div class="flex justify-end w-full">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">X</button>
                </div>

                <div class="ml-2">
                    <h4 class="text-red-500"><i class="fa-solid fa-triangle-exclamation"></i> Alto</h4>
                    <p class="text-dark">Risco acima ou igual a 0.7 (70%).</p>
                    <h4 class="text-yellow-500"><i class="fa-solid fa-triangle-exclamation"></i> Moderado</h4>
                    <p class="text-dark">Risco entre 0.3 e 0.7 (30% - 70%).</p>
                    <h4 class="text-blue-500"><i class="fa-solid fa-triangle-exclamation"></i> Baixo</h4>
                    <p class="text-dark">Risco abaixo de 0.3 (30%).</p>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>

</html>

<%--<script>--%>
<%--    const alunos = [--%>
<%--        { matricula: "2023001", nome: "Ana Souza", curso: "Administração", risco: 0.15, email: "ana.souza@ufsm.br", cpf: "111.222.333-44", nascimento: "15/03/2002", telefone: "(55) 99999-0001", endereco: "Rua A, 123", frequencia: "95%", media: "8.5" },--%>
<%--        { matricula: "2023002", nome: "Bruno Lima", curso: "Engenharia Civil", risco: 0.45, email: "bruno.lima@ufsm.br", cpf: "222.333.444-55", nascimento: "20/07/2001", telefone: "(55) 99999-0002", endereco: "Rua B, 456", frequencia: "88%", media: "7.2" },--%>
<%--        { matricula: "654646563456", nome: "Henry", curso: "Sistemas para Internet", risco: 0.85, email: "henry@ufsm.br", cpf: "999.999.999-99", nascimento: "12/05/1912", telefone: "(55) 99999-9999", endereco: "R. dos Bobos, 0", frequencia: "55%", media: "6.2" },--%>
<%--        { matricula: "2023004", nome: "Daniela Rocha", curso: "Ciência da Computação", risco: 0.75, email: "daniela.rocha@ufsm.br", cpf: "444.555.666-77", nascimento: "30/11/2003", telefone: "(55) 99999-0004", endereco: "Rua D, 101", frequencia: "82%", media: "7.0" },--%>
<%--        { matricula: "2023005", nome: "Eduardo Tavares", curso: "Psicologia", risco: 0.90, email: "eduardo.tavares@ufsm.br", cpf: "555.666.777-88", nascimento: "05/01/2000", telefone: "(55) 99999-0005", endereco: "Rua E, 212", frequencia: "70%", media: "5.5" },--%>
<%--        { matricula: "2023001", nome: "Ana Souza", curso: "Administração", risco: 0.15, email: "ana.souza@ufsm.br", cpf: "111.222.333-44", nascimento: "15/03/2002", telefone: "(55) 99999-0001", endereco: "Rua A, 123", frequencia: "95%", media: "8.5" },--%>
<%--        { matricula: "2023002", nome: "Bruno Lima", curso: "Engenharia Civil", risco: 0.45, email: "bruno.lima@ufsm.br", cpf: "222.333.444-55", nascimento: "20/07/2001", telefone: "(55) 99999-0002", endereco: "Rua B, 456", frequencia: "88%", media: "7.2" },--%>
<%--        { matricula: "6546465", nome: "Henry", curso: "Sistemas para Internet", risco: 0.85, email: "henry@ufsm.br", cpf: "999.999.999-99", nascimento: "12/05/1912", telefone: "(55) 99999-9999", endereco: "R. dos Bobos, 0", frequencia: "55%", media: "6.2" },--%>
<%--    ];--%>

<%--    const tbody = document.getElementById('table-body');--%>
<%--    const modalBody = document.getElementById('modal-body-content');--%>

<%--    alunos.forEach(aluno => {--%>
<%--        const risco = aluno.risco;--%>
<%--        let nivelRisco = '';--%>
<%--        let icone = '';--%>
<%--        let corClasse = '';--%>

<%--        if (risco <= 0.3) {--%>
<%--            nivelRisco = 'Baixo';--%>
<%--            icone = 'fa-thumbs-up';--%>
<%--            corClasse = 'text-blue-500';--%>
<%--        } else if (risco <= 0.7) {--%>
<%--            nivelRisco = 'Moderado';--%>
<%--            icone = 'fa-triangle-exclamation';--%>
<%--            corClasse = 'text-yellow-500';--%>
<%--        } else {--%>
<%--            nivelRisco = 'Alto';--%>
<%--            icone = 'fa-triangle-exclamation';--%>
<%--            corClasse = 'text-red-500';--%>
<%--        }--%>

<%--        const row = document.createElement('tr');--%>
<%--        row.innerHTML = `--%>
<%--          <td>${aluno.matricula}</td>--%>
<%--          <td>${aluno.nome}</td>--%>
<%--          <td>${aluno.curso}</td>--%>
<%--          <td class="${corClasse}">--%>
<%--              ${nivelRisco} (${(risco * 100).toFixed(1)}%)--%>
<%--              <i class="fa-solid ${icone}"></i>--%>
<%--          </td>--%>
<%--          <td>--%>
<%--              <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#studentModal" onclick="showStudentDetails('${aluno.matricula}')">--%>
<%--                  <i class="fa-solid fa-arrow-up-right-from-square text-secondary"></i>--%>
<%--              </button>--%>
<%--          </td>--%>
<%--      `;--%>
<%--        tbody.appendChild(row);--%>
<%--    });--%>

<%--    function showStudentDetails(matricula) {--%>
<%--        const aluno = alunos.find(a => a.matricula === matricula);--%>
<%--        if (!aluno) return;--%>

<%--        let nivelRisco = '';--%>
<%--        if (aluno.risco <= 0.3) nivelRisco = 'Baixo';--%>
<%--        else if (aluno.risco <= 0.7) nivelRisco = 'Moderado';--%>
<%--        else nivelRisco = 'Alto';--%>

<%--        modalBody.innerHTML = `--%>
<%--            <div class="gap-4">--%>
<%--                <div class="row">--%>
<%--                    <div class="col-md-2 mb-3">--%>
<%--                                    <img src="${pageContext.request.contextPath}/img/henryfelizeanimado.png" class="img-fluid" alt="Foto do Aluno" style="width: 120px; height: 120px; object-fit: cover;">--%>
<%--                    </div>--%>
<%--                    <div class="col-md-9 mb-3">--%>
<%--                        <h5 class="text-secondary2"><b>Aluno:</b> ${aluno.nome}</h5>--%>
<%--                        <h5 class="text-secondary2"><b>Matrícula:</b> ${aluno.matricula}</h5>--%>
<%--                    </div>--%>
<%--                    <div class="col-md-1 mb-3">--%>
<%--                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">X</button>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="flex-grow-1">--%>
<%--                    <div class="row">--%>
<%--                        <div class="col-md-6 mb-3">--%>
<%--                            <label class="form-label">Email</label>--%>
<%--                            <input type="text" class="form-control" value="${aluno.email}" readonly>--%>
<%--                        </div>--%>
<%--                        <div class="col-md-6 mb-3">--%>
<%--                            <label class="form-label">CPF</label>--%>
<%--                            <input type="text" class="form-control" value="${aluno.cpf}" readonly>--%>
<%--                        </div>--%>
<%--                        <div class="col-md-6 mb-3">--%>
<%--                            <label class="form-label">Curso</label>--%>
<%--                            <input type="text" class="form-control" value="${aluno.curso}" readonly>--%>
<%--                        </div>--%>
<%--                        <div class="col-md-6 mb-3">--%>
<%--                            <label class="form-label">Data de nascimento</label>--%>
<%--                            <input type="text" class="form-control" value="${aluno.nascimento}" readonly>--%>
<%--                        </div>--%>
<%--                        <div class="col-md-6 mb-3">--%>
<%--                            <label class="form-label">Telefone</label>--%>
<%--                            <input type="text" class="form-control" value="${aluno.telefone}" readonly>--%>
<%--                        </div>--%>
<%--                         <div class="col-md-3 mb-3">--%>
<%--                            <label class="form-label">Frequência</label>--%>
<%--                            <input type="text" class="form-control" value="${aluno.frequencia}" readonly>--%>
<%--                        </div>--%>
<%--                         <div class="col-md-3 mb-3">--%>
<%--                            <label class="form-label">Média Geral</label>--%>
<%--                            <input type="text" class="form-control" value="${aluno.media}" readonly>--%>
<%--                        </div>--%>
<%--                        <div class="col-md-6 mb-3">--%>
<%--                            <label class="form-label">Endereço</label>--%>
<%--                            <input type="text" class="form-control" value="${aluno.endereco}" readonly>--%>
<%--                        </div>--%>
<%--                         <div class="col-md-6 mb-3">--%>
<%--                            <label class="form-label">Risco</label>--%>
<%--                            <input type="text" class="form-control" value="${nivelRisco}" readonly>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        `;--%>
<%--    }--%>
<%--</script>--%>