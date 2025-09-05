<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="iuh.fit.nguyentrieuminh_tuan03.Student" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Result</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f5f5f5; }
        .container { background-color: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        .info-group { margin-bottom: 15px; }
        .label { display: inline-block; width: 150px; font-weight: bold; color: #333; }
        .value { color: #666; }
        .array-value { margin-left: 155px; }
        .success { color: #28a745; font-size: 18px; font-weight: bold; margin-bottom: 20px; }
        .back-btn { background-color: #6c757d; color: white; padding: 10px 20px;
            border: none; border-radius: 4px; cursor: pointer; text-decoration: none; }
        .back-btn:hover { background-color: #545b62; }
    </style>
</head>
<body>
<div class="container">
    <div class="success">✓ Registration Successful!</div>

    <!-- Use JSP useBean action -->
    <jsp:useBean id="student" class="iuh.fit.nguyentrieuminh_tuan03.Student" scope="request" />

    <h2>Student Information</h2>

    <div class="info-group">
        <span class="label">First Name:</span>
        <span class="value"><jsp:getProperty name="student" property="firstName" /></span>
    </div>

    <div class="info-group">
        <span class="label">Last Name:</span>
        <span class="value"><jsp:getProperty name="student" property="lastName" /></span>
    </div>

    <div class="info-group">
        <span class="label">Day of Birth:</span>
        <span class="value"><jsp:getProperty name="student" property="dayOfBirth" /></span>
    </div>

    <div class="info-group">
        <span class="label">Email:</span>
        <span class="value"><jsp:getProperty name="student" property="email" /></span>
    </div>

    <div class="info-group">
        <span class="label">Mobile Number:</span>
        <span class="value"><jsp:getProperty name="student" property="mobileNumber" /></span>
    </div>

    <div class="info-group">
        <span class="label">Gender:</span>
        <span class="value"><jsp:getProperty name="student" property="gender" /></span>
    </div>

    <div class="info-group">
        <span class="label">Address:</span>
        <span class="value"><jsp:getProperty name="student" property="address" /></span>
    </div>

    <div class="info-group">
        <span class="label">City:</span>
        <span class="value"><jsp:getProperty name="student" property="city" /></span>
    </div>

    <div class="info-group">
        <span class="label">Pin Code:</span>
        <span class="value"><jsp:getProperty name="student" property="pinCode" /></span>
    </div>

    <div class="info-group">
        <span class="label">State:</span>
        <span class="value"><jsp:getProperty name="student" property="state" /></span>
    </div>

    <div class="info-group">
        <span class="label">Country:</span>
        <span class="value"><jsp:getProperty name="student" property="country" /></span>
    </div>

    <div class="info-group">
        <span class="label">Hobbies:</span>
        <div class="array-value">
            <c:if test="${not empty student.hobbies}">
                <c:forEach var="hobby" items="${student.hobbies}" varStatus="status">
                    ${hobby}<c:if test="${!status.last}">, </c:if>
                </c:forEach>
            </c:if>
            <c:if test="${empty student.hobbies}">
                None selected
            </c:if>
        </div>
    </div>

    <div class="info-group">
        <span class="label">Qualifications:</span>
        <div class="array-value">
            <c:if test="${not empty student.qualifications}">
                <c:forEach var="qualification" items="${student.qualifications}" varStatus="status">
                    ${qualification}<c:if test="${!status.last}">, </c:if>
                </c:forEach>
            </c:if>
            <c:if test="${empty student.qualifications}">
                None selected
            </c:if>
        </div>
    </div>

    <div class="info-group">
        <span class="label">Courses:</span>
        <div class="array-value">
            <c:if test="${not empty student.courses}">
                <c:forEach var="course" items="${student.courses}" varStatus="status">
                    ${course}<c:if test="${!status.last}">, </c:if>
                </c:forEach>
            </c:if>
            <c:if test="${empty student.courses}">
                None selected
            </c:if>
        </div>
    </div>

    <div style="margin-top: 30px;">
        <a href="registration-form.jsp" class="back-btn">Register Another Student</a>
    </div>
</div>
</body>
</html>