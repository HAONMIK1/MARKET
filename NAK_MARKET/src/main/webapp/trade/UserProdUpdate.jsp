<%@page import="market.produser.ProdUserBean"%>
<%@page import="market.produser.ProdUserDao"%>
<%@page import="market.prod.ProdBean"%>
<%@page import="market.prod.ProdDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.fqUDQ {
	background-color: black;;
	border: 1px solid rgb(223, 0, 0);
	color: rgb(255, 255, 255);
}

button {
	width: 100px;
	height: 50px;
}
</style>
<%@ include file="tradeTop.jsp"%>
		<%
		String tnum = request.getParameter("tnum");
		ProdUserDao pudao = ProdUserDao.getInstance();
		ProdUserBean pub = pudao.selectNumProd(tnum, id);
		%>
<tr>
	<td width="1000" height="500">
		<table border="0">
			<tr>
				<td rowspan="4">
				<img alt="" src="../img/<%=pub.getTimg()%> " width="400">
				<input type="file" accept="image/jpg, image/jpeg, image/png" name="timg" multiple>
				<td>
				<td width="300" align="center">
					<table border="0">
						<tr>
							<td>
								<%
								String[] cate1 = { "여성의류", "남성의류", "신발", "가방/지갑", "시계", "쥬얼리", "디지털", "가전제품", "가구/인테리어", "생활/주방용품", };
								%> <select multiple name="tcate">
									<%
									for (String i : cate1) {
									%>
									<option value="<%=i%>" <%if(i.equals(pub.getTcate())){ %> selected <%} %>> <%=i %></option>
									<%
									}
									%>
							</select>  >
							</td>
						</tr>
						<tr>
							<td> <input type="text" name="tname" placeholder=" <%=pub.getTname()%> ">  </td>
						</tr>
						<tr>
							<td>
							<input type="text" placeholder="<%=pub.getTprice()%>" name="tprice"> 원 
								</td>
						</tr>
						<tr>
							<td><textarea rows="10" name="tinfor"><%=pub.getTinfor()%></textarea></td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td colspan="2" align="center">
					<button class="fqUDQ"
						onclick="location.href='UserProdUpdateProc.jsp?id=<%=id%>&tnum=<%=tnum%>'">
						수 정</button>

					<button class="fqUDQ"
						onclick="location.href='tradeuser.jsp?id=<%=id%>'">취소 </button>
				</td>
			</tr>
		</table>
	</td>
</tr>
<jsp:include page="../home/bottom.jsp" />