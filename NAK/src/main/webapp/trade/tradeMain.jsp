<%@page import="java.util.ArrayList"%>
<%@page import="market.prod.ProdBean"%>
<%@page import="market.prod.ProdDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.fleamarket-cover {
	background-color: #FFF1AA;
}

.fleamarket-cover {
	height: 315px;
	padding: 0 16px 0 16px;
}

.fleamarket-cover .cover-content .cover-image span {
	box-sizing: border-box;
	overflow: hidden;
	width: initial;
	height: initial;
	background: none;
	opacity: 1;
	border: 0;
	margin: 0;
	padding: 0;
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
}

.fleamarket-article-list .article-list-title {
	font-size: 32px;
	line-height: 43.2px;
}

.text-center {
	text-align: center;
}

.location {
	text-align: left;
	line-height: 42px;
	margin-left: 50px;
	margin-top: -50px;
}
</style>
<%@include file="tradeTop.jsp"%>

<script>
function showPopup() { window.open("popup.jsp?id=<%=id%>", "위치등록", "width=400, height=300, left=100, top=50"); }
</script>

<tr>
	<td width="1000" height="500">
		<section class="fleamarket-cover">
			<div class="cover-content">
				<h1 class="cover-title">
					믿을만한<br>이웃 간 중고거래
				</h1>
				<span class="cover-description">동네 주민들과 가깝고 따뜻한 거래를<br>지금
					경험해보세요.
				</span>
			</div>
		</section>
		<section>
			<h1 class="text-center article-list-title">중고거래 인기매물</h1>
			<input type="button" value="<%=tloca %> " name="tloca" onclick="showPopup();">

		</section>
		<section>
			<%
			ProdDao pdao = ProdDao.getInstance();
			ArrayList<ProdBean> lists ;
			if(tloca.equals("위치등록")){
			lists = pdao.selectProd();
			}else{
			
			lists = pdao.selectTloca(tloca);
			}
			%>
			<table align="center">
				<tr align="center">
					<%
					if(lists.size()==0){
						%><td> 등록된 상품이 없습니다 </td><%
					}else{
					for (int i = 0; i < lists.size(); i++) {
						ProdBean pub = lists.get(i);
					%>
					<td width="400" align="center"><a
						href="tradeProducts.jsp?id=<%=id%>&pnum=<%=pub.getPnum()%>"> 
						<img src="../img/<%=pub.getTimg()%>" width="300"> <br>
							<table height="60" align="center">
								<tr>
									<td><%=pub.getTcate()%></td>
								</tr>
								<tr>
									<td><%=pub.getTlocation()%></td>
								</tr>
								<tr>
									<td><%=pub.getTname()%></td>
								</tr>
								<tr>
									<td><%=pub.getTprice()%>원</td>
								</tr>
							</table>
					</a></td>
					<%
					if ((i + 1) % 3 == 0) {
					%>
				</tr>
				<%
				}
				}}
				%>
				</tr>
			</table>
		</section>
	</td>
</tr>
<jsp:include page="../home/bottom.jsp" />