<%-- 
    Document   : ChangeSession
    Created on : Jul 4, 2023, 5:58:14 PM
    Author     : kienb
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
            <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
                <title>
                    FPT University Academic Portal
                </title>
                <link rel="Stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" type="text/css">
                    <link rel="Stylesheet" href="fu.css" type="text/css">
                        <link rel="Stylesheet" href="JavaScript/jquery.css" type="text/css">
                            <link rel="Stylesheet" href="JavaScript/jquery-ui.css" type="text/css">
                                <link rel="Stylesheet" href="JavaScript/jquery.alerts.css" type="text/css">
                                    <script type="text/javascript" async="" src="https://ssl.google-analytics.com/ga.js"></script>
                                    <script src="../JavaScript/jquery.min.js" type="text/javascript"></script>
                                    <script src="../JavaScript/jquery_002.js" type="text/javascript"></script>
                                    <script src="../JavaScript/jquery_003.js" type="text/javascript"></script>
                                    <script src="../JavaScript/jquery.js" type="text/javascript"></script>
                                    <script src="../JavaScript/jquery-1.8.3.js" type="text/javascript"></script>
                                    <script src="../JavaScript/jquery-ui.js" type="text/javascript"></script>
                                    <script src="../JavaScript/jquery.alerts.js" type="text/javascript"></script>
                                    <link rel="Stylesheet" href="Content/bootstrap.css" type="text/css">
                                        <link rel="Stylesheet" href="Content/bootstrap.min.css" type="text/css">
                                            <link rel="Stylesheet" href="Content/bootstrap-theme.min.css" type="text/css">
                                                <style type="text/css">
                                                    .style1 {
                                                        font-weight: bold;
                                                    }
                                                </style>
                                                </head>
                                                <body style="">
                                                    <div class="container">
                                                        <div class="row">
                                                            <div class="col-md-8">
                                                                <h1><span>FPT University Academic Portal</span>
                                                                </h1>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <form method="post" action="changeSession" id="aspnetForm">
                                                                    <div>
                                                                        <input type="hidden" name="sid" value="${requestScope.detail.room.id}">
                                                                            <input type="hidden" name="slid" id="__EVENTARGUMENT" value="${requestScope.detail.slotid}">
                                                                                <input type="hidden" name="date" id="__LASTFOCUS" value="${requestScope.date}">
                                                                                    </div>
                                                                                    <ol class="breadcrumb">
                                                                                        <li>
                                                                                            <span id="ctl00_lblNavigation"><a href="Home.jsp">Home</a>&nbsp;|&nbsp;<b>ChangeSlot
                                                                                                    Course</b></span>
                                                                                        </li>
                                                                                    </ol>
                                                                                    <table>
                                                                                        <tbody>
                                                                                            <tr style="border-bottom: 0 none">
                                                                                                <td>
                                                                                                    <div>
                                                                                                        <h2><span id="ctl00_mainContent_lblTitle">Đổi lịch dạy</span></h2>
                                                                                                        <br>
                                                                                                            <br>
                                                                                                                <span id="ctl00_mainContent_lblMessage" style="color:Red;"></span>
                                                                                                                <table>
                                                                                                                    <tbody>
                                                                                                                        <tr>
                                                                                                                            <td>Mã môn học (SubjectCode)</td>
                                                                                                                            <td>
                                                                                                                                <input type="text" name="subjectCode" readonly="" value="${requestScope.detail.course.name}">
                                                                                                                            </td>
                                                                                                                        </tr>
                                                                                                                        <tr>
                                                                                                                            <td></td>
                                                                                                                            <td>
                                                                                                                                <span id="ctl00_mainContent_lblReplaceSubject"
                                                                                                                                      style="font-size:15pt;color: #009933"></span>
                                                                                                                            </td>
                                                                                                                        </tr>
                                                                                                                        <tr>
                                                                                                                            <td>Lớp (Class)</td>
                                                                                                                            <td>
                                                                                                                                <input type="text" name="class" readonly="" value="${requestScope.detail.tier.name}">
                                                                                                                            </td>
                                                                                                                        </tr>
                                                                                                                        <tr>
                                                                                                                            <td>Slot</td>
                                                                                                                            <td><select name="newsid">
                                                                                                                                    <c:forEach items="${requestScope.slots}" var="i">
                                                                                                                                        <option value="${i.id}" ${i.id == requestScope.detail.slotid ? 'selected' : ''}>${i.name}</option>
                                                                                                                                    </c:forEach>
                                                                                                                                </select>
                                                                                                                            </td>
                                                                                                                        </tr>
                                                                                                                        <tr>
                                                                                                                            <td>Phòng học</td>
                                                                                                                            <td><select name="newslid">
                                                                                                                                    <c:forEach items="${requestScope.rooms}" var="i">
                                                                                                                                        <option value="${i.id}" ${i.id == requestScope.detail.room.id ? 'selected' : ''}>${i.name}</option>
                                                                                                                                    </c:forEach>
                                                                                                                                </select>
                                                                                                                            </td>
                                                                                                                        </tr>
                                                                                                                        <tr>
                                                                                                                            <td>Ngày học</td>
                                                                                                                            <td>
                                                                                                                                <input type="date" name="newdate" value="${requestScope.date}"> 
                                                                                                                                    
                                                                                                                            </td>
                                                                                                                        </tr>
                                                                                                                        <tr>
                                                                                                                            <td></td>
                                                                                                                            <td style="color: red">${requestScope.error}</td>
                                                                                                                        </tr>
                                                                                                                        <tr>
                                                                                                                            <td></td>
                                                                                                                            <td>
                                                                                                                                <input type="submit" name="action" value="Save"
                                                                                                                                       id="ctl00_mainContent_btSave"
                                                                                                                                       style="width:75px;">&nbsp;
                                                                                                                                    <input type="submit" name="action" value="Cancel"
                                                                                                                                           id="ctl00_mainContent_btCancel" style="width:75px;">
                                                                                                                                        </td>
                                                                                                                                        </tr>
                                                                                                                                        </tbody>
                                                                                                                                        </table>
                                                                                                                                        <input type="hidden" name="ctl00$mainContent$hdException"
                                                                                                                                               id="ctl00_mainContent_hdException">
                                                                                                                                            <input type="hidden" name="ctl00$mainContent$hdNeedWarning"
                                                                                                                                                   id="ctl00_mainContent_hdNeedWarning" value="1">
                                                                                                                                                </div>
                                                                                                                                                </td>
                                                                                                                                                </tr>
                                                                                                                                                </tbody>
                                                                                                                                                </table>                                           
                                                                                                                                                <script defer=""
                                                                                                                                                        src="https://static.cloudflareinsights.com/beacon.min.js/v52afc6f149f6479b8c77fa569edb01181681764108816"
                                                                                                                                                        integrity="sha512-jGCTpDpBAYDGNYR5ztKt4BQPGef1P0giN6ZGVUi835kFF88FOmmn8jBQWNgrNd8g/Yu421NdgWhwQoaOPFflDw=="
                                                                                                                                                        data-cf-beacon="{&quot;rayId&quot;:&quot;7e1712eacfaeb473&quot;,&quot;token&quot;:&quot;56c6dd7e4ecf4947aa540f48289e45af&quot;,&quot;version&quot;:&quot;2023.4.0&quot;,&quot;si&quot;:100}"
                                                                                                                                                crossorigin="anonymous"></script>


                                                                                                                                                </body>

                                                                                                                                                </html>
