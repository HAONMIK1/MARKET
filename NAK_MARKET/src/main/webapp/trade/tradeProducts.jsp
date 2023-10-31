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
	display:  none;
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
	<td align="center">
	
	
	<form action="inserArticle.jsp" method="post">
		<input type="hidden" name="id" value="<%=id%>"> 
		<input type="hidden" name="tnum" value="<%=pb.getTnum()%>">
		<textarea rows="5" cols="100" name="content"></textarea>
		<button type="submit">
			<b>댓글 작성</b>
		</button>
	</form>
	<%
	TradeBoardDao dao = TradeBoardDao.getInstance();
	ArrayList<TradeBoardBean> lists = dao.selectProd(pb.getId(), pb.getTnum());
	%>
	<table align="center">
		<tr>
			<td>
				<%
				if(lists.size()==0){
				 }else{
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
							<button class="right" onclick="replylist('<%=tbb.getRef()%>')">답 글</button>

						</td>
					</tr>
					<tr>
						<td>
					<div id="replylist_<%=tbb.getRef()%>">
					<table>
					<tr>
						<td>
							<form action="replyArticle.jsp" method="post">
								<input type="hidden" name="id" value="<%=id%>"> 
								<input type="hidden" name="tnum" value="<%=pb.getTnum()%>">
								<input type="hidden" name="ref" value="<%=tbb.getRef()%>">
								<textarea rows="5" cols="70" name="content"></textarea>
								<button type="submit">
									<b>등록 </b>
								</button>
							</form>
						</td>
					</tr>
					<tr>
						<td>
							<%
						 ArrayList<TradeBoardBean> lists2 = dao.selectReply(pb.getId(), tbb.getNum(),tbb.getRef());
							if(lists2.size()==0){}else{
							for (int j = 0; j < lists2.size(); j++) {
								TradeBoardBean tbb2 = lists2.get(j);
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
									</table>
								<%}	}%>
								</td>
								</tr>
							</table>
							</div>
							<%}} %>
						</td>
					</tr>
					</table>
						</td>
					</tr>
					</table>
					<%@ include file="../home/bottom.jsp"%>