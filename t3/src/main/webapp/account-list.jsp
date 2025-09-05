<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Account Management</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f8f9fa; }
        .container { background-color: white; padding: 30px; border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1); }
        .header { display: flex; justify-content: between; align-items: center; margin-bottom: 30px; }
        .btn { padding: 10px 20px; border: none; border-radius: 5px; text-decoration: none;
            display: inline-block; font-size: 14px; cursor: pointer; }
        .btn-primary { background-color: #007bff; color: white; }
        .btn-success { background-color: #28a745; color: white; }
        .btn:hover { opacity: 0.9; }
        .stats { display: flex; gap: 20px; margin-bottom: 20px; }
        .stat-card { background-color: #e9ecef; padding: 15px; border-radius: 5px; text-align: center; }
        .stat-number { font-size: 24px; font-weight: bold; color: #007bff; }
        .stat-label { font-size: 14px; color: #666; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #f8f9fa; font-weight: bold; color: #333; }
        tr:hover { background-color: #f5f5f5; }
        .no-data { text-align: center; color: #666; font-style: italic; padding: 40px; }
        .success { color: #155724; background-color: #d4edda; padding: 10px;
            border-radius: 5px; margin-bottom: 20px; }
        .gender-badge { padding: 3px 8px; border-radius: 12px; font-size: 12px; }
        .gender-male { background-color: #cce5ff; color: #0066cc; }
        .gender-female { background-color: #ffe6f2; color: #cc0066; }
        .gender-other { background-color: #f0f0f0; color: #666; }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <div>
            <h2 style="margin: 0; color: #333;">Account Management System</h2>
            <p style="margin: 5px 0 0 0; color: #666;">Manage user accounts</p>
        </div>
        <a href="account-controller?action=register" class="btn btn-primary">
            + Register New Account
        </a>
    </div>

    <!-- Display success message -->
    <c:if test="${not empty success}">
        <div class="success">${success}</div>
    </c:if>

    <!-- Statistics -->
    <div class="stats">
        <div class="stat-card">
            <div class="stat-number">${totalAccounts}</div>
            <div class="stat-label">Total Accounts</div>
        </div>
        <div class="stat-card">
            <div class="stat-number">
                <c:set var="maleCount" value="0"/>
                <c:forEach var="account" items="${accounts}">
                    <c:if test="${account.gender == 'Male'}">
                        <c:set var="maleCount" value="${maleCount + 1}"/>
                    </c:if>
                </c:forEach>
                ${maleCount}
            </div>
            <div class="stat-label">Male Users</div>
        </div>
        <div class="stat-card">
            <div class="stat-number">
                <c:set var="femaleCount" value="0"/>
                <c:forEach var="account" items="${accounts}">
                    <c:if test="${account.gender == 'Female'}">
                        <c:set var="femaleCount" value="${femaleCount + 1}"/>
                    </c:if>
                </c:forEach>
                ${femaleCount}
            </div>
            <div class="stat-label">Female Users</div>
        </div>
    </div>

    <!-- Accounts Table -->
    <h3 style="color: #333; margin-bottom: 15px;">Registered Accounts</h3>

    <c:choose>
        <c:when test="${empty accounts}">
            <div class="no-data">
                No accounts registered yet. <a href="account-controller?action=register">Register the first account</a>
            </div>
        </c:when>
        <c:otherwise>
            <table>
                <thead>
                <tr>
                    <th>#</th>
                    <th>Username</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Gender</th>
                    <th>Country</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="account" items="${accounts}" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td><strong>${account.username}</strong></td>
                        <td>${account.fullName}</td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty account.email}">
                                    <a href="mailto:${account.email}">${account.email}</a>
                                </c:when>
                                <c:otherwise>
                                    <span style="color: #999;">Not provided</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty account.phone}">
                                    ${account.phone}
                                </c:when>
                                <c:otherwise>
                                    <span style="color: #999;">Not provided</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty account.gender}">
                                            <span class="gender-badge
                                                ${account.gender == 'Male' ? 'gender-male' :
                                                  account.gender == 'Female' ? 'gender-female' : 'gender-other'}">
                                                    ${account.gender}
                                            </span>
                                </c:when>
                                <c:otherwise>
                                    <span style="color: #999;">Not specified</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty account.country}">
                                    ${account.country}
                                </c:when>
                                <c:otherwise>
                                    <span style="color: #999;">Not specified</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:otherwise>
    </c:choose>

    <div style="margin-top: 30px; text-align: center;">
        <a href="registration-form.jsp" class="btn btn-success">Back to Student Registration</a>
    </div>
</div>
</body>
</html>