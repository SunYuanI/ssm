<%--
  Created by IntelliJ IDEA.
  User: buzz
  Date: 2022/2/14
  Time: 11:54
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>修改书籍</title>
    <!-- 引入 Bootstrap -->
    <link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
    <script src="<c:url value='/js/jquery-3.6.0.min.js'/>" type="text/javascript"></script>
    <script src="<c:url value='/js/bootstrap.min.js'/>" type="text/javascript"></script>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>修改书籍</small>
                </h1>
            </div>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/book/updateBook" method="post">
        <input type="hidden" name="id" value="${requestScope.updateBook.id}">
        <div class="mb-3">
            <label for="bookName" class="form-label">书籍名称</label>
            <input type="text" class="form-control" id="bookName" name="name" required value="${requestScope.updateBook.name}">
        </div>
        <div class="mb-3">
            <label for="bookCount" class="form-label">书籍数量</label>
            <input type="text" class="form-control" id="bookCount" name="count" required value="${requestScope.updateBook.count}">
        </div>
        <div class="mb-3">
            <label for="bookDetail" class="form-label">书籍详情</label>
            <input type="text" class="form-control" id="bookDetail" name="detail" required value="${requestScope.updateBook.detail}">
        </div>
        <button type="submit" class="btn btn-primary">提交修改</button>
    </form>
</div>
</body>
</html>

