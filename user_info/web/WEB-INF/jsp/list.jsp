<%--
  Created by IntelliJ IDEA.
  User: buzz
  Date: 2022/2/11
  Time: 21:02
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
<head>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <!-- 使用Edge最新的浏览器的渲染方式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- viewport视口：网页可以根据设置的宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同。
    width: 默认宽度与设备的宽度相同
    initial-scale: 初始的缩放比，为1:1 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>用户信息管理系统</title>

    <!-- 引入 Bootstrap -->
    <link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
    <script src="<c:url value='/js/jquery-3.6.0.min.js'/>" type="text/javascript"></script>
    <script src="<c:url value='/js/bootstrap.min.js'/>" type="text/javascript"></script>

    <script>
        function deleteUser(id) {
            if (confirm("确认删除")) {
                location.href = "${pageContext.request.contextPath}/user/deleteUser/"+id;
            }
        }
        function deleteSelect() {
            if (confirm("确认删除")) {
                document.getElementById("id_form").submit();
            }
        }
        window.onload = function () {
            var top_chbox_button = document.getElementById("chbox_all");
            top_chbox_button.onclick = function () {
                var boxes = document.getElementsByName("chbox");
                for (var i = 0; i < boxes.length; i++) {
                    boxes[i].checked = top_chbox_button.checked;
                }
            }
        }
    </script>
</head>
<body>
<div class="container">
    <h3 style="text-align: center">用户信息列表</h3>

    <div class="row">
        <div class="col-md-9">
            <form class="row row-cols-lg-auto g-3 align-items-center" action="${pageContext.request.contextPath}/user/findByPage/${requestScope.currentPage}/2" id="search_form">
                <div class="col-12">
                    <div class="input-group">
                        <div class="input-group-text">姓名</div>
                        <input type="text" class="form-control" id="inlineFormInputGroupUsername" placeholder="姓名" name="name" value="${requestScope.search_name}">
                    </div>
                </div>

                <div class="col-12">
                    <div class="input-group">
                        <div class="input-group-text">籍贯</div>
                        <input type="text" class="form-control" id="userBithplace" placeholder="籍贯" name="birthplace" value="${requestScope.search_birthplace}">
                    </div>
                </div>

                <div class="col-12">
                    <div class="input-group">
                        <div class="input-group-text">邮箱</div>
                        <input type="text" class="form-control" id="userEmail" placeholder="邮箱" name="email" value="${requestScope.search_email}">
                    </div>
                </div>
                <div class="col-12">
                    <button type="submit" class="btn btn-primary">查询</button>
                </div>
            </form>
        </div>

        <div class="col-md-3">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/user/toAddUserPage">添加联系人</a>
            <a class="btn btn-danger" href="javascript:void(0)" onclick="deleteSelect()">删除选中</a>
        </div>

    </div>
    <div class="row">
        <form action="${pageContext.request.contextPath}/user/deleteSelect" method="post" id="id_form">
            <table class="table table-hover caption-top align-middle">
                <caption></caption>
                <tr class="success">
                    <th><input type="checkbox" id="chbox_all"></th>
                    <th>编号</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>年龄</th>
                    <th>籍贯</th>
                    <th>QQ</th>
                    <th>邮箱</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${users}" var="user" varStatus="s">
                    <tr>
                        <th><input type="checkbox" name="chbox" value="${user.id}"></th>
                        <th>${s.count}</th>
                        <th>${user.name}</th>
                        <th>${user.sex}</th>
                        <th>${user.age}</th>
                        <th>${user.birthplace}</th>
                        <th>${user.qq}</th>
                        <th>${user.email}</th>
                        <td><a class="btn btn-outline-primary " href="${pageContext.request.contextPath}/user/updateUser/${user.id}">修改</a>&nbsp;
                            <button class="btn btn-outline-danger" onclick="javascript:deleteUser(${user.id})">删除</button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </form>

    </div>
    <div class="row center">
        <nav aria-label="Page navigation example">
            <ul class="pagination">
                <c:if test="${requestScope.currentPage == 1}">
                    <li class="page-item disabled">
                        <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${requestScope.currentPage > 1}">
                    <li class="page-item">
                        <a class="page-link" href="${pageContext.request.contextPath}/user/findByPage/${requestScope.currentPage - 1}/2?name=${requestScope.search_name}&birthplace=${requestScope.search_birthplace}&email=${requestScope.search_email}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:forEach var="s" begin="1" end="${requestScope.pages}">
                    <c:if test="${requestScope.currentPage != s}">
                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/user/findByPage/${s}/2?name=${requestScope.search_name}&birthplace=${requestScope.search_birthplace}&email=${requestScope.search_email}">${s}</a></li>
                    </c:if>
                    <c:if test="${requestScope.currentPage == s}">
                        <li class="page-item"><a class="page-link active" href="${pageContext.request.contextPath}/user/findByPage/${s}/2?name=${requestScope.search_name}&birthplace=${requestScope.search_birthplace}&email=${requestScope.search_email}">${s}</a></li>
                    </c:if>
                </c:forEach>
                <c:if test="${requestScope.currentPage == requestScope.pages}">
                    <li class="page-item disabled">
                        <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${requestScope.currentPage < requestScope.pages}">
                    <li class="page-item">
                        <a class="page-link" href="${pageContext.request.contextPath}/user/findByPage/${requestScope.currentPage + 1}/2?name=${requestScope.search_name}&birthplace=${requestScope.search_birthplace}&email=${requestScope.search_email}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
                <span style="font-size: 25px; margin-left: 10px" >共${requestScope.totalCounts}条记录${requestScope.pages}页</span>
            </ul>
        </nav>
    </div>

</div>
</body>
</html>
