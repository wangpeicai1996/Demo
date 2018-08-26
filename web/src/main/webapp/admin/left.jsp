<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>菜单</title>
<link href="${pageContext.request.contextPath}/css/left.css" rel="stylesheet" type="text/css"/>
<!-- 导入dtree -->
<link rel="StyleSheet" href="${pageContext.request.contextPath}/css/dtree.css" type="text/css" />
</head>
<body>
<table width="100" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="12"></td>
  </tr>
</table>
<table width="100%" border="0">
  <tr>
    <td>
<div class="dtree">

	<a href="javascript: d.openAll();">展开所有</a> | <a href="javascript: d.closeAll();">关闭所有</a>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/dtree.js"></script>
	<script type="text/javascript">
	
		d = new dTree('d');
		d.add('01',-1,'商城后台管理');
		d.add('0101','01','用户管理','','','mainFrame');
		d.add('010101','0101','用户管理','${pageContext.request.contextPath}/userAdmin_findAll.action?page=1','','mainFrame');
		d.add('0102','01','分类管理','','','mainFrame');
		d.add('010201','0102','分类列表','${pageContext.request.contextPath}/adminCategory?method=findAll','','mainFrame');
		d.add('010202','0102','添加分类','${pageContext.request.contextPath}/adminCategory?method=addUI','','mainFrame');
		d.add('0104','01','商品管理');
		d.add('010401','0104','已上架商品','${pageContext.request.contextPath}/adminProduct?method=findAll&state=onsale','','mainFrame');
		d.add('010402','0104','未上架商品','${pageContext.request.contextPath}/adminProduct?method=findAll&state=offsale','','mainFrame');
		d.add('010403','0104','热门商品','${pageContext.request.contextPath}/adminProduct?method=findAll&state=hotsale','','mainFrame');
		d.add('010404','0104','添加商品','${pageContext.request.contextPath}/adminProduct?method=addUI','','mainFrame');
		d.add('0105','01','订单管理');
		d.add('010501','0105','所有订单','${pageContext.request.contextPath}/adminOrder?method=findAllByState&pageNumber=1','','mainFrame');
		d.add('010502','0105','已付款订单','${pageContext.request.contextPath}/adminOrder?method=findAllByState&state=1&pageNumber=1','','mainFrame');
		d.add('010503','0105','未付款订单','${pageContext.request.contextPath}/adminOrder?method=findAllByState&state=0&pageNumber=1','','mainFrame');
		d.add('010504','0105','已发货订单','${pageContext.request.contextPath}/adminOrder?method=findAllByState&state=2&pageNumber=1','','mainFrame');
		d.add('010505','0105','未发货订单','${pageContext.request.contextPath}/adminOrder?method=findAllByState&state=3&pageNumber=1','','mainFrame');
		d.add('010506','0105','已完成订单','${pageContext.request.contextPath}/adminOrder?method=findAllByState&state=4&pageNumber=1','','mainFrame');
		document.write(d);
		
	</script>
</div>	</td>
  </tr>
</table>
</body>
</html>
