<%@page import="market.board.TradeBoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="market.board.TradeBoardDao"%>
<%@page import="market.prod.ProdBean"%>
<%@page import="market.prod.ProdDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	function replylist(ref) {
		var listDiv = document.getElementById('replylist_' + ref); // 해당 ID에 대한 리스트를 가리키는 요소
		if (listDiv.style.display === 'none') {
			listDiv.style.display = 'block'; // 리스트를 보이게 함
		} else {
			listDiv.style.display = 'none'; // 리스트를 숨김
		}
	}
	document.getElementById('content').addEventListener('keydown', function(e) {
		if (e.key === 'Enter' && !e.shiftKey) {
			e.preventDefault(); // Enter 키의 기본 동작 방지
			document.getElementById('myForm').submit();
		}
	});
</script>
<style>
.nak {
	width: 1000px;
}

.right {
	float: right;
}

.fqUDQ {
	background-color: black;;
	border: 1px solid rgb(223, 0, 0);
	color: rgb(255, 255, 255);
}

button {
	width: 100px;
	height: 50px;
}

div {
	display: none;
}

#content {
	width: 80%;
	height: 50px;
}
</style>
<%@ include file="tradeTop.jsp"%>
<%
if (id.equals("")) {
	response.sendRedirect("../home/login.jsp");
%>
<script type="text/javascript">
	alert("로그인하시오");
</script>
<%
}
%>

<tr>
	<td width="1000" height="500">
		<%
		String pnum = request.getParameter("pnum");
		ProdDao pdao = ProdDao.getInstance();
		ProdBean pb = pdao.selectNumProd(pnum);
		%>
		<table border="0">
			<tr>
				<td rowspan="4"><img alt="" src="../img/<%=pb.getTimg()%> "
					width="400">
				<td>
				<td width="300" align="center">
					<table border="0">
						<tr>
							<td><%=pb.getTcate()%> ></td>
						</tr>
						<tr>
							<td><h2><%=pb.getTname()%></h2></td>
						</tr>
						<tr>
							<td><h2><%=pb.getTprice()%>
									원
								</h2></td>
						</tr>
						<tr>
							<td><%=pb.getTinfor()%></td>
						</tr>

					</table>
				</td>
			</tr>
		</table>
	</td>
</tr>
<tr>
	<td>
		<form action="inserArticle.jsp" method="post" id="myForm">
			<input type="hidden" name="id" value="<%=id%>"> <input
				type="hidden" name="tnum" value="<%=Integer.parseInt(pnum)%>">
			<input type="text" name="content" id="content">
		</form>
	</td>
</tr>
<%
TradeBoardDao dao = TradeBoardDao.getInstance();
ArrayList<TradeBoardBean> lists = dao.selectProd(Integer.parseInt(pnum));
%>
<tr>
	<td>

		<table align="center">
			<tr>
				<td>
					<%
					if (lists.size() == 0) {
					} else {
						for (int i = 0; i < lists.size(); i++) {
							TradeBoardBean tbb = lists.get(i);
					%>
					<table class="nak">
						<tr>
							<td><%=tbb.getId()%></td>
						</tr>
						<tr>
							<td><%=tbb.getContent()%></td>
						</tr>
						<tr>
							<td><%=tbb.getRegdate()%></td>
						</tr>
						<tr>
							<td>
								<button class="right" onclick="replylist('<%=tbb.getRef()%>')">답
									글</button>
<hr>
							</td>
						</tr>
						<tr>
							<td>
								<div id="replylist_<%=tbb.getRef()%>">
									<table>


										<%
										ArrayList<TradeBoardBean> lists2 = dao.selectReply(Integer.parseInt(pnum), tbb.getRef());
										System.out.print(pb.getId() + " " + Integer.parseInt(pnum) + " " + tbb.getRef() + " " + lists2.size());
										if (lists2.size() == 0) {
										%>
										<tr>
											<td>
												<form action="replyArticle.jsp" method="post">
													<input type="hidden" name="id" value="<%=id%>"> <input
														type="hidden" name="tnum"
														value="<%=Integer.parseInt(pnum)%>"> <input
														type="hidden" name="ref" value="<%=tbb.getRef()%>">
													<textarea rows="5" cols="70" name="content"></textarea>
													<button type="submit">
														<b>등록 </b>
													</button>
												</form>
											</td>
										</tr>
										<%
										} else {
										%>
										<tr>
											<td>
												<table class="nak">
													<%
													for (int j = 0; j < lists2.size(); j++) {
														TradeBoardBean tbb2 = lists2.get(j);
													%>

													<tr>
														<td><%=tbb2.getId()%></td>
													</tr>
													<tr>
														<td><%=tbb2.getContent()%></td>
													</tr>
													<tr>
														<td><%=tbb2.getRegdate()%></td>
													</tr>
													<%
													}
													%>
													<tr>
											<td>
												<form action="replyArticle.jsp" method="post">
													<input type="hidden" name="id" value="<%=id%>"> <input
														type="hidden" name="tnum"
														value="<%=Integer.parseInt(pnum)%>"> <input
														type="hidden" name="ref" value="<%=tbb.getRef()%>">
													<textarea rows="5" cols="70" name="content"></textarea>
													<button type="submit">
														<b>등록 </b>
													</button>
												</form>
											</td>
										</tr>
												</table> <%
 }
 %>
											</td>
										</tr>
									</table>
									<hr>
								</div> <br> <%
 }
 }
 %>
							</td>
						</tr>
					</table>
				</td>
			</tr>

			<%@ include file="../home/bottom.jsp"%>