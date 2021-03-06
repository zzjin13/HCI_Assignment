<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>销售(有卡)</title>
<%@include file="../nav.jsp"%>

<style>
	p{
		font-size:18px;
	}
</style>

<br/>
<br/>
<div class="main_container">
	<p class="position">首页 > 有卡销售</p>
	<br/>
	<ul class="nav nav-tabs nav-stacked" style="width:100px;float:left">
	  <li role="presentation" class="active"><a href="#">有卡</a></li>
	  <li role="presentation"><a href="<%=request.getContextPath()+"/sale/saleCash.jsp"%>">无卡</a></li>
	</ul>
	<table class="table table-responsive table-hover sale_table" id="saleitems" style="margin-top:0px;">
		<tr>
			<th>商品编号</th>
			<th>商品单价</th>
			<th>商品数量</th>
			<%
				if (session.getAttribute("employee") != null) {
			%>
			<s:if test="#session.employee.authority == 3">
				<th>删除商品</th>
			</s:if>
			<%
				}
			%>
		</tr>
		<s:iterator id="item" value="#session['saleitemlist']">
			<tr>
				<td><s:property value="#item['gid']" /></td>
				<td><s:property value="#item['item_price']" /></td>
				<td><s:property value="#item['number']" /></td>
				<%
					if (session.getAttribute("employee") != null) {
				%>
				<s:if test="#session.employee.authority == 3">
					<td><button class="btn btn-primary d_info"
							data-id="<s:property value="#item['gid']"/>">删除条目</button></td>
				</s:if>
				<%
					}
				%>
			</tr>
		</s:iterator>
	</table>
	
	<form action="addgoods" method="post" class="sale_add" style="margin-top:0px;">
		<div class="alert alert-danger sale_alert" role="alert" id="fail" style="display:none;">添加失败</div>
		<div class="col-xs-offset-1 col-xs-3">商品编号:</div>
		<div class="col-xs-8">
			<select data-toggle="select" name="gid" id="gid"
				class="form-control select select-default mrs mbm">
				<s:iterator id="stock" value="#session['stocklist']">
					<option value="<s:property value="#stock['gid']"/>"><s:property
							value="#stock['gid']" /></option>
				</s:iterator>
			</select>
		</div>
		<br /> <br />
		<div class="col-xs-offset-1 col-xs-3">商品名称:</div>
		<div class="col-xs-8" id="gname">
			<s:property value="#session['stockname']" />
		</div>
		<br /> <br />
		<div class="col-xs-offset-1 col-xs-3">商品库存:</div>
		<div class="col-xs-8" id="stock">
			<s:property value="#session['stocknumber']" />
		</div>
		<br /> <br />
		<div class="col-xs-offset-1 col-xs-3">销售数量:</div>
		<div class="col-xs-6">
			<input type="text" value="1" id="sale_number" class="form-control" />
		</div>
	
		<br /> <br />
		<div class="col-xs-offset-7 col-xs-3">
			<input type="button" value="添加商品" id="addSaleItem"
				class="btn btn-primary btn-block"/>
		</div>
		
		<br/><br/>
		<div class="col-xs-offset-1 col-xs-3">总价：</div>
		<div class="col-xs-3" id="totalamount"><s:property value="#session.amount"/></div>
		
		<br/>
		<br/>
		<div class="col-xs-offset-7 col-xs-3">
			<input type="button" value="结账" id="settle" data-toggle="modal" data-target="#myModal"
				class="btn btn-primary btn-block" />
		</div>
		
		
	</form>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">销售信息</h4>
        <p class="modal-title">销售分店编号：<s:property value="#session.employee.bid"/></p>
      </div>
      <div class="modal-body">
        <form method="post" action="#">
        	<p class="col-md-3">需付款：</p>
        	<p id="amount" class="col-md-9"><s:property value="#session.amount"/></p>
			<br/>
			<br/>
			<p class="col-md-3">会员编号：</p>
			<div class="col-md-5">
				<input type="text" id="memberid" name="memberid" value="" class="form-control login-field"/>
			</div>
			<br/>
			<br/>
			<p class="col-md-3">会员姓名：</p>
			<p id="membername" class="col-md-9"> &nbsp;&nbsp;</p>
			<br/><br/>
			<p class="col-md-3">会员折扣：</p>
			<p id="discount" class="col-md-9"> &nbsp;&nbsp;</p>
			<br/><br/>
			<p class="col-md-3">扣款金额：</p>
			<p id="discount_pay_amount" class="col-md-9"> &nbsp;&nbsp;</p>
			<br/>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">我了解了</button>
        <%
			if(session.getAttribute("employee") != null){
		%>
			<s:if test="#session.employee.authority == 3">
				<button type="button" class="btn btn-primary" name="card_pay" id="card_pay">结账</button>
			</s:if>
		<%} %>
      </div>
    </div>
  </div>
</div>

</body>
</html>
<script src="../js/jquery.js"></script>
<script src="../flatui/dist/js/flat-ui.min.js"></script>
<script src="../flatui/assets/js/application.js"></script>
<script src="../bootstrap-3.3.5/js/tooltip.js"></script>
<script src="../bootstrap-3.3.5/js/popover.js"></script>
<script src="../js/sale.js"></script>