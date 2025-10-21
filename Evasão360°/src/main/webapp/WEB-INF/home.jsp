<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                <a class="nav-link active" aria-current="page" href="/home"><u>Início</u></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/relatorios">Relatórios</a>
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

        <div class="flex items-center justify-between w-full relative">
            <div class="absolute left-1/2 transform -translate-x-1/2">
                <h3 class="text-secondary"><i>Alunos com risco de evasão</i></h3>
            </div>
            <div></div>
            <div class="flex flex-nowrap gap-1">
                <form action="/home" method="get">
                    <select name="centroId" class="form-select" id="centroSelect" onchange="this.form.submit()">
                        <option value="">Centros</option>
                        <c:forEach var="centro" items="${centros}">
                            <option value="${centro.id}" <c:if test="${centroSelecionadoId == centro.id}">selected</c:if>>
                                    ${centro.nome}
                            </option>
                        </c:forEach>
                    </select>
                    <select name="cursoId" class="form-select" id="cursoSelect" onchange="this.form.submit()">
                        <option value="">Cursos</option>
                        <c:forEach var="curso" items="${cursos}">
                            <option value="${curso.id}" <c:if test="${cursoSelecionadoId == curso.id}">selected</c:if>>
                                    ${curso.nome}
                            </option>
                        </c:forEach>
                    </select>
                </form>
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
                <c:forEach items="${alunos}" var="aluno">
                    <tr>
                        <td>${aluno.matricula}</td>
                        <td>${aluno.nome}</td>
                        <td>${aluno.cursoNome}</td>
                        <c:choose>
                            <c:when test="${aluno.risco >= 0.7}">
                                <td class="text-red-500">Alto (<fmt:formatNumber value="${aluno.risco * 100}" maxFractionDigits="0"/>%) <i class="fa-solid fa-triangle-exclamation"></i></td>
                            </c:when>
                            <c:when test="${aluno.risco > 0.3}">
                                <td class="text-yellow-500">Moderado (<fmt:formatNumber value="${aluno.risco * 100}" maxFractionDigits="0"/>%) <i class="fa-solid fa-triangle-exclamation"></i></td>
                            </c:when>
                            <c:otherwise>
                                <td class="text-blue-500">Baixo (<fmt:formatNumber value="${aluno.risco * 100}" maxFractionDigits="0"/>%) <i class="fa-solid fa-thumbs-up"></i></td>
                            </c:otherwise>
                        </c:choose>
                        <td>
                            <button type="button" class="btn btn-show-details"
                                    data-bs-toggle="modal" data-bs-target="#studentModal"
                                    data-matricula="${aluno.matricula}">
                                <i class="fa-solid fa-arrow-up-right-from-square text-secondary"></i>
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <div class="pt-3">
        <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#tutorialModal">
            <img width="6%" src="${pageContext.request.contextPath}/img/losango.png" class="float-left" alt="Tutorial Risco" style="width: 40px; height: 60px; padding-top: 15px;">
            <p style="padding-top: 20px; padding-left: 50px;">Tutorial risco</p>
        </button>
    </div>
</div>

<%-- MODAL DE DETALHES DO ALUNO --%>
<div class="modal fade" id="studentModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="studentModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body">
                <div class="gap-4">
                    <div class="row">
                        <div class="col-md-2 mb-3"><img src="${pageContext.request.contextPath}/img/henryfelizeanimado.png" class="img-fluid" alt="Foto" style="width: 120px; height: 120px; object-fit: cover;"></div>
                        <div class="col-md-9 mb-3">
                            <h5 class="text-secondary2"><b>Aluno:</b> <span id="modal-nome"></span></h5>
                            <h5 class="text-secondary2"><b>Matrícula:</b> <span id="modal-matricula"></span></h5>
                        </div>
                        <div class="col-md-1 mb-3"><button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">X</button></div>
                    </div>
                    <div class="flex-grow-1">
                        <div class="row">
                            <div class="col-md-6 mb-3"><label class="form-label">Email</label><input type="text" class="form-control" id="modal-email" value="" readonly></div>
                            <div class="col-md-6 mb-3"><label class="form-label">CPF</label><input type="text" class="form-control" id="modal-cpf" value="" readonly></div>
                            <div class="col-md-6 mb-3"><label class="form-label">Curso</label><input type="text" class="form-control" id="modal-curso" value="" readonly></div>
                            <div class="col-md-6 mb-3"><label class="form-label">Data de nascimento</label><input type="text" class="form-control" id="modal-nascimento" value="" readonly></div>
                            <div class="col-md-6 mb-3"><label class="form-label">Telefone</label><input type="text" class="form-control" id="modal-telefone" value="" readonly></div>
                            <div class="col-md-3 mb-3"><label class="form-label">Frequência</label><input type="text" class="form-control" id="modal-frequencia" value="" readonly></div>
                            <div class="col-md-3 mb-3"><label class="form-label">Média Geral</label><input type="text" class="form-control" id="modal-media" value="" readonly></div>
                            <div class="col-md-6 mb-3"><label class="form-label">Endereço</label><input type="text" class="form-control" id="modal-endereco" value="" readonly></div>
                            <div class="col-md-6 mb-3"><label class="form-label">Risco</label><input type="text" class="form-control" id="modal-risco" value="" readonly></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%-- MODAL TUTORIAL RISCO --%>
<div class="modal fade" id="tutorialModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="tutorialModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body">
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<%-- JAVAHORRORES pra combinar ocm halloween --%>
<script>
    // busca dados e preenche o modal, vai em inglkes agora to funcionar
    function fillStudentModal(matricula) {
        console.log("fillStudentModal para matrícula ", matricula);

        // verif se a matrícula é válida
        if (!matricula || typeof matricula !== 'string' || matricula.trim() === '') {
            console.error("Matrícula inválida recebida: ", matricula);
            alert("Erro interno: matrícula inválida");
            return;
        }

        const matriculaLimpa = matricula.trim();
        console.log("matrícula clean girl:", matriculaLimpa);

        // campos do modal
        const modalFields = {
            matriculaSpan: document.getElementById('modal-matricula'),
            nomeSpan: document.getElementById('modal-nome'),
            emailInput: document.getElementById('modal-email'),
            cpfInput: document.getElementById('modal-cpf'),
            cursoInput: document.getElementById('modal-curso'),
            nascimentoInput: document.getElementById('modal-nascimento'),
            telefoneInput: document.getElementById('modal-telefone'),
            frequenciaInput: document.getElementById('modal-frequencia'),
            mediaInput: document.getElementById('modal-media'),
            enderecoInput: document.getElementById('modal-endereco'),
            riscoInput: document.getElementById('modal-risco')
        };

        // limpar modal
        modalFields.matriculaSpan.textContent = 'carregando...';
        modalFields.nomeSpan.textContent = 'carregando...';
        // limpar inputs
        Object.keys(modalFields).forEach(key => {
            if (modalFields[key] && modalFields[key].tagName === 'INPUT') {
                modalFields[key].value = '';
            }
        });

        const url = '/aluno?matricula=' + encodeURIComponent(matriculaLimpa);
        console.log("URL para fetch: ", url);

        fetch(url)
            .then(response => {
                console.log("Resposta:", response.status);
                if (!response.ok) {
                    throw new Error(`Erro na rede: ${response.status} ${response.statusText}`);
                }
                return response.text();
            })
            .then(text => {
                console.log("Resposta do servidor:", text);
                if (!text) {
                    throw new Error("Resposta do servidor vazia");
                }
                try {
                    return JSON.parse(text);
                } catch (e) {
                    console.error("Falha ao converter JSON:", e);
                    throw new Error("A resposta do servidor não é um JSON válido");
                }
            })
            .then(aluno => {
                console.log("Dados JSON recebidos: ", aluno);

                if (aluno && typeof aluno === 'object' && aluno.matricula) {
                    console.log("preenchendo modal.............");
                    modalFields.matriculaSpan.textContent = aluno.matricula || 'N/A';
                    modalFields.nomeSpan.textContent = aluno.nome || 'N/A';
                    modalFields.emailInput.value = aluno.email || 'N/A';
                    modalFields.cpfInput.value = aluno.cpf || 'N/A';
                    modalFields.cursoInput.value = aluno.cursoNome || 'N/A';
                    modalFields.nascimentoInput.value = aluno.nascimento || 'N/A';
                    modalFields.telefoneInput.value = aluno.telefone || 'N/A';
                    modalFields.enderecoInput.value = aluno.endereco || 'N/A';
                    modalFields.frequenciaInput.value = aluno.frequencia != null ? `${aluno.frequencia}%` : 'N/A';
                    modalFields.mediaInput.value = aluno.media != null ? aluno.media.toString() : 'N/A';

                    let nivelRiscoTexto = 'N/A';
                    if (aluno.risco != null) {
                        const riscoPercent = aluno.risco * 100;
                        if (aluno.risco >= 0.7) nivelRiscoTexto = `Alto (${riscoPercent.toFixed(0)}%)`;
                        else if (aluno.risco > 0.3) nivelRiscoTexto = `Moderado (${riscoPercent.toFixed(0)}%)`;
                        else nivelRiscoTexto = `Baixo (${riscoPercent.toFixed(0)}%)`;
                    }
                    modalFields.riscoInput.value = nivelRiscoTexto;
                    console.log("modal preenchidooooo");
                } else {
                    console.error("Null, vazio ou JSON inválido: ", aluno);
                    alert('Aluno não encontrado ou dados inválidos');
                    modalFields.matriculaSpan.textContent = 'Erro';
                    modalFields.nomeSpan.textContent = 'Dados não encontrados';
                }
            })
            .catch(error => {
                console.error('Erro geral: ', error);
                alert(`Não foi possível carregar os dados do aluno ${error.message}`);
                modalFields.matriculaSpan.textContent = 'Erro';
                modalFields.nomeSpan.textContent = 'Falha ao carregar';
            });
    }

    // event listener DEPOIS que a página carregar viu
    document.addEventListener('DOMContentLoaded', (event) => {
        // botões p abrir o modal
        const detailButtons = document.querySelectorAll('.btn-show-details');

        // evento de clique
        detailButtons.forEach(button => {
            button.addEventListener('click', function() {
                // pega a matrícula de data-matricula do botão ne
                const matricula = this.getAttribute('data-matricula');
                // preenche o modal
                fillStudentModal(matricula);
            });
        });
    });
</script>
</body>
</html>