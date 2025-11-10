<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="shared/header.jsp"/>

    <title>Login</title>
</head>
<body class="flex items-center justify-center w-full h-[100vh] p-4 sm:p-6 bg-gray-100">
<div class="card bg-primary w-full max-w-sm lg:max-w-md mx-auto shadow-xl">
    <div class="card-body flex flex-col justify-between gap-5 p-6">
        <div class="flex flex-nowrap gap-3 font-bold items-center justify-center w-full">
            <img width="18%" src="${pageContext.request.contextPath}/img/logo-ufsm.webp"/>
            <h2>LOGIN</h2>
        </div>

        <div class="flex flex-col gap-3">
            <form action="${pageContext.request.contextPath}/login" method="POST">
                <div>
                    <label for="email_user" class="form-label">E-mail <span
                            class="text-xs"><i>(seu email)</i></span></label>
                    <input type="email" class="form-control form-control-lg" id="email" name="email"
                           placeholder="ufsm.poli@acad.ufsm.br">
                </div>

                <div>
                    <label for="senha_user" class="form-label">Senha</label>
                    <input type="password" class="form-control form-control-lg" id="senha" name="senha"
                           placeholder="**********">
                </div>
        </div>

        <div class="flex flex-col gap-2 font-bold items-center justify-center w-full">
            <button type="submit" class="btn btn-primary">Entrar</button>
            <a class="text-white" href="${pageContext.request.contextPath}/">Voltar</a>
        </div>
        </form>
    </div>
</div>
</body>


<%--</head>--%>
<%--<body class="flex items-center justify-center w-full h-[100vh]">--%>
<%--<div class="card bg-primary max-w-[24%] mx-[10%] h-[55%]">--%>
<%--    <div class="card-body flex flex-col justify-between gap-5">--%>
<%--        <div class="flex flex-nowrap gap-3 font-bold items-center justify-center w-full">--%>
<%--            <img width="20%" src="${pageContext.request.contextPath}/img/logo-ufsm.webp"/>--%>
<%--            <h1>LOGIN</h1>--%>
<%--        </div>--%>

<%--        <div class="flex flex-col gap-3">--%>
<%--            <c:if test="${not empty erro}">--%>
<%--                <p class="error">${erro}</p>--%>
<%--            </c:if>--%>

<%--            <form action="${pageContext.request.contextPath}/login" method="post">--%>
<%--                <div>--%>
<%--                    <label for="email_user" class="form-label">Email: <span--%>
<%--                            class="text-xs"><i>(seu email)</i></span></label>--%>
<%--                    <input type="email" name="email" class="form-control form-control-lg" id="email_user"--%>
<%--                           placeholder="ufsm.poli@acad.ufsm.br" required>--%>
<%--                </div>--%>
<%--                <div class="form-group">--%>
<%--                    <label for="senha_user" class="form-label">Senha:</label>--%>
<%--                    <input type="password" name="senha" class="form-control form-control-lg" id="senha_user"--%>
<%--                           placeholder="**********" required>--%>
<%--                </div>--%>

<%--                <div class="flex flex-col gap-2 font-bold items-center justify-center w-full">--%>
<%--                    <button type="submit" class="btn btn-primary">Entrar</button>--%>
<%--                    <a class="text-white" href="${pageContext.request.contextPath}/">Voltar</a>--%>
<%--                </div>--%>
<%--            </form>--%>

<%--    </div>--%>
<%--</div>--%>
<%--</body>--%>
</html>