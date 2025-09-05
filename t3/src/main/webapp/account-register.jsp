<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Account Registration</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f8f9fa; }
        .container { background-color: white; padding: 30px; border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1); max-width: 500px; margin: 0 auto; }
        .form-group { margin-bottom: 20px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; color: #333; }
        input, select { width: 100%; padding: 12px; border: 2px solid #ddd; border-radius: 5px;
            font-size: 16px; box-sizing: border-box; }
        input:focus, select:focus { outline: none; border-color: #007bff; }
        .radio-group { display: flex; gap: 20px; margin-top: 5px; }
        .radio-group input { width: auto; margin-right: 5px; }
        .btn { padding: 12px 30px; border: none; border-radius: 5px; font-size: 16px;
            cursor: pointer; margin-right: 10px; }
        .btn-primary { background-color: #007bff; color: white; }
        .btn-secondary { background-color: #6c757d; color: white; }
        .btn:hover { opacity: 0.9; }
        .error { color: #dc3545; background-color: #f8d7da; padding: 10px;
            border-radius: 5px; margin-bottom: 20px; }
        .success { color: #155724; background-color: #d4edda; padding: 10px;
            border-radius: 5px; margin-bottom: 20px; }
        .nav-link { display: inline-block; margin-top: 15px; color: #007bff; text-decoration: none; }
        .nav-link:hover { text-decoration: underline; }
    </style>
</head>
<body>
<div class="container">
    <h2 style="text-align: center; margin-bottom: 30px; color: #333;">Account Registration</h2>

    <!-- Display error message -->
    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>

    <!-- Display success message -->
    <c:if test="${not empty success}">
        <div class="success">${success}</div>
    </c:if>

    <form action="account-controller" method="post">
        <input type="hidden" name="action" value="register">

        <div class="form-group">
            <label for="username">Username *</label>
            <input type="text" id="username" name="username" required
                   value="${param.username}" placeholder="Enter username">
        </div>

        <div class="form-group">
            <label for="password">Password *</label>
            <input type="password" id="password" name="password" required
                   placeholder="Enter password">
        </div>

        <div class="form-group">
            <label for="confirmPassword">Confirm Password *</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required
                   placeholder="Confirm password">
        </div>

        <div class="form-group">
            <label for="firstName">First Name *</label>
            <input type="text" id="firstName" name="firstName" required
                   value="${param.firstName}" placeholder="Enter first name">
        </div>

        <div class="form-group">
            <label for="lastName">Last Name *</label>
            <input type="text" id="lastName" name="lastName" required
                   value="${param.lastName}" placeholder="Enter last name">
        </div>

        <div class="form-group">
            <label for="email">Email *</label>
            <input type="email" id="email" name="email" required
                   value="${param.email}" placeholder="Enter email address">
        </div>

        <div class="form-group">
            <label for="phone">Phone Number</label>
            <input type="tel" id="phone" name="phone"
                   value="${param.phone}" placeholder="Enter phone number">
        </div>

        <div class="form-group">
            <label>Gender</label>
            <div class="radio-group">
                <label><input type="radio" name="gender" value="Male"
                ${param.gender == 'Male' ? 'checked' : ''}> Male</label>
                <label><input type="radio" name="gender" value="Female"
                ${param.gender == 'Female' ? 'checked' : ''}> Female</label>
                <label><input type="radio" name="gender" value="Other"
                ${param.gender == 'Other' ? 'checked' : ''}> Other</label>
            </div>
        </div>

        <div class="form-group">
            <label for="country">Country</label>
            <select id="country" name="country">
                <option value="">Select Country</option>
                <option value="Vietnam" ${param.country == 'Vietnam' ? 'selected' : ''}>Vietnam</option>
                <option value="USA" ${param.country == 'USA' ? 'selected' : ''}>USA</option>
                <option value="Canada" ${param.country == 'Canada' ? 'selected' : ''}>Canada</option>
                <option value="UK" ${param.country == 'UK' ? 'selected' : ''}>UK</option>
                <option value="Australia" ${param.country == 'Australia' ? 'selected' : ''}>Australia</option>
                <option value="Japan" ${param.country == 'Japan' ? 'selected' : ''}>Japan</option>
                <option value="South Korea" ${param.country == 'South Korea' ? 'selected' : ''}>South Korea</option>
            </select>
        </div>

        <div class="form-group" style="text-align: center; margin-top: 30px;">
            <button type="submit" class="btn btn-primary">Register Account</button>
            <button type="reset" class="btn btn-secondary">Reset Form</button>
        </div>
    </form>

    <div style="text-align: center;">
        <a href="account-controller?action=list" class="nav-link">View All Accounts</a>
    </div>
</div>
</body>
</html>