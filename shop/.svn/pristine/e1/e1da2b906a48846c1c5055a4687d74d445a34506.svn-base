<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<%@ include file="/public/head.jspf" %>
	<style type="text/css">
		body{
			margin: 1px
		}
		.searchbox {
			/*搜索框上移*/
			margin: -3;
		}
	</style>
	<script type="text/javascript">
		$(function(){
			$('#dg').datagrid({
				//请求数据的URL地址 ，远程站点  
			    url:'category_queryJoinAccount.action',
			    //在从远程站点加载数据的时候显示提示消息。
			    loadMsg: '请等待....',
			     //在请求远程数据的时候发送额外的参数。 
			    queryParams: {
					type: ''
				},
				//指明哪一个字段是标识字段。在翻页时有用，翻页后，上一页选中的记录不会丢失。（需要用到的时候配）
				idField: 'id',
			    //显示斑马线
			    striped: true,
			    //数据显示在同行，默认是 
			    nowrap: true,
			    //自适应列：真正的自动展开/收缩列的大小，以适应网格的宽度，防止水平滚动。不会有水平滚动条
			    fitColumns: true,
			    //如果为true，则只允许选择一行，全选功能失效
			    singleSelect: false,
			    //设置分页栏，如果为true，则在DataGrid控件底部显示分页工具栏。默认每页显示10条数据
			    pagination: true,
			    //设置每页显示的条数
			    pageSize: 5,
			    //设置页面大小选择列表。即设置选择每页显示多少条，应该是pageSize的倍数
			    pageList: [5,10,15,20],
			    //工具栏（上面是button），一个数组，每个工具属性都和linkbutton一样。
			    toolbar: [{
					iconCls: 'icon-add',
					text: '添加类别',
					handler: function(){
						//弹出添加页面
						parent.$("#win").window({
							title:'添加类别',
							width:290,
							height:150,
							content: '<iframe src="send_category_save.action" frameborder="0" width="100%" height="100%" />'
						});
					}
				},'-',{
					iconCls: 'icon-edit',
					text: '更新类别',
					handler: function(){
						//1.判断是否选中行
						//获取选中的行，返回数组
						var rows = $("#dg").datagrid("getSelections");
						if(rows.length!=1) {
							//弹出提示信息
							$.messager.show({
								title:'错误提示',
								msg:'只能更新一条记录',
								timeout:2000,//框存在的时间
								showType:'slide'
							});
						}else{
							//弹出更新页面
							parent.$("#win").window({
								title:'更新类别',
								width:300,
								height:200,
								content: '<iframe src="send_category_update.action" frameborder="0" width="100%" height="100%" />'
							});
						}
					}
				},'-',{
					iconCls: 'icon-remove',
					text: '删除类别',
					handler: function(){
						//1.判断是否选中行
						//获取选中的行，返回数组
						var rows = $("#dg").datagrid("getSelections");
						if(rows.length==0) {
							//弹出提示信息
							$.messager.show({
								title:'错误提示',
								msg:'至少选中一条记录',
								timeout:2000,//框存在的时间
								showType:'slide'
							});
						} else {
							//执行删除逻辑
							$.messager.confirm('删除确认框', '是否要删除选中的记录？', function(r){
								if (r){
								    //1.获取被选中的记录，从记录中获取相应的id
								     var ids = "";
								     for(var i=0; i<rows.length; i++){
								     	//2.拼接id的值然后发送给后台
								     	ids += rows[i].id + ",";
								     }
								     //除去最后一个逗号
								     ids = ids.substring(0, ids.lastIndexOf(","));
								     //3.发送ajax请求
								     $.post("category_deleteByIds.action", {ids: ids}, function(result){
								     	if(result == "true"){
								     		//取消选中的所有行,因为这个选中行的记录会一直记录下来，会影响其他的操作。
								     		$("#dg").datagrid("uncheckAll");
								     		//重新刷新当前页
								     		$("#dg").datagrid("reload");
								     	}else{
								     		//弹出提示信息
											$.messager.show({
												title:'删除异常',
												msg:'删除失败，请检查操作！',
												timeout:2000,//框存在的时间
												showType:'slide'
											});
								     	}
								     }, "text");
								}
							});
						}
					}
				},'-',{//搜索框
					text: "<input id='ss'/>"
				}],
			    //冻结列，同列属性，但是这些列将会被冻结在左侧。
			    frozenColumns:[[
			    	//这一列是checkbox，如果为true，则显示复选框。该复选框列固定宽度。field:'abc'，这里不能为空，可以随便写个
			    	{field:'abc', checkbox:true},
			    	{field:'id',title:'类别编号',width:100}
			    ]],
			    //配置的列字段，field，列字段名称，与json的key捆绑
			    columns:[[    
			        {field:'type',title:'类别名称',width:100,
			        	//用来格式化当前列的值，返回的是最终的数据.当鼠标移上去的时候，把行内的数据全部显示
			        	formatter: function(value,row,index){
							return "<span title=" + value + ">" + value + "</span>";
						}
			        },    
			        {field:'hot',title:'热点',width:100,align:'right',
			        	formatter: function(value,row,index){
							if(value) {
								return "<input type='checkbox' checked='checked' disabled='disabled'/>";
							} else {
								return "<input type='checkbox' disabled='disabled'/>";
							}
						}
			        },
			        {field:'account.login',title:'管理员',width:100,
			        	formatter: function(value,row,index){
			        		//当前row存的就是category对象
							if(row.account!=null && row.account.login!=null){
								return row.account.login;
							} else {
								return null;
							}
						}
			        } 
			    ]]    
			});
			//把普通的文本框转换为搜索文本框
			$('#ss').searchbox({ 
				//查询事件
				searcher:function(value,name){ 
					//获取当前的查询的关键字，通过dg加载相应的信息
					//加载和显示第一页的所有行。如果指定了'param'，它将取代'queryParams'属性。
					//通常可以通过传递一些参数执行一次查询，通过调用这个方法从服务器加载新数据。
					$('#dg').datagrid('load',{
						type: value
					});
				},  
				prompt:'请输入要查询的类别' 
			}); 
		});
	</script>
</head>

<body>
	<table id="dg"></table>
	
	<!-- 这个窗体（添加或更新的的窗体）弹出去之后要锁全屏，所以应该把他放到aindex.jsp，用parent.$("#win").window获得。如果放到这里，它只是锁dg这一部分
		 设置不能折叠，不能最大最小化，模式窗口（即锁屏窗口）
	<div id="win" data-options="collapsible:false,minimizable:false,maximizable:false,modal:true"></div> 
	-->
</body>
</html>
