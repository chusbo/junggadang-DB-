<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="jung.Dessert" %>
<%@ page import="jung.DessertRepository" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<% 
	request.setCharacterEncoding("utf-8");
	
	String number=request.getParameter("number");
	String name=request.getParameter("name");
	String Price=request.getParameter("price");
	String category=request.getParameter("category");
	String Stock=request.getParameter("stock");
	String allergy=request.getParameter("allergy");
	String origin=request.getParameter("origin");
	String description=request.getParameter("description");
	String filename=request.getParameter("filename");
	
	Integer price;
	Integer stock;

    if (Price == null || Price.isEmpty()) {
        price = 0;
    } else {
        price = Integer.valueOf(Price);
    }
    
    if (Stock == null || Stock.isEmpty()) {
        stock = 0;
    } else {
        stock = Integer.valueOf(Stock);
    }
    
    PreparedStatement pstmt=null;
    
    String sql="insert into dessert values(?,?,?,?,?,?,?,?,?)";
    
    pstmt=conn.prepareStatement(sql);
    pstmt.setString(1, number);
    pstmt.setString(2, name);
    pstmt.setInt(3, price);
    pstmt.setString(4, category);
    pstmt.setInt(5, stock);
    pstmt.setString(6, allergy);
    pstmt.setString(7, origin);
    pstmt.setString(8, description);
    pstmt.setString(9, filename);
	pstmt.executeUpdate();
	
	if (pstmt!=null)
		pstmt.close();
	if (conn!=null)
		conn.close();
	
	response.sendRedirect("sell.jsp");
	%>
