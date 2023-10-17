<%-- 
    Document   : Login
    Created on : Jul 3, 2023, 4:34:21 PM
    Author     : kienb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
   <meta http-equiv="X-UA-Compatible" content="IE=Edge">
   <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
   <title>
       FPT University Academic Portal
   </title>
                
  </head>

       <body style="">
            <div class="container">
                <div class="row">
                   <div class="col-md-8">
                    <h1><span>FPT University Academic Portal</span>
                    </h1>
                    <form action="login" method="post">
                    <div class="form-group">
                    <label for="exampleInputEmail1">Email address</label>
                    <input type="email" class="form-control" id="exampleInputEmail1"
                    aria-describedby="emailHelp" placeholder="Enter email" name="email" required="">
                    </div>
                    <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <input type="password" class="form-control"
                        id="exampleInputPassword1" placeholder="Password" name="password" required="">
                            </div>
                                <div style="color: red">${requestScope.error}</div>
                                    <button style="margin-left: 40%;" type="submit"
                                        class="btn btn-primary">Submit</button>
                                            </form>
                    </div>
                </div>
            </div>
                                                    

       </body>

</html>