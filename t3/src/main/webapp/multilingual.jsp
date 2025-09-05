<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>

<!-- Set locale based on session language code -->
<c:set var="languageCode" value="${sessionScope.languageCode}" />
<c:if test="${empty languageCode}">
    <c:set var="languageCode" value="en" />
</c:if>

<fmt:setLocale value="${languageCode}" scope="session" />
<fmt:setBundle basename="resource" scope="session" />

<!DOCTYPE html>
<html lang="${languageCode}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><fmt:message key="title" /></title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh; color: #333; }

        .header { background: rgba(255,255,255,0.95); padding: 20px 0;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        .container { max-width: 1200px; margin: 0 auto; padding: 0 20px; }

        .nav { display: flex; justify-content: space-between; align-items: center; }
        .logo { font-size: 28px; font-weight: bold; color: #667eea; }

        .nav-menu { display: flex; list-style: none; gap: 30px; }
        .nav-menu a { text-decoration: none; color: #333; font-weight: 500;
            transition: color 0.3s; }
        .nav-menu a:hover { color: #667eea; }

        .language-selector { display: flex; align-items: center; gap: 10px; }
        .lang-btn { padding: 8px 15px; border: 2px solid #667eea;
            background: white; color: #667eea; border-radius: 25px;
            cursor: pointer; transition: all 0.3s; text-decoration: none; }
        .lang-btn:hover, .lang-btn.active { background: #667eea; color: white; }

        .main-content { padding: 60px 0; text-align: center; }
        .hero { background: rgba(255,255,255,0.9); padding: 50px;
            border-radius: 20px; margin: 40px auto; max-width: 800px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2); }

        .hero h1 { font-size: 48px; margin-bottom: 20px; color: #333; }
        .hero p { font-size: 18px; color: #666; line-height: 1.6; }

        .features { display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px; margin: 50px 0; }
        .feature-card { background: rgba(255,255,255,0.9); padding: 30px;
            border-radius: 15px; text-align: left;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1); }
        .feature-card h3 { color: #667eea; margin-bottom: 15px; font-size: 20px; }
        .feature-card p { color: #666; line-height: 1.5; }

        .sample-form { background: rgba(255,255,255,0.9); padding: 40px;
            border-radius: 15px; margin: 40px auto; max-width: 600px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1); }

        .form-group { margin-bottom: 20px; text-align: left; }
        .form-group label { display: block; margin-bottom: 8px; font-weight: bold;
            color: #333; }
        .form-group input, .form-group select, .form-group textarea {
            width: 100%; padding: 12px; border: 2px solid #ddd;
            border-radius: 8px; font-size: 16px; }
        .form-group input:focus, .form-group select:focus, .form-group textarea:focus {
            outline: none; border-color: #667eea; }

        .radio-group { display: flex; gap: 20px; margin-top: 8px; }
        .radio-group label { display: flex; align-items: center; margin-bottom: 0; }
        .radio-group input { width: auto; margin-right: 8px; }

        .btn { padding: 12px 30px; border: none; border-radius: 25px;
            font-size: 16px; cursor: pointer; transition: all 0.3s;
            margin-right: 10px; }
        .btn-primary { background: #667eea; color: white; }
        .btn-secondary { background: #6c757d; color: white; }
        .btn:hover { transform: translateY(-2px); box-shadow: 0 5px 15px rgba(0,0,0,0.2); }

        .footer { background: rgba(0,0,0,0.8); color: white; padding: 30px 0;
            margin-top: 50px; }
        .footer p { text-align: center; }

        .message { padding: 15px; margin: 20px 0; border-radius: 8px;
            text-align: center; font-weight: bold; }
        .success { background: #d4edda; color: #155724; border: 1px solid #c3e6cb; }

        .current-lang { background: rgba(255,255,255,0.2); padding: 10px 20px;
            border-radius: 10px; margin-bottom: 20px; }
    </style>
</head>
<body>
<header class="header">
    <div class="container">
        <nav class="nav">
            <div class="logo"><fmt:message key="title" /></div>
            <ul class="nav-menu">
                <li><a href="#"><fmt:message key="home" /></a></li>
                <li><a href="#"><fmt:message key="about" /></a></li>
                <li><a href="#"><fmt:message key="services" /></a></li>
                <li><a href="#"><fmt:message key="contact" /></a></li>
            </ul>
            <div class="language-selector">
                <span><fmt:message key="language" />:</span>
                <a href="language-controller?action=change&lang=en"
                   class="lang-btn ${languageCode == 'en' ? 'active' : ''}">English</a>
                <a href="language-controller?action=change&lang=vi"
                   class="lang-btn ${languageCode == 'vi' ? 'active' : ''}">Tiếng Việt</a>
            </div>
        </nav>
    </div>
</header>

<main class="main-content">
    <div class="container">
        <!-- Display message if language changed -->
        <c:if test="${not empty message}">
            <div class="message success">
                <fmt:message key="language_switch" />
            </div>
        </c:if>

        <!-- Current Language Display -->
        <div class="current-lang">
            <strong><fmt:message key="current_language" />:</strong>
            <c:choose>
                <c:when test="${languageCode == 'vi'}">Tiếng Việt</c:when>
                <c:otherwise>English</c:otherwise>
            </c:choose>
        </div>

        <!-- Hero Section -->
        <div class="hero">
            <h1><fmt:message key="welcome" /></h1>
            <p><fmt:message key="description" /></p>
        </div>

        <!-- Features Section -->
        <div class="features">
            <div class="feature-card">
                <h3><fmt:message key="services" /></h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                    Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
            </div>
            <div class="feature-card">
                <h3><fmt:message key="about" /></h3>
                <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco
                    laboris nisi ut aliquip ex ea commodo consequat.</p>
            </div>
            <div class="feature-card">
                <h3><fmt:message key="contact" /></h3>
                <p>Duis aute irure dolor in reprehenderit in voluptate velit
                    esse cillum dolore eu fugiat nulla pariatur.</p>
            </div>
        </div>

        <!-- Sample Form Section -->
        <div class="sample-form">
            <h2 style="text-align: center; margin-bottom: 30px; color: #333;">
                <fmt:message key="register" />
            </h2>

            <form action="#" method="post">
                <div class="form-group">
                    <label for="firstName"><fmt:message key="first_name" />:</label>
                    <input type="text" id="firstName" name="firstName" required>
                </div>

                <div class="form-group">
                    <label for="lastName"><fmt:message key="last_name" />:</label>
                    <input type="text" id="lastName" name="lastName" required>
                </div>

                <div class="form-group">
                    <label for="email"><fmt:message key="email" />:</label>
                    <input type="email" id="email" name="email" required>
                </div>

                <div class="form-group">
                    <label for="phone"><fmt:message key="phone" />:</label>
                    <input type="tel" id="phone" name="phone">
                </div>

                <div class="form-group">
                    <label><fmt:message key="gender" />:</label>
                    <div class="radio-group">
                        <label><input type="radio" name="gender" value="male"> <fmt:message key="male" /></label>
                        <label><input type="radio" name="gender" value="female"> <fmt:message key="female" /></label>
                        <label><input type="radio" name="gender" value="other"> <fmt:message key="other" /></label>
                    </div>
                </div>

                <div class="form-group">
                    <label for="country"><fmt:message key="country" />:</label>
                    <select id="country" name="country">
                        <option value="">Select...</option>
                        <option value="vietnam">Vietnam</option>
                        <option value="usa">USA</option>
                        <option value="uk">UK</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="address"><fmt:message key="address" />:</label>
                    <textarea id="address" name="address" rows="3"></textarea>
                </div>

                <div class="form-group" style="text-align: center; margin-top: 30px;">
                    <button type="submit" class="btn btn-primary">
                        <fmt:message key="submit" />
                    </button>
                    <button type="reset" class="btn btn-secondary">
                        <fmt:message key="reset" />
                    </button>
                </div>
            </form>
        </div>
    </div>
</main>

<footer class="footer">
    <div class="container">
        <p><fmt:message key="footer_text" /></p>
    </div>
</footer>
</body>
</html>