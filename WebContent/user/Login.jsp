<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<style>
	body {background:url(../img/bg.png) top center no-repeat; background-size:cover;}
</style>

<title>登录</title>
	<%@include file="../nav.jsp"  %>
	<br/>
	<div class="login_container">
		<ul class="nav nav-tabs">
		  <li role="presentation" class="active"><a href="#">用户登录</a></li>
		  <li role="presentation"><a href="<%=request.getContextPath()+"/employee/Login.jsp"%>">员工登录</a></li>
		</ul>
	</div>
	
	<div id="path" style="display:none"><%=request.getContextPath() %></div>
	<br/>
	<form method="post" action="#" class="login_info">
		<div class="form-group container has-feedback">
			<input name="phoneNo" type="text" class="form-control login-field"
				id="phoneNo" style="width:270px" placeholder="账号" data-placement="top" data-content="登录失败"/>
		</div>
		<div class="form-group container has-feedback">
			<input name="password" type="password" class="form-control login-field"
				id="password" style="width:270px" placeholder="密码"/>
		</div>
		<button type="button" class="btn btn-primary" id="login" style="width: 270px; margin-left: 15px">登录</button>
	</form>
	
</body>
</html>
<script src="../js/jquery.js"></script>
<script src="../bootstrap/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<script src="../js/user.js"></script>