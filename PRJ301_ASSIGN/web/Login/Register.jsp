<%-- 
    Document   : Register
    Created on : Oct 11, 2022, 11:55:46 PM
    Author     : win
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <link rel="stylesheet" href="../css/register.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <!-- partial:index.partial.html -->
        <div id="login-form-wrap">
            <h2>Register</h2>
            <form id="login-form" method="post" action="signup">
                <p>
                    <input type="text" id="firstName" name="firstName" placeholder="First Name" required>
                </p>
                <p>
                    <input type="text" id="lastName" name="lastName" placeholder="Last Name" required>
                </p>
                <p>
                    <input type="text" id="userName" name="userName" placeholder="Username" required><i class="validation"><span></span><span></span></i>
                </p>
                <p>
                    <input type="password" id="password" name="password" placeholder="Password" required>
                </p>
                <p>
                    <input type="password" id="veryPassword" name="veryPassword" placeholder="Confirm Password" required>
                </p>
                <p>
                    <input type="password" id="security" name="security" placeholder="PIN" required>
                </p>
                <p>
                    <input type="email" id="email" name="email" placeholder="Email" pattern=".+@gmail\.com" required>
                </p>
<!--                <p>
                    <label><strong>Permission:</strong></label>
                    <select name="isAdmin" id="isAdmin">
                        <option value="0">User</option>
                    </select>
                </p>-->
                <p>
                    <input type="submit" id="register" value="Register">
                </p>
                <div id="wrongConfirmpass${(err.length() > 0) ? "active":""}" class="alert alert-danger" role="alert">
                    ${err}
                </div>
                <div id="signupnotify${(notify.length() > 0) ? "active":""}"class="alert alert-success" role="alert">
                    ${notify}
                </div>
            </form>
            <div id="create-account-wrap">
                <p><a href="Login.jsp" style="text-decoration: none;">Login</a><p>
            </div>
        </div>
        <!-- partial -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
