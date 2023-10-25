<%@page import="market.users.UserDAO"%>
<%@page import="market.users.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userid=request.getParameter("userid");
	
	UserDAO udao =UserDAO.getInstance();
	boolean check = udao.selectID(userid);
	String str="";
	if(check){
		str= "NO";
		out.print(str);
	}else{
		str="YES";
		out.print(str);
	}
%>