<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户添加页</title>
</head>
<body>
<div class="container-fluid">
	<ol class="breadcrumb">
		<span>当前位置：</span>
		<li><a href="/index">系统管理</a></li>
		<li><a href="####">销售记录管理</a></li>
		<li><a href="####">添加销售记录</a></li>
	</ol>
	<!-- user-form start  -->
	<form class="add-form" id="sale-add-form" method="post">

        	<div class="panel panel-default">
	            <div class="panel-heading">新增销售记录</div>
	            <div class="panel-body table_add">
		            <table class="table half-table">
		                <tbody>
						<tr>
							<th>商品名称</th>
							<td>
								<div class="form-group ">
									<select class="form-control"  name="goodsId" id="goodsId">
										<option value="1" selected="selected">方便面</option>
										<option value="2">苹果</option>
									</select>
								</div>
							</td>
							<th>支付方式</th>
							<td>
								<div class="form-group ">
									<select class="form-control"  name="payMethod" id="payMethod">
										<option value="1" selected="selected">现金</option>
										<option value="2">银行卡</option>
									</select>
								</div>
							</td>

						</tr>
		                <tr>
		                	<th><span class="required">*</span>数量</th>
		                    <td>
		                        <div class="form-group ">
		                            <input type="text" class="form-control"  placeholder="输入商品数量" name="saleNumber" value="">
		                        </div>
		                    </td>
		                    <th><span class="required">*</span>售价</th>
		                    <td>
		                        <div class="form-group ">
		                            <input type="text" class="form-control"  placeholder="商品单价"  name="salePrice" value="">
		                        </div>
		                    </td>
		                </tr>
		                <tr>
		                	<th><span class="required">*</span>应收金额</th>
		                    <td>
		                        <div class="form-group ">
		                            <input type="text" class="form-control"  placeholder="应收金额" name="receivableAmount" value="">
		                        </div>
		                    </td>
		                    <th><span class="required">*</span>实收金额</th>
		                    <td>
		                        <div class="form-group ">
		                            <input type="text" class="form-control"  placeholder="收到金额"  name="paidAmount" value="">
		                        </div>
		                    </td>
		                </tr>

						<tr>
							<th><span class="required">*</span>找零金额</th>
							<td>
								<div class="form-group ">
									<input type="text" class="form-control"  placeholder="找零金额" name="changeAmount" value="">
								</div>
							</td>
							<th></th>
							<td>
							</td>
						</tr>

		                </tbody>
		            </table>
			        <div class="col-md-12 text-center btn-margin">
	                    <button class="btn btn-info" type="button"  id="addBtn">
					        <i class="icon-ok bigger-110"></i>           
					                    提交
	                    </button>
	                    <button class="btn" id="cancelBtn" type="button" name="cancelButton">
	                    	<i class="icon-undo bigger-110"></i>  
	                    	取消
	                    </button>
	                </div>
	           	</div>
            </div>

	</form>
	<!-- user-form end -->
</div>
<script type="text/javascript">
	//添加用户
	$("#addBtn").click(function (){
		var userName=$("input[name=changeAmount]").val();
		var loginName=$("input[name=paidAmount]").val();
		var password=$("input[name=saleNumber]").val();
		var phone=$("input[name=salePrice]").val();
		if(userName==null || userName==''){
			alert("姓名不能为空！");
			$("input[name=userName]").focus();
			return false;
		}
		if(loginName==null || loginName==''){
			alert("登录名不能为空！");
			//timedTaskFun(2000,'登录名不能为空！','','err');
			$("input[name=loginName]").focus();
			return false;
		}
		if(password==null || password==''){
			alert("密码不能为空！");
			$("input[name=password]").focus();
			return false;
		}
		if(phone==null || phone==''){
			alert("手机号不能为空！");
			$("input[name=phone]").focus();
			return false;
		}else{
			$.ajax({
	 			type : "post",
	 			url : _path+"/invoicing/sale/record/add",
	 			 data:$('#sale-add-form').serialize(),// 你的formid
	              async:false,
	 			 	success : function(data) {
	 				if(data.code==1){
	 					alert("销售记录保存成功！");
	 					var url=_path+"/invoicing/sale/record/page/list";
	 					goBackPage(url);
	 				}else{
	 					alert("销售记录保存成功保存失败！");
	 				}
	 			}
	         });
		}
	     
	});
	
	//取消
	$("#cancelBtn").click(function(){
		 var url=_path+"/invoicing/sale/record/page/list";
		 //调用跳转方法
		 goBackPage(url);
	});
</script>
</body>
</html>