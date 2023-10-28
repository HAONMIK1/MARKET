<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
body {
	display: block;
}

ol, ul {
	list-style: none;
}
</style>
<%@include file="tradeTop.jsp" %>
<tr>
	<td width="1000" height="500">
		<body>
			<section>
				<ul>
					<li>
					<form action="sellProc.jsp?id=<%=id %>" method="post">
						<h3>
							기본정보 <span>*필수항목</span>
						</h3>
						<div>상품이미지</div>
						<div>
							<input type="file" accept="image/jpg, image/jpeg, image/png" name="timg" multiple>
						</div>
					</li>
					<li>
						<div>
							상품명<span>*</span>
						</div>
						<div>
							<div>
								<div>
									<input type="text" name="tname" placeholder="상품명을 입력해 주세요.">
								</div>
							</div>
						</div>
					</li>
					<li><div>
							카테고리<span>*</span>
						</div>
						<div>
							<div>
								<div>
									<%
									String[] cate1 = {"여성의류", "남성의류", "신발", "가방/지갑", "시계", "쥬얼리", "디지털", "가전제품", "가구/인테리어", "생활/주방용품",};
									%>
									<select multiple name="tcate">
										<%
										for (String i : cate1) {
										%>
										<option value="<%=i%>"><%=i%></option>
										<%
										}
										%>
									</select>
								</div>
							</div>
						</div></li>
					<li><div>
							거래지역<span>*</span>
						</div>
						<div>
							<div>
								<title>주소 선택</title>
								<script>
									function updateDistricts() {
										var citySelect = document
												.getElementById("city");
										var districtSelect = document
												.getElementById("district");

										// 시/도에 따라 구/군 옵션 업데이트
										if (citySelect.value === "서울특별시") {
											districtSelect.innerHTML = "<option>선 택</option><option value='강남구'>강남구</option><option value='강서구'>강서구</option>";
										} else if (citySelect.value === "고양시") {
											districtSelect.innerHTML = 
												"<option>선 택</option><option value='일산동구'>일산동구</option><option value='일산서구'>일산서구</option><option value='덕양구'>덕양구</option>";
										} else {
											// 다른 시/도의 경우에도 마찬가지로 처리
											districtSelect.innerHTML = "";
										}

									}
									function updateNeighborhoods() {
										var districtSelect = document.getElementById("district");
										var neighborhoodSelect = document
												.getElementById("neighborhood");
										if (districtSelect.value === "강남구") {
											neighborhoodSelect.innerHTML = "<option>선 택</option><option value='청담동'>청담동</option><option value='역삼동'>역삼동</option>";
										} else if (districtSelect.value === "강서구") {
											neighborhoodSelect.innerHTML = "<option>선 택</option><option value='등촌동'>등촌동</option><option value='화곡동'>화곡동</option>";
										} else if (districtSelect.value === "일산동구") {
											neighborhoodSelect.innerHTML = "<option>선 택</option><option value='백석동'>백석동</option><option value='마두동'>마두동</option>";
										} else if (districtSelect.value === "일산서구") {
											neighborhoodSelect.innerHTML = "<option>선 택</option><option value='대화동'>대화동</option><option value='일산동'>일산동</option>";
										} else if (districtSelect.value === "덕양구") {
											neighborhoodSelect.innerHTML = "<option>선 택</option><option value='행신동'>행신동</option><option value='화정동'>화정동</option>";
										} else {
											neighborhoodSelect.innerHTML = "";
										}
									}
								</script>
								<label for="city">시/도:</label> 
								<select id="city" name="city"onchange="updateDistricts()">
								<option>선 택</option>
									<option value="서울특별시">서울특별시</option>
									<option value="고양시">고양시</option>
								</select>
								
								 <label for="district">구/군:</label>
								 <select id="district" name="district" onchange="updateNeighborhoods()">
								</select>
								
								<label for="neighborhood">동/읍/면:</label> 
								<select id="neighborhood" name="tlocation" onchange="ValueTLoction()">
								</select>
							</div>
						</div></li>
					<li class="ProductNewstyle__Group-sc-7fge4a-5 iZffvT"style="padding-bottom: 0px; border-bottom: none;">
					<div>가격<span>*</span></div>
						<div>
							<div>
								<input type="text" placeholder="가격을 입력해 주세요." name="tprice"><span>원</span>
							</div>
						</div></li>
					<li>
						<div>설명<span>*</span></div>
						<div>
							<textarea rows="10" name="tinfor"></textarea>
						</div>
					<input type="submit" value="상품 등록하기">
					</form>
					</li>
					</li>
				</ul>
			</section>
		</body>
	</td>
</tr>
<jsp:include page="../home/bottom.jsp" />