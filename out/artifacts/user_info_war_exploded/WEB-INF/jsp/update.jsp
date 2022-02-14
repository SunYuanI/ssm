<%--
  Created by IntelliJ IDEA.
  User: buzz
  Date: 2022/2/13
  Time: 10:22
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
<head>
<%--    <base href="<%=basePath%>"/>--%>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>修改用户</title>

    <!-- 引入 Bootstrap -->
    <link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
    <script src="<c:url value='/js/jquery-3.6.0.min.js'/>" type="text/javascript"></script>
    <script src="<c:url value='/js/bootstrap.min.js'/>" type="text/javascript"></script>

</head>
<body>
<div class="container" style="width: 450px;">
    <h3 style="text-align: center;">修改联系人</h3>
    <form action="${pageContext.request.contextPath}/user/confirmModify" method="post">
        <input type="hidden" value="${requestScope.user.id}" name="id">
        <div class="row mb-3">
            <label for="userName" class="col-sm-2 col-form-label">姓名:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="userName" placeholder="请输入姓名" value="${requestScope.user.name}" name="name">
            </div>
        </div>
        <fieldset class="row mb-3">
            <legend class="col-form-label col-sm-2 pt-0">性别:</legend>
            <div class="col-sm-10">
                <div class="form-group">
                    <c:if test="${requestScope.user.sex == 'male'}">
                        <label class="ratio-inline" for="male">
                            <input class="form-check-input" type="radio" name="sex" id="male" value="male" checked>男
                        </label>
                        <label class="ratio-inline" for="female">
                            <input class="form-check-input" type="radio" name="sex" id="female" value="female">女
                        </label>
                    </c:if>
                    <c:if test="${requestScope.user.sex == 'female'}">
                        <label class="ratio-inline" for="male">
                            <input class="form-check-input" type="radio" name="sex" id="male" value="male">男
                        </label>
                        <label class="ratio-inline" for="female">
                            <input class="form-check-input" type="radio" name="sex" id="female" value="female" checked>女
                        </label>
                    </c:if>
                </div>
            </div>
        </fieldset>
        <div class="row mb-3">
            <label for="userAge" class="col-sm-2 col-form-label">年龄:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="userAge" placeholder="请输入年龄" value="${requestScope.user.age}" name="age">
            </div>
        </div>
        <div class="row mb-3">
            <label for="userBirthplace" class="col-sm-2 col-form-label">籍贯:</label>
            <div class="col-sm-10">
                <select class="form-select" aria-label="Default select example" id="userBirthplace" name="birthplace">
                    <option selected>选择籍贯</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                </select>
            </div>
        </div>
        <div class="row mb-3">
            <label for="userQq" class="col-sm-2 col-form-label">QQ:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="userQq" placeholder="请输入QQ号" value="${requestScope.user.qq}" name="qq">
            </div>
        </div>
        <div class="row mb-3">
            <label for="userEmail" class="col-sm-2 col-form-label">Email:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="userEmail" placeholder="请输入邮箱" value="${requestScope.user.email}" name="email">
            </div>
        </div>
        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="提交" />
            <input class="btn btn-danger" type="reset" value="重置" />
            <a href="${pageContext.request.contextPath}/user/findAll">
                <input class="btn btn-secondary" type="button" value="返回"/>
            </a>
        </div>
    </form>
</div>
</body>
</html>
