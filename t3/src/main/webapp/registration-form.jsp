<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Course Registration Form</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f5f5f5; }
        .container { background-color: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        .form-group { margin-bottom: 15px; }
        label { display: inline-block; width: 150px; margin-bottom: 5px; font-weight: bold; }
        input, select, textarea { width: 250px; padding: 8px; border: 1px solid #ddd; border-radius: 4px; }
        input[type="checkbox"], input[type="radio"] { width: auto; }
        .checkbox-group, .radio-group { margin-left: 155px; }
        .submit-btn { background-color: #007bff; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; }
        .submit-btn:hover { background-color: #0056b3; }
    </style>
</head>
<body>
<div class="container">
    <h2>Student Course Registration Form</h2>
    <form action="registration-servlet" name="formDangKy" method="post">
        <div class="form-group">
            <label for="firstName">First Name:</label>
            <input type="text" id="firstName" name="firstName" required>
        </div>

        <div class="form-group">
            <label for="lastName">Last Name:</label>
            <input type="text" id="lastName" name="lastName" required>
        </div>

        <div class="form-group">
            <label for="dayOfBirth">Day of Birth:</label>
            <input type="date" id="dayOfBirth" name="dayOfBirth" required>
        </div>

        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>

        <div class="form-group">
            <label for="mobileNumber">Mobile Number:</label>
            <input type="tel" id="mobileNumber" name="mobileNumber" required>
        </div>

        <div class="form-group">
            <label>Gender:</label>
            <div class="radio-group">
                <input type="radio" id="male" name="gender" value="Male" required>
                <label for="male">Male</label>
                <input type="radio" id="female" name="gender" value="Female" required>
                <label for="female">Female</label>
                <input type="radio" id="other" name="gender" value="Other" required>
                <label for="other">Other</label>
            </div>
        </div>

        <div class="form-group">
            <label for="address">Address:</label>
            <textarea id="address" name="address" rows="3" required></textarea>
        </div>

        <div class="form-group">
            <label for="city">City:</label>
            <input type="text" id="city" name="city" required>
        </div>

        <div class="form-group">
            <label for="pinCode">Pin Code:</label>
            <input type="text" id="pinCode" name="pinCode" required>
        </div>

        <div class="form-group">
            <label for="state">State:</label>
            <input type="text" id="state" name="state" required>
        </div>

        <div class="form-group">
            <label for="country">Country:</label>
            <select id="country" name="country" required>
                <option value="">Select Country</option>
                <option value="Vietnam">Vietnam</option>
                <option value="USA">USA</option>
                <option value="Canada">Canada</option>
                <option value="UK">UK</option>
                <option value="Australia">Australia</option>
            </select>
        </div>

        <div class="form-group">
            <label>Hobbies:</label>
            <div class="checkbox-group">
                <input type="checkbox" id="reading" name="hobbies" value="Reading">
                <label for="reading">Reading</label><br>
                <input type="checkbox" id="sports" name="hobbies" value="Sports">
                <label for="sports">Sports</label><br>
                <input type="checkbox" id="music" name="hobbies" value="Music">
                <label for="music">Music</label><br>
                <input type="checkbox" id="travel" name="hobbies" value="Travel">
                <label for="travel">Travel</label><br>
                <input type="checkbox" id="gaming" name="hobbies" value="Gaming">
                <label for="gaming">Gaming</label>
            </div>
        </div>

        <div class="form-group">
            <label>Qualification:</label>
            <div class="checkbox-group">
                <input type="checkbox" id="highschool" name="qualifications" value="High School">
                <label for="highschool">High School</label><br>
                <input type="checkbox" id="bachelor" name="qualifications" value="Bachelor's Degree">
                <label for="bachelor">Bachelor's Degree</label><br>
                <input type="checkbox" id="master" name="qualifications" value="Master's Degree">
                <label for="master">Master's Degree</label><br>
                <input type="checkbox" id="phd" name="qualifications" value="PhD">
                <label for="phd">PhD</label>
            </div>
        </div>

        <div class="form-group">
            <label>Courses:</label>
            <div class="checkbox-group">
                <input type="checkbox" id="java" name="courses" value="Java Programming">
                <label for="java">Java Programming</label><br>
                <input type="checkbox" id="python" name="courses" value="Python Programming">
                <label for="python">Python Programming</label><br>
                <input type="checkbox" id="web" name="courses" value="Web Development">
                <label for="web">Web Development</label><br>
                <input type="checkbox" id="mobile" name="courses" value="Mobile Development">
                <label for="mobile">Mobile Development</label><br>
                <input type="checkbox" id="database" name="courses" value="Database Management">
                <label for="database">Database Management</label>
            </div>
        </div>

        <div class="form-group">
            <input type="submit" value="Register" class="submit-btn">
            <input type="reset" value="Reset" class="submit-btn">
        </div>
    </form>
</div>
</body>
</html>