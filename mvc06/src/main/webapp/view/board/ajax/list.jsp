<%@page import="com.google.gson.Gson"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
	pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%= new Gson().toJson(request.getAttribute("list")) %>
















