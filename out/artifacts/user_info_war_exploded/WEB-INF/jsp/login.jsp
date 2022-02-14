<%--
  Created by IntelliJ IDEA.
  User: buzz
  Date: 2022/2/11
  Time: 21:01
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>管理员登录</title>
    <!-- 引入 Bootstrap -->
    <link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
    <script src="<c:url value='/js/jquery-3.6.0.min.js'/>" type="text/javascript"></script>
    <script src="<c:url value='/js/bootstrap.min.js'/>" type="text/javascript"></script>
    <script>
        function refreshCode() {
            var img = document.getElementById("vcode");
            img.src ="${pageContext.request.contextPath}/superUser/verifyCode?time=" + new Date().getTime();
        }
    </script>
</head>
<body>
<div class="container" style="width: 450px;">
    <h3 style="text-align: center;">管理员登录</h3>
    <form action="${pageContext.request.contextPath}/superUser/login" method="post">
        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="superuserName" placeholder="SuperuserName" name="name">
            <label for="superuserName">用户名</label>
        </div>
        <div class="form-floating mb-3">
            <input type="password" class="form-control" id="password" placeholder="Password" name="password">
            <label for="password">密码</label>
        </div>

        <div class="form-inline">
            <div class="form-floating">
                <input type="text" class="form-control" id="verifyCode" placeholder="验证码" name="verifyCode">
                <label for="verifyCode">验证码</label>
            </div>
            <a href="javascript:refreshCode()"><img src="${pageContext.request.contextPath}/superUser/verifyCode" title="看不清点击刷新" id="vcode"/></a>
        </div>
        <hr/>
        <div class="form-group" style="text-align: center;">
            <input class="btn btn btn-primary" type="submit" value="登录">
        </div>
    </form>

    <!-- 出错显示的信息框 -->
    <c:if test="${not empty requestScope.msg}">
        <div class="alert alert-warning alert-dismissible" role="alert">
            <strong>
                    ${requestScope.msg}
            </strong>
        </div>
    </c:if>
</div>
</body>
</html>