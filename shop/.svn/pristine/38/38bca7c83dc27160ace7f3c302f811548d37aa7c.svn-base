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
						url: 'category_save.action',
						success: function(){
							//如果提交成功则关闭窗体
							parent.$("#win").window("close");
							//刷新页面 获取aindex-->iframe-->dg.
							//var dg = parent.$("iframe[title='类别管理']").contents().find("#dg").datagrid("getSelections");
							//上面的方法在一些浏览器不兼容，所以用下面
							parent.$("iframe[title='类别管理']").get(0).contentWindow.$("#dg").datagrid("reload");
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
	    	<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>
	    </div>   
	</form> 
</body>
</html>
