<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<style type="text/css">
.brand_logo {
	width: 25px;
	height: 25px;
}
</style>
<div class="container-fluid">
	<ol class="breadcrumb">
		<span>当前位置：</span>
		<li><a href="/index">销售管理</a></li>
		<li><a href="####">员工绩效</a></li>
	</ol>

	<!-- 列表：查询条件组装  start -->
	<div class="panel panel-default form-search">
		<div class="panel-body">
			<div class="conditions_team">
				<input type="text" name="userName" class="form-control"placeholder="员工名称">
			</div>
		</div>
		<div class="panel-footer">
			<button type="button" id="searchBtn" class="btn btn-primary">
				<i class="icon_search"></i>
				查询
			</button>
			<button type="button" id="resetBtn" class="btn btn-success">
				<i class="icon-reply icon-only"></i>
				重置
			</button>
			<button type="button" id="addBtn" class="btn btn-primary">
			<i class="icon_add"></i>
				新增
			</button>
		</div>
	</div>
	<!-- 列表：查询条件组装  end -->
	<!-- 列表：查询分页列表 start -->
	<div class="area_table_content cloud_list">
		<div id="buttonsId" class="row list-title">
			<div class="col-md-4">
				<h4>销售记录列表</h4>
			</div>
		</div>
	</div>
</div>
	<!-- 列表：查询分页列表 end -->
	<!-- add by WHao start 引入：销售记录列表js -->
	<script type="text/javascript">
	$(document).ready(function(){
        var buttonsArr =[];
        getData();
        function getData(){
            var _options ={
                url:_path+"/invoicing/sale/record/monpage/list"
                ,checkAll:false
                //查询条件
                ,data:{'payMethod':$("[name=payMethod]").val()}
                ,cloumns:[
					 {name:'员工号',value:'moncid',type:"function", fun : function(obj){
	                	return obj.moncid;
	                    }
	                  }
                    ,{name:'员工名称',value:'paidAmount',type:"function", fun : function(obj){
	                	return obj.monname;;
	                    }
	                  }
	              	,{name:'上月绩效',value:'receivableAmount',type:"function", fun : function(obj){
		                	return obj.monmoney+".00元";;
	                    }
	                  }
	              	,{name:'手机号',value:'changeAmount',type:"function", fun : function(obj){
	                	return obj.monphone;;
	                    }
	                  }


                    ,{name:'操作',value:'id',type:"function", fun : function(obj){
                            var html="";

                            html += "  <a href='javascript:void(0)' class='btn-link' onclick='toUpdatePage("+obj.id+")'>编辑</a>"
                            html += "  <a href='javascript:void(0)' class='btn-link' onclick='delObj("+obj.id+")'>删除</a>";
                            return html;
                        }
                    }
                ]
                ,buttons:buttonsArr
            };
            // grid(param1,param2);参数1分页数据，参数2table类名如.area_table_content
            $(".area_table_content").grid(_options,".area_table_content");
        }
		//条件查询
		$("#searchBtn").click(function(){
			getData();
			
		});
		//条件重置
		$("#resetBtn").click(function (){
			$("input[name=userName]").val("");
			$("input[name=phone]").val("");
		});
		
    });
    
  //点击：删除
    function delObj(id) {
    	callmodalFun('您确认删除该记录吗？',function(){
    		$.ajax({
    			type : "post",
    			url :_path+"/invoicing/sale/record/del",
    			data : {
    				'id':id
    			},
    			beforeSend: function () {
                    //加载中
                    waitload();
                },
    			success : function(data) {
    				closewait();
    				//若执行成功的话，则隐藏进度条提示
    				if (data.code== 1) {
    					alert("销售记录删除成功！")
    					var url = _path+"/invoicing/sale/record/page/list";
    					goBackPage(url);
    				} else if (data == 0) {
    					timedTaskFun(1000,'销售记录删除失败','','err');
    				} else if(data == -2) {
    					timedTaskFun(1000,'该销售记录，已关联其他业务，故无法删除！','','err');
    				}

    			}
    		 });
    	});
    };
    
    //到新增页面
    $("#addBtn").click(function(){
    	var url=_path+"/invoicing/sale/record/add";
		$.get(url,function(data){
			$("#mian_div").html(data);
		});    
    });
    //编辑销售记录信息
    function toUpdatePage(userId){
    	 var url=_path+"/invoicing/sale/record/update?id="+userId;
		 //调用跳转方法
		 goBackPage(url);
    }

</script>