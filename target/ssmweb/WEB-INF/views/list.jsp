<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<META content="text/html; charset=utf-8" http-equiv=Content-Type >
<title>员工列表</title>

<%
    pageContext.setAttribute("Path", request.getContextPath());
%>

<link rel="stylesheet" href="${Path}/static/bootstrap-3.3.7/css/bootstrap.css" />


<script type="text/javascript" src="${Path}/static/bootstrap-3.3.7/js/bootstrap.js" />
<script type="text/javascript" src="${Path}/static/js/jquery-1.11.0.min.js"></script>

</head>
<body>
    <%-- 搭建页面 --%>
    <div class="container">
        <%-- 标题 --%>
        <div class="row">
            <div class="col-md-12">
                <h1>SSM-XFZ</h1>
            </div>
        </div>
        <%-- 按钮 --%>
        <div class="row">
            <div class="col-md-4 col-md-offset-8">
                <button type="button" class="btn btn-primary">新增</button>
                <button type="button" class="btn btn-danger">删除</button>
            </div>
        </div>
        <%-- 显示表格数据 --%>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <tr>
                        <th>员工ID</th>
                        <th>员工姓名</th>
                        <th>员工性别</th>
                        <th>员工邮箱</th>
                        <th>部门</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${pageInfo.list}" var="emp">
                        <tr>
                            <th>${emp.empId}</th>
                            <th>${emp.empName}</th>
                            <th>${emp.gender=="M"?"男":"女"}</th>
                            <th>${emp.email}</th>
                            <th>${emp.department.deptName}</th>
                            <th>
                                <button type="button" class="btn btn-primary btn-sm">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true">编辑</span>
                                </button>
                                <button type="button" class="btn btn-danger btn-sm">
                                    <span class="glyphicon glyphicon-remove" aria-hidden="true">删除</span>
                                </button>
                            </th>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        <%-- 显示分页信息 --%>
        <div class="row">
            <%-- 分页文字信息 --%>
            <div class="col-md-6">
                当前是第${pageInfo.pageNum}页,总页数:${pageInfo.pages},总记录数:${pageInfo.total}
            </div>
            <%-- 分页条信息 --%>
            <div class="col-md-6">
                <nav>
                    <ul class="pagination">
                        <li><a href="${Path}/emps?page=1">首页</a></li>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <li>
                                <a href="${Path}/emps?page=${pageInfo.prePage}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num" >
                            <c:if test="${page_Num == pageInfo.pageNum}">
                                <li class="active"><a href="#">${page_Num}</a></li>
                            </c:if>
                            <c:if test="${page_Num != pageInfo.pageNum}">
                                <li><a href="${Path}/emps?page=${page_Num}">${page_Num}</a></li>
                            </c:if>
                            <%--<c:if test="${page_Num != pageInfo.pageNum}">--%>
                                <%--<li><a href="#">${page_Num}</a></li>--%>
                            <%--</c:if>--%>
                        </c:forEach>

                        <c:if test="${pageInfo.hasNextPage}">
                            <li>
                                <a href="${Path}/emps?page=${pageInfo.nextPage}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <li><a href="${Path}/emps?page=${pageInfo.pages}">末页</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>


</body>
</html>