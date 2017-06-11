<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<%@ include file="/public/head.jspf" %>
	<style type="text/css">
		form div{
			margin: 5px
		}
	</style>
	<script type="text/javascript">
		$(function(){
			//ifram中的dg对象
			var dg = parent.$("iframe[title='类别管理']").get(0).contentWindow.$("#dg");
			//对管理员的下拉列表框进行远程加载
			$('#cc').combobox({    
			    url:'account_query.action',    
			    valueField:'id',    
			    textField:'login',
			    panelHeight: 'auto',
			    panelWidth: 120,
			    width: 120,
			    editable: false
			});
			//完成数据的回显，及加载更新的对象的数据
			var rows = dg.datagrid("getSelections");
			$('#ff').form('load',{
				id: rows[0].id,
				type: rows[0].type,
				hot: rows[0].hot,
				'account.id': rows[0].account.id
			});
		
			$("input[name=type]").validatebox({
				required: true,
				missingMessage:'请输入类别名称'
			});
			//窗体第一次弹出时不开启默认验证
			$("#ff").form("disableValidation");
			//注册button的点击事件
			$("#btn").click(function(){
				//开启验证
				$("#ff").form("enableValidation");
				//如果验证成功则提交数据。validate做表单字段验证，当所有字段都有效的时候返回true。 
				if($("#ff").form("validate")){
					//调用submit方法提交数据
					$('#ff').form('submit', {
						url: 'category_update.action',
						success: function(){
							//如果提交成功则关闭窗体
							parent.$("#win").window("close");
							//刷新页面 
							dg.datagrid("reload");
						}
					});
				}
			});
		});
	</script>
</head>

<body>
	<form id="ff" method="post">   
	    <div>   
	        <label for="type">商品类别:</label>   
	        <input type="text" name="type"/>   
	    </div>   
	    <div>   
	        <label for="hot">热点:</label>   
	       	<input type="radio" name="hot" value="true"/>热点 
	       	<input type="radio" name="hot" value="false" checked="checked"/>非热点
	    </div>
	    <div>   
	        <label for="account">所属管理员:</label> 
	        
	        <!-- 基于html代码的方式
	        <select id="cc" class="easyui-combobox" name="dept" style="width:200px;">   
			    <option value="aa">aitem1</option>   
			    <option>bitem2</option>   
			    <option>bitem3</option>   
			    <option>ditem4</option>   
			    <option>eitem5</option>   
			</select>   
	         -->  
	         <!-- 远程加载管理员数据 -->
	         <input id="cc" name="account.id"/>
	    </div>    
	    <div>
	    	<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">更新</a>
	    	<input type="hidden" name="id"/>
	    </div>   
	</form> 
</body>
</html>
