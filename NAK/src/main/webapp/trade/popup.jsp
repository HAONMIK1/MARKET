<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>주소 선택</title>
<%
	request.setCharacterEncoding("UTF-8");
	String id =request.getParameter("id");
%>
<script>
	function updateDistricts() {
		var citySelect = document.getElementById("city");
		var districtSelect = document.getElementById("district");

		// 시/도에 따라 구/군 옵션 업데이트
		if (citySelect.value === "서울특별시") {
			districtSelect.innerHTML = "<option>선 택</option><option value='강남구'>강남구</option><option value='강서구'>강서구</option>";
		} else if (citySelect.value === "고양시") {
			districtSelect.innerHTML = "<option>선 택</option><option value='일산동구'>일산동구</option><option value='일산서구'>일산서구</option><option value='덕양구'>덕양구</option>";
		} else {
			// 다른 시/도의 경우에도 마찬가지로 처리
			districtSelect.innerHTML = "";
		}

	}
	function updateNeighborhoods() {
		var districtSelect = document.getElementById("district");
		var neighborhoodSelect = document.getElementById("neighborhood");
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
	function moveClose() {
		var neighborhoodSelect = document.getElementById("neighborhood");
	    var selectedValue = neighborhoodSelect.value;

		  opener.location.href="tradeMain.jsp?id=<%=id%>&tloca="+selectedValue;
		  self.close();
		}
</script>
<label for="city">시/도:</label>
<select id="city" name="city" onchange="updateDistricts()">
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

<input type="button" value="확인" onclick="moveClose()">