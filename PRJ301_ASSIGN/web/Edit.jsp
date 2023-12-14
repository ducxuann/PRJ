<%-- 
    Document   : Edit
    Created on : Oct 19, 2022, 10:51:04 PM
    Author     : win
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <title>
            Edit Page
        </title>

        <style>
            /* Styling the Body element i.e. Color,
                    Font, Alignment */

            body {
                background-color: #fafbfd;
                font-family: Verdana;
                text-align: center;
            }

            /* Styling the Form (Color, Padding, Shadow) */
            form {
                background-color: #fff;
                max-width: 500px;
                margin: 50px auto;
                padding: 30px 20px;
                box-shadow: 2px 5px 10px rgba(0, 0, 0, 0.5);
            }

            /* Styling form-control Class */
            .form-control {
                text-align: left;
                margin-bottom: 25px;
            }

            /* Styling form-control Label */
            .form-control label {
                display: block;
                margin-bottom: 10px;
            }

            /* Styling form-control input,
                    select, textarea */
            .form-control input,
            .form-control select,
            .form-control textarea {
                border: 1px solid #777;
                border-radius: 2px;
                font-family: inherit;
                padding: 10px;
                display: block;
                width: 95%;
            }

            /* Styling form-control Radio
                    button and Checkbox */
            .form-control input[type="radio"],
            .form-control input[type="checkbox"] {
                display: inline-block;
                width: auto;
            }

            /* Styling Button */
            button {
                background-color: #05c46b;
                border: 1px solid #777;
                border-radius: 2px;
                font-family: inherit;
                font-size: 21px;
                display: block;
                width: 100%;
                margin-top: 50px;
                margin-bottom: 20px;
            }
        </style>
    </head>

    <body>
        <div style="display: flex; flex-direction: initial; justify-content: center; gap: 10px;">
            <h1 style="font-weight: 500">EDIT</h1><h1 style="font-weight: 800"> PRODUCT</h1>
        </div>
        <!-- Create Form -->
        <form onsubmit="return validateForm()" name="form" id="form" method="post" action="edit">

            <!-- Details -->
            <div class="form-control" style="border: 0px; margin-bottom: 0px;">
                <label for="name" id="label-name">
                    ID
                </label>

                <!-- Input Type Text -->
                <input class="form-control" style="margin-bottom: 0px;" value="${details.id}" readonly name="psid"   />
            </div>

            <div class="form-control" style="border: 0px; margin-bottom: 0px;">
                <label for="name" id="label-name">
                    Name
                </label>

                <!-- Input Type Text -->
                <input value="${details.name}" type="text" name="name" placeholder="Name" required/>
            </div>

            <div class="form-control" style="border: 0px; margin-bottom: 0px;">
                <label for="email" id="label-email">
                    Image
                </label>

                <!-- Input Type Email-->
                <input value="${details.image}" type="text" name="image" placeholder="Image" required/>
            </div>

            <div class="form-control" style="border: 0px; margin-bottom: 0px;">
                <label for="age" id="label-age">
                    Price
                </label>

                <!-- Input Type Text -->
                <input value="${details.price}" type="number" name="price" placeholder="Price" required/>
            </div>
            <div class="form-control" style="border: 0px; margin-bottom: 0px;">
                <label for="age" id="label-age">
                    Title
                </label>

                <!-- Input Type Text -->
                <input value="${details.title}" type="text" name="title" placeholder="Title" required/>
            </div>
            <div class="form-control" style="border: 0px; margin-bottom: 0px;">
                <label for="age" id="label-age">
                    Description
                </label>

                <!-- Input Type Text -->
                <input value="${details.des}" type="text" name="description" placeholder="Description" required/>
            </div>
            <div class="form-control" style="border: 0px; margin-bottom: 0px;">
                <label for="age" id="label-age">
                    Count
                </label>

                <!-- Input Type Text -->
                <input value="${details.count}" type="number" name="count" placeholder="Count" required/>
            </div>

            <div class="form-control" style="border: 0px; margin-bottom: 0px;">
                <label for="role" id="label-role">
                    Category
                </label>

                <!-- Dropdown options -->
                <select name="category">
                    <c:forEach items="${listC}" var="o">
                        <option value="${o.cid}">${o.cname}</option>
                    </c:forEach>
                </select>
            </div>



            <!-- Multi-line Text Input Control -->
            <button type="submit" style="cursor: pointer; color: white; font-weight: 600;">
                EDIT
            </button>
        </form>

        <script>
            function validateForm() {
                let x = document.forms["form"]["count"].value;
                let y = document.forms["form"]["price"].value;
                if (x < 0 || y < 0) {
                    alert("Không nhập giá trị âm.");
                    return false;
                }

                if (isNaN(x)) {
                    alert("Không nhập String.");
                }
            }
        </script>




        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>

</html>