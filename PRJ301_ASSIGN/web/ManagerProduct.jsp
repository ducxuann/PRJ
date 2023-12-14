<%-- 
    Document   : ManagerProduct
    Created on : Oct 19, 2022, 6:40:27 PM
    Author     : win
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
            <link href="css/style.css" rel="stylesheet" />

        
        <script src="https://kit.fontawesome.com/ecdabb78c5.js" crossorigin="anonymous"></script>
    </head>
    <body>
        
        <style>
            .bgmodel{
                width: 100%;
                height: 100%;
                background-color: #f5f5f5;
                top: 0;

            }
        </style>
        
    <div class="" style="padding-left: 20px; padding-right: 20px; background-color: black; color: white; height: 70px; display: flex; align-items: center; justify-content: space-between">
        <h2 style="margin-bottom: 0px;">Manager Product</h2>
        <div>
<!--        <button type="button" class="btn btn-danger">DELETE</button>-->
        <button type="button" class="btn btn-success" id="btnAdd">ADD NEW PRODUCT</button>
        </div>
    </div>
        <table class="table" style="position: " id="listEdit">
  <thead class="">
    <tr>
      <th scope="col">ID</th>
      <th scope="col">IMAGE</th>
      <th scope="col">NAME</th>
      <!--<th scope="col">CATEGORY</th>-->
      <th scope="col">PRICE</th>
      <th scope="col">COUNT</th>
      <th scope="col">ACTION</th>
    </tr>
  </thead>

  <tbody>
      <c:forEach items="${listP}" var="o">
        
    <tr>
      <th style="vertical-align: middle;" scope="row">${o.id}</th>
      <td><img width="80" height="100" style="vertical-align: middle;" src="${o.image}"></td>
      <td style="vertical-align: middle;">${o.name}</td>
      <!--<td style="vertical-align: middle;">${category.cname}</td>-->
      <td style="vertical-align: middle;">${o.price}</td>
      <td style="vertical-align: middle;">${o.count}</td>
      <td style="vertical-align: middle;"><a href="loadProduct?pid=${o.id}"><i class="fa-solid fa-pen-to-square" style="font-size: 25px; cursor: pointer; margin-right: 15px;"></i></a><a href="delete?pid=${o.id}"><i class="fa-solid fa-trash" style="font-size: 25px; cursor: pointer; color: red"></i></a></td>
      
    </tr>
    
    </c:forEach>
  </tbody>
   
</table>
        <div style="text-align: center; margin-bottom: 20px;">
            <c:forEach begin="1" end="${endPP}" var="i">
                <a style="padding: 5px 15px 5px 15px; border: 1px solid black;" class="${tag == i?"active":""}" href="manager?index=${i}">${i}</a>
            </c:forEach>
        </div>
        
       
        
        

 
        <div class="bgmodel" id="bgModel">
            
    <form onsubmit="return validateForm()" name="form" id="form" action="add" method="post" style="padding-bottom: 30px; padding-top: 10px; border-radius: 5px; display: none; max-width: 500px; margin: 30px auto; background-color: white; padding-left:30px; padding-right: 30px;">
        <h2 style="border-bottom: 1px solid black">ADD PRODUCT</h2>
            <div class="form-group">
              <label for="">Name:</label>
              <input name="name" type="text" class="form-control" placeholder="Name">
            </div>
            <div class="form-group">
              <label for="">Image</label>
              <input name="image" type="text" class="form-control" placeholder="Image">
            </div>
            <div class="form-group">
              <label for="">Price</label>
              <input name="price" type="number" class="form-control" placeholder="Price">
            </div>
            <div class="form-group">
              <label for="">Title</label>
              <input name="title" type="text" class="form-control" placeholder="Title">
            </div>
            <div class="form-group">
              <label for="">Description</label>
              <input name="description" type="text" class="form-control" placeholder="Description">
            </div>
            <div class="form-group">
              <label for="">Count</label>
              <input name="count" type="number" class="form-control" placeholder="Count">
            </div>
                  <select class="form-select" name="category">
                      <c:forEach items="${listC}" var="o">

                          <option value="${o.cid}">${o.cname}</option>

                      </c:forEach>
                          </select>
            <button type="submit" class="btn btn-primary">ADD</button>
            <button type="button" class="btn btn-danger" id="btnCancer">Cancer</button>
</form>
            
        </div>
        
        
        
        <script>
            const btn = document.getElementById('btnAdd');
            const bg = document.getElementById('bgModel');
            
            const formlistEdit = document.getElementById('listEdit');
            
             function validateForm() {
                            let x = document.forms["form"]["count"].value;
                            let y = document.forms["form"]["price"].value;
                            if (x <0 || y < 0) {
                                alert("Không nhập giá trị âm.");
                                return false;
                            }
                            
                            if(isNaN(x)){
                                alert("Không nhập String.");
                            }
                        }
            
            
            btn.addEventListener('click', () => {
              const form = document.getElementById('form');
              const bg = document.getElementById('bgModel');
              formlistEdit.style.display = 'none';
              if (form.style.display === 'none') {
                // 👇️ this SHOWS the form
                form.style.display = 'block';
                bg.style.position = 'absolute';
              } else {
                // 👇️ this HIDES the form
                form.style.display = 'none';
              }
            });

            const btnCancer = document.getElementById('btnCancer');
            
            btnCancer.addEventListener('click', () => {
              const form = document.getElementById('form');
              const bg = document.getElementById('bgModel');
              bg.style.position = 'relative';
              form.style.display ='none';
              formlistEdit.style.display = '';
            });
        </script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
