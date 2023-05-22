<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script>
        var cn;
        //= document.getElementById('cw');
        var c;
        var u = 10;
        const m = {
            x: innerWidth / 2,
            y: innerHeight / 2
        };
        window.onmousemove = function(e) {
            m.x = e.clientX;
            m.y = e.clientY;

        }
        function gc() {
            var s = "0123456789ABCDEF";
            var c = "#";
            for (var i = 0; i < 6; i++) {
                c += s[Math.ceil(Math.random() * 15)]
            }
            return c
        }
        var a = [];
        window.onload = function myfunction() {
            cn = document.getElementById('cw');
            c = cn.getContext('2d');

            for (var i = 0; i < 10; i++) {
                var r = 30;
                var x = Math.random() * (innerWidth - 2 * r) + r;
                var y = Math.random() * (innerHeight - 2 * r) + r;
                var t = new ob(innerWidth / 2,innerHeight / 2,5,"red",Math.random() * 200 + 20,2);
                a.push(t);
            }
            cn.style.backgroundColor = "#000000";

            c.lineWidth = "2";
            c.globalAlpha = 0.5;
            resize();
            anim()
        }
        window.onresize = function() {

            resize();

        }
        function resize() {
            cn.height = innerHeight;
            cn.width = innerWidth;
            for (var i = 0; i < 101; i++) {
                var r = 30;
                var x = Math.random() * (innerWidth - 2 * r) + r;
                var y = Math.random() * (innerHeight - 2 * r) + r;
                a[i] = new ob(innerWidth / 2,innerHeight / 2,4,gc(),Math.random() * 200 + 20,0.02);

            }
            //  a[0] = new ob(innerWidth / 2, innerHeight / 2, 40, "red", 0.05, 0.05);
            //a[0].dr();
        }
        function ob(x, y, r, cc, o, s) {
            this.x = x;
            this.y = y;
            this.r = r;
            this.cc = cc;
            this.theta = Math.random() * Math.PI * 2;
            this.s = s;
            this.o = o;
            this.t = Math.random() * 150;

            this.o = o;
            this.dr = function() {
                const ls = {
                    x: this.x,
                    y: this.y
                };
                this.theta += this.s;
                this.x = m.x + Math.cos(this.theta) * this.t;
                this.y = m.y + Math.sin(this.theta) * this.t;
                c.beginPath();
                c.lineWidth = this.r;
                c.strokeStyle = this.cc;
                c.moveTo(ls.x, ls.y);
                c.lineTo(this.x, this.y);
                c.stroke();
                c.closePath();

            }
        }
        function anim() {
            requestAnimationFrame(anim);
            c.fillStyle = "white";
            c.fillRect(0, 0, cn.width, cn.height);
            a.forEach(function(e, i) {
                e.dr();
            });

        }
    </script>

    <style>
        #cw {
            position: fixed;
            z-index: -1;
        }

        body {
            margin: 0;
            padding: 0;
            background-color: rgb(233, 240, 242);
        }
    </style>

    <style>
        body{

            cursor: url(https://cdn.jsdelivr.net/gh/moezx/cdn@3.1.9/img/Sakura/cursor/normal.cur), auto;
        }
    </style>

    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>

<canvas id="cw"></canvas>

<div class="container">


<%--    --------------------------------------------------------------------------------------%>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>书籍列表 —— 显示所有书籍</small>
                </h1>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 column">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/toAddBook">新增</a>
        </div>
        <div class="col-md-4 column"></div>
        <div class="col-md-4 column">
            <%--查询书籍--%>
            <form  class="form-inline" action="${pageContext.request.contextPath}/book/queryBookName" method="post" style="float: right">
                <input type="text" name="queryBookName" class="form-control" placeholder="请输入要查询的书籍">
                <input type="submit" value="查询" class="btn btn-primary">
            </form>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>书籍编号</th>
                    <th>书籍名字</th>
                    <th>书籍数量</th>
                    <th>书籍详情</th>
                    <th>操作</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="book" items="${list}">
                    <tr>
                        <td>${book.getBookId()}</td>
                        <td>${book.getBookName()}</td>
                        <td>${book.getBookCounts()}</td>
                        <td>${book.getDetail()}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/book/toUpdateBook?id=${book.getBookId()}">更改</a> |
                            <a href="${pageContext.request.contextPath}/book/del/${book.getBookId()}">删除</a>
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
