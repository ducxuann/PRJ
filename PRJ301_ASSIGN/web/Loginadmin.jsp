<%-- 
    Document   : Loginadmin
    Created on : Oct 28, 2022, 9:46:50 PM
    Author     : Tran Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>


        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    
    <body>
        
        <style>
            #notifyAdmin{
                display: none;
            }
            
            notifyAdmin:active{
                display: block;
            }
        </style>

        <form method="post" action="adminlogin" style="position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%); padding: 20px 20px 20px 20px; margin: 30px auto;width: 50%;border-radius: 10px;box-sizing: border-box; box-shadow: 0px 30px 50px 0px rgb(0 0 0 / 20%);">
            <h1 style="text-align: center">Admin Login</h1>
            <div class="form-group">
                <label>Username</label>
                <input name="username" type="text" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Password</label>
                <input name="password" type="password" class="form-control" required>
            </div>
            <button style="width: 100%;"type="submit" class="btn btn-primary">Login</button>

            <div id="${notify == null?"notifyAdmin":notify}" style="margin-top: 20px;"class="alert alert-danger" role="alert">
                ${notify}
            </div>
        </form>




        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
