<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增书籍</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>新增书籍</small>
                </h1>
            </div>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/book/addBook" method="post">
        <div class="form-group">
            <lable>书籍名称：</lable>
            <input type="text" name="bookName" class="form-control" required>
        </div>
        <div class="form-group">
            <lable>书籍数量：</lable>
            <input type="text" name="bookCounts" class="form-control" required>
        </div>
        <div class="form-group">
            <lable>书籍详情：</lable>
            <input type="text" name="detail" class="form-control" required>
        </div>
        <div class="form-group">
            <input type="submit" value="添加">
        </div>
    </form>
</div>

</body>
</html>
