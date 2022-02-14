<%--
  Created by IntelliJ IDEA.
  User: buzz
  Date: 2022/2/11
  Time: 22:19
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- HTML5文档-->
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
    <title>添加用户</title>

    <!-- 引入 Bootstrap -->
    <link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
    <script src="<c:url value='/js/jquery-3.6.0.min.js'/>" type="text/javascript"></script>
    <script src="<c:url value='/js/bootstrap.min.js'/>" type="text/javascript"></script>
</head>
<body>
<div class="container" style="width: 450px">
    <h3 style="text-align: center">添加新用户</h3>
    <form action="${pageContext.request.contextPath}/user/addUser" method="post">
        <div class="row mb-3">
            <label for="name" class="col-sm-2 col-form-label">姓名:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="name" placeholder="请输入姓名" name="name">
            </div>
        </div>
        <fieldset class="row mb-3">
            <legend class="col-form-label col-sm-2 pt-0">性别:</legend>
            <div class="col-sm-10">
                <div class="form-group">
                    <label class="ratio-inline" for="male">
                        <input class="form-check-input" type="radio" name="sex" id="male" value="male" checked>男
                    </label>
                    <label class="ratio-inline" for="female">
                        <input class="form-check-input" type="radio" name="sex" id="female" value="female">女
                    </label>
                </div>
            </div>
        </fieldset>
        <div class="row mb-3">
            <label for="age" class="col-sm-2 col-form-label">年龄:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="age" placeholder="请输入年龄" name="age">
            </div>
        </div>

        <div class="row mb-3">
            <label for="birthplace" class="col-sm-2 col-form-label">籍贯:</label>
            <div class="col-sm-10">
                <select class="form-select" aria-label="Default select example" id="birthplace" name="birthplace">
                    <option selected>选择出生地</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                </select>
            </div>
        </div>
        <div class="row mb-3">
            <label for="qq" class="col-sm-2 col-form-label">QQ:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="qq" placeholder="请输入QQ号" name="qq">
            </div>
        </div>
        <div class="row mb-3">
            <label for="email" class="col-sm-2 col-form-label">Email:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="email" placeholder="请输入邮箱" name="email">
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