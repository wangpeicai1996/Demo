<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="${pageContext.request.contextPath}/css/Style1.css" rel="stylesheet" type="text/css" />
		<script language="javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
		<script language="javascript" src="${pageContext.request.contextPath}/js/layer/layer.js"></script>
		<script type="text/javascript">
			var contextOid;
			function showDetail(oid){
				contextOid=oid;
				//alert(oid);
				//发送ajax
				$.post("${pageContext.request.contextPath}/adminOrder",{"method":"showDetail","oid":oid},function(order){
					var str="<table border='1' width='99%'>";
					str+="<tr><th>商品图片</th><th>商品名称</th><th>商品价格</th><th>商品购买数量</th><th>价格总计</th></tr>";
					$(order.items).each(function(){
						str+='<tr>';
						str+='<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="17%">';
						str+='<img width="40" height="45" src="${ pageContext.request.contextPath }/'+this.product.pimage+'">';
						str+='</td>';
						str+="<td>"+this.product.pname+"</td><td>"+this.product.shop_price+"</td><td>"+this.count+"</td><td>"+this.subtotal+"</td></tr>";
						str+="</tr>";
					});
					str+="<tr><td style='font-size:15px;font-weight:bold' colspan='5'>收货人信息:</td></tr>";
					str+="<tr>";
					str+="<td style='font-size:10px;font-weight:bold' align='center'>收货人姓名</td><td style='font-size:10px;font-weight:bold' align='center' colspan='2'>收货人地址</td><td style='font-size:10px;font-weight:bold' align='center' colspan='2'>联系电话</td>"
					str+="</tr>"
					str+="<tr>";
					str+="<td align='center'>"+(order.name==null||order.name==''?"空":order.name)+"</td><td align='center' colspan='2'>"+(order.address==null||order.address==''?"空":order.address)+"</td><td align='center' colspan='2'>"+(order.telephone==null||order.telephone==''?"空":order.telephone)+"</td>"
					str+="</tr>"
					str+="</table>";
					str+="<br/><br/>";
					if(order.state==1||order.state==3){
					str+="<table width='99%'>"
					str+="<tr>";
					str+="<td align='center'><input onclick='send();' type='button' value='发货'/></td>";
					str+="<td align='center'><input id='cancel' type='reset' value='取消'/></td>";
					str+="</tr>";
					str+="</table>";
					}
					layer.open({
				        type: 1,//0:信息框; 1:页面; 2:iframe层;	3:加载层;	4:tip层
				        title:"订单号"+oid,//标题
				        area: ['520px', '300px'],//大小
				        shadeClose: false, //点击弹层外区域 遮罩关闭
				        content: str//内容
				    });
				},"json");
				
			}
			
			function send(){
					$.ajax({
						url:"${pageContext.request.contextPath}/adminOrder",
						type:"post",
						data:{"method":"updateState","oid":contextOid,"state":"2"},
						dataType:"text",
						success:function(result){
							alert("发货成功");
						},
						error:function(){
							alert("请求失败");
						}
					});
				}
		</script>
	</HEAD>
	<body>
		<br>
		<form id="Form1" name="Form1" action="${pageContext.request.contextPath}/user/list.jsp" method="post">
			<table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
				<TBODY>
					<tr>
						<td class="ta_01" align="center" bgColor="#afd1f3">
							<strong>订单列表</strong>
						</TD>
					</tr>
					
					<tr>
						<td class="ta_01" align="center" bgColor="#f5fafe">
							<table cellspacing="0" cellpadding="1" rules="all"
								bordercolor="gray" border="1" id="DataGrid1"
								style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
								<tr
									style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

									<td align="center" width="10%">
										序号
									</td>
									<td align="center" width="10%">
										订单编号
									</td>
									<td align="center" width="10%">
										订单金额
									</td>
									<td align="center" width="10%">
										收货人
									</td>
									<td align="center" width="10%">
										订单状态
									</td>
									<td align="center" width="50%">
										订单详情
									</td>
								</tr>
									<c:forEach items="${page.data}" var="o" varStatus="vs">
										<tr onmouseover="this.style.backgroundColor = 'white'"
											onmouseout="this.style.backgroundColor = '#F5FAFE';">
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="18%">
												${vs.count}
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="17%">
												${o.oid}
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="17%">
												${o.total }
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="17%">
												${o.name }
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="17%">
												<c:if test="${o.state==0 }">未付款</c:if>
												<c:if test="${o.state==1 }">已付款</c:if>
												<c:if test="${o.state==2 }">待收货</c:if>
												<c:if test="${o.state==3 }">
													<a href="${pageContext.request.contextPath}/adminOrder?method=updateState&oid=${o.oid}&state=2">去发货</a>
												</c:if>
												<c:if test="${o.state==4 }">已完成</c:if>
											
											</td>
											<td align="center" style="HEIGHT: 22px">
												<input type="button" value="订单详情"  onclick="showDetail('${o.oid}')"/>
											</td>
										</tr>
									</c:forEach>	
							</table>
						</td>
					</tr>
					<tr align="center">
					<!-- 查询所有订单(不带订单状态)的分页 -->
					<c:if test="${state==null}">
						<td colspan="7">
						<a href="${ pageContext.request.contextPath }/adminOrder?method=findAllByState&pageNumber=1">首页</a>|
							<c:if test="${page.pageNumber == 1 }">
								<a href="${ pageContext.request.contextPath }/adminOrder?method=findAllByState&pageNumber=1">上一页</a>|
							</c:if>
							<c:if test="${page.pageNumber!= 1 }">
								<a href="${ pageContext.request.contextPath }/adminOrder?method=findAllByState&pageNumber=${page.pageNumber-1}">上一页</a>|
							</c:if>
							
							<c:forEach begin="1" end="${page.totalPage}" var="n">
							<c:if test="${page.pageNumber==n}">
								<a href="javascript:void(0)">${n}</a>
							</c:if>
							<c:if test="${page.pageNumber!=n}">
								<a href="${pageContext.request.contextPath}/adminOrder?method=findAllByState&pageNumber=${n}">${n}</a>
							</c:if>
							</c:forEach>
							<c:if test="${page.pageNumber==page.totalPage}">
								<a href="${ pageContext.request.contextPath }/adminOrder?method=findAllByState&pageNumber=${page.totalPage}">下一页</a>|
							</c:if>
							<c:if test="${page.pageNumber!=page.totalPage}">
								<a href="${ pageContext.request.contextPath }/adminOrder?method=findAllByState&pageNumber=${page.pageNumber+1}">下一页</a>|
							</c:if>
							<a href="${ pageContext.request.contextPath }/adminOrder?method=findAllByState&pageNumber=${page.totalPage}">尾页</a>|
						</td>
					</c:if>
					<!-- 查询带有状态订单的分页 -->
					<c:if test="${state!=null}">
							<td colspan="7">
						<a href="${ pageContext.request.contextPath }/adminOrder?method=findAllByState&state=${state}&pageNumber=1">首页</a>|
							<c:if test="${page.pageNumber == 1 }">
								<a href="${ pageContext.request.contextPath }/adminOrder?method=findAllByState&state=${state}&pageNumber=1">上一页</a>|
							</c:if>
							<c:if test="${page.pageNumber!= 1 }">
								<a href="${ pageContext.request.contextPath }/adminOrder?method=findAllByState&state=${state}&pageNumber=${page.pageNumber-1}">上一页</a>|
							</c:if>
							
							<c:forEach begin="1" end="${page.totalPage}" var="n">
							<c:if test="${page.pageNumber==n}">
								<a href="javascript:void(0)">${n}</a>
							</c:if>
							<c:if test="${page.pageNumber!=n}">
								<a href="${pageContext.request.contextPath}/adminOrder?method=findAllByState&state=${state}&pageNumber=${n}">${n}</a>
							</c:if>
							</c:forEach>
							<c:if test="${page.pageNumber==page.totalPage}">
								<a href="${ pageContext.request.contextPath }/adminOrder?method=findAllByState&state=${state}&pageNumber=${page.totalPage}">下一页</a>|
							</c:if>
							<c:if test="${page.pageNumber!=page.totalPage}">
								<a href="${ pageContext.request.contextPath }/adminOrder?method=findAllByState&state=${state}&pageNumber=${page.pageNumber+1}">下一页</a>|
							</c:if>
							<a href="${ pageContext.request.contextPath }/adminOrder?method=findAllByState&state=${state}&pageNumber=${page.totalPage}">尾页</a>|
						</td>
					</c:if>
					</tr>
				</TBODY>
			</table>
		</form>
	</body>
</HTML>

