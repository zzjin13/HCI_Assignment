<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>计划列表</title>
<%@include file="../nav.jsp"%>

<br/>
<br/>
<div class="main_container">
	<p class="position">首页 > 计划查看</p>

	<table class="table table-responsive table-hover table_position2" id="plans" style="width:1000px;">
		<tr>
			<th>计划id</th>
			<th>店面id</th>
			<th>职员id</th>
			<th>开始时间</th>
			<th>结束时间</th>
			<th>状态</th>
			<%
				if (session.getAttribute("employee") != null) {
			%>
			<s:if test="#session.employee.authority == 1 || #session.employee.authority == 2">
			<th>查看详情</th>
			</s:if>
			<s:if test="#session.employee.authority == 2">
			<th>修改计划</th>
			</s:if>
			<%} %>
		</tr>
		<s:iterator id="plan" value="#session['planlist']">
			<tr>
				<td><s:property value="#plan['id']" /></td>
				<td><s:property value="#plan['bid']" /></td>
				<td><s:property value="#plan['eid']" /></td>
				<td><s:property value="#plan['start_regular']" /></td>
				<td><s:property value="#plan['end_regular']" /></td>
				<td><s:if test="#plan['state'] == 0">未审批</s:if><s:if test="#plan['state'] == 1">审批通过</s:if><s:if test="#plan['state'] == -1">审批不通过</s:if><s:if test="#plan['state'] == -2">已取消</s:if>
				<%
					if (session.getAttribute("employee") != null) {
				%>
				<s:if test="#session.employee.authority == 1 || #session.employee.authority == 2">
					<td>
						<button class="btn btn-primary p_info" data-toggle="modal" data-id="<s:property value="#plan['id']"/>" data-target="#myModal">查看详情</button>
					</td>
				</s:if>
				<s:if test="#session.employee.authority == 2 and #plan['state'] == -1">
					<td>
						<button class="btn btn-primary modify_plan" data-id="<s:property value="#plan['id']"/>" onclick="javascript:window.location.href='modifyPlan?id=<s:property value="#plan['id']"/>';">修改计划</button>
					</td>
				</s:if>
				<s:if test="#session.employee.authority == 2 and #plan['state'] != -1">
					<td>
						<button class="btn btn-default modify_plan" disabled="disabled">修改计划</button>
					</td>
				</s:if>
				<%
					}
				%>
			</tr>
		</s:iterator>
	</table>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="title">本计划信息</h4>
			</div>
			<div class="modal-body">
				<form>
					<p class="col-md-4">
        				计划id:
        			</p>
        			<p class="col-md-8" id="p_id"></p>
        			<br/>
        			<br/>
					<p class="col-md-4">
        				店铺id:
        			</p>
        			<p class="col-md-8" id="b_id"></p>
        			<br/>
        			<br/>
        			<p class="col-md-4">
        				制定人id:
        			</p>
        			<p class="col-md-8" id="e_id"></p>
					<br/>
        			<br/>
        			<p class="col-md-4">
        				计划开始时间:
        			</p>
        			<p class="col-md-8" id="start_date_modal"></p>
					<br/>
					<br/>
					<p class="col-md-4">
        				计划结束时间:
        			</p>
        			<p class="col-md-8" id="end_date_modal"></p>
				</form>
				<br/>
				<table class="table table-responsive table-hover" id="planitems">
					<tr>
						<th>商品id</th>
						<th>商品单价</th>
						<th>商品数量</th>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">我了解了</button>
				<%
					if (session.getAttribute("employee") != null) {
				%>
				<s:if
					test="#session.employee.authority == 1">
					<button type="button" class="btn btn-primary" name="passPlan"
						id="passPlan">审批通过</button>
					<button type="button" class="btn btn-danger" name="rejectPlan"
						id="rejectPlan">审批不通过</button>
				</s:if>
				<%
					}
				%>
			</div>
		</div>
	</div>
</div>
</body>
</html>

<script src="../js/jquery.js"></script>
<script src="../flatui/dist/js/flat-ui.min.js"></script>
<script src="../flatui/assets/js/application.js"></script>
<script src="../js/plan.js"></script>
<script src="../js/jquery-ui.js"></script>