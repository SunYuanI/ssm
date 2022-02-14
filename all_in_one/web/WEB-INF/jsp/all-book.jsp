<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!-- 引入 Bootstrap -->
    <link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
    <script src="<c:url value='/js/jquery-3.6.0.min.js'/>" type="text/javascript"></script>
    <script src="<c:url value='/js/bootstrap.min.js'/>" type="text/javascript"></script>
    <script>
        function deleteBook(id) {
            if (confirm("确认删除？")) {
                location.href = "${pageContext.request.contextPath}/book/deleteBook/" + id;
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="page-header">
                    <h1>
                        <small>书籍列表</small>
                    </h1>
                </div>
            </div>
        </div>
        <div class="row clearfix">
            <div class="col-md-4 column">
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/toAddBookPage">添加书籍</a>
            </div>
            <div class="col-md-8 column">
                <form action="${pageContext.request.contextPath}/book/queryBook" method="post" class="row row-cols-lg-auto g-3 align-items-center">
                    <div class="col-12">
                        <input class="form-control" type="text" placeholder="查询书籍的名称" name="queryName">
                    </div>
                    <div class="col-12">
                        <input class="btn btn-primary" type="submit" value="查询书籍">
                    </div>
                </form>
            </div>
        </div>
        <div class="row clearfix">
            <div class="col-md-12 column">
                <table class="table table-hover table-striped">
                    <thead>
                        <tr>
                            <th>书籍编号</th>
                            <th>书籍名称</th>
                            <th>书籍数量</th>
                            <th>书籍详情</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.books}" var="book">
                            <tr>
                                <td>${book.id}</td>
                                <td>${book.name}</td>
                                <td>${book.count}</td>
                                <td>${book.detail}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/book/updateBookPage/${book.id}" class="btn btn-outline-primary">修改</a>
                                    &nbsp;|&nbsp;
                                    <button class="btn btn-outline-danger" onclick="deleteBook(${book.id})">删除</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
