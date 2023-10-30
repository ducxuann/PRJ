<%-- 
    Document   : CourseDetail
    Created on : Jul 4, 2023, 3:18:40 PM
    Author     : kienb
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                                                            <div class="col-md-4">
                                                                <table>
                                                                    <tbody>
                                                                        <tr>
                                                                            <td colspan="2" class="auto-style1"><strong>FAP mobile app (myFAP) is ready at</strong></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><a href="https://apps.apple.com/app/id1527723314">
                                                                                    <img src="https://fap.fpt.edu.vn/images/app-store.png"
                                                                                         style="width: 120px; height: 40px" alt="apple store"></a></td>
                                                                            <td><a href="https://play.google.com/store/apps/details?id=com.fuct">
                                                                                    <img src="https://fap.fpt.edu.vn/images/play-store.png"
                                                                                         style="width: 120px; height: 40px" alt="google store"></a></td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div>
                                                                    <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE"
                                                                           value="/wEPDwUKMTgxODkxNDAwNg9kFgJmD2QWAgIDD2QWCAIBDxYCHgdWaXNpYmxlZxYEAgEPDxYCHgRUZXh0BQ5raWVubmhoZTE2MzA1NGRkAgMPDxYCHwEFGCBDQU1QVVM6IEZQVFUtSMOyYSBM4bqhY2RkAgMPDxYCHwEFazxhIGhyZWY9Jy4uL1N0dWRlbnQuYXNweCc+SG9tZTwvYT4mbmJzcDt8Jm5ic3A7PGEgaHJlZj0nQWN0aXZpdHkuYXNweCc+QWN0aXZpdHk8L2E+Jm5ic3A7fCZuYnNwOzxiPlZpZXc8L2I+ZGQCBQ9kFgQCAQ8WAh4JaW5uZXJodG1sBQU8YnIvPmQCAw8WAh8CBa8HPHRhYmxlPjx0Ym9keT48dHIgYWxpZ249ImxlZnQiPjx0ZD5EYXRlOjwvdGQ+PHRkPldlZG5lc2RheSAyOC8wNi8yMDIzPC90ZD48L3RyPjx0ciBhbGlnbj0ibGVmdCI+PHRkPlNsb3Q6PC90ZD48dGQ+MTwvdGQ+PC90cj48dHIgYWxpZ249ImxlZnQiPjx0ZD5TdHVkZW50IGdyb3VwPC90ZD48dGQ+PGEgaHJlZj0nLi4vQ291cnNlL0dyb3Vwcy5hc3B4P2dyb3VwPTM0MjY2Jz5TRTE2MTgtTkVUPC9hPjwvdGQ+PC90cj48dHIgYWxpZ249ImxlZnQiPjx0ZD5JbnN0cnVjdG9yOjwvdGQ+PHRkPjxhIGhyZWY9Jy4uL1VzZXIvVXNlckRldGFpbC5hc3B4P2xvZ2luPVRyaVREJz5UcmlURDwvYT4tIDxhIGNsYXNzPSdidG4gYnRuLXdhcm5pbmcnIGhyZWY9J2h0dHBzOi8vbWVldC5nb29nbGUuY29tL2NkYi1zeXl0LXBtaCcgdGFyZ2V0PSdfYmxhbmsnPiBNZWV0VVJMPC9hPjwvdGQ+PC90cj48dHIgYWxpZ249ImxlZnQiPjx0ZD5Db3Vyc2U6PC90ZD48dGQ+U1cgQXJjaGl0ZWN0dXJlIGFuZCBEZXNpZ24oU1dEMzkyKTwvdGQ+PC90cj48dHIgYWxpZ249ImxlZnQiPjx0ZD5Db3Vyc2Ugc2Vzc2lvbiBudW1iZXI6PC90ZD48dGQ+MTU8L3RkPjwvdHI+PHRyIGFsaWduPSJsZWZ0Ij48dGQ+Q291cnNlIHNlc3Npb24gdHlwZTo8L3RkPjx0ZD48L3RkPjwvdHI+PHRyIGFsaWduPSJsZWZ0Ij48dGQ+Q291cnNlIHNlc3Npb24gZGVzY3JpcHRpb246PC90ZD48dGQ+PC90ZD48L3RyPjx0ciBhbGlnbj0ibGVmdCI+PHRkPkNhbXB1cy9Qcm9ncmFtbWU6PC90ZD48dGQ+RlUtSEw8L3RkPjwvdHI+PHRyIGFsaWduPSdsZWZ0Jz48dGQ+QXR0ZW5kYW5jZTo8L3RkPjx0ZD5BdHRlbmRlZDwvdGQ+PC90cj48dHI+PHRkPjwvdGQ+PC90cj4pPHRyIGFsaWduPSJsZWZ0Ij48dGQ+UmVjb3JkIHRpbWU6PC90ZD48dGQ+NC82LzIwMjMgMTA6NDM6MDAgQU08L3RkPjwvdHI+PC90Ym9keT48L3RhYmxlPmQCBw8WAh8AZ2RkZajZFwt4zpIvLvnTCD5N8Sbsb6p4pNA31UQf+21Ojak=">
                                                                </div>
                                                                <div>
                                                                    <input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="63473AE8">
                                                                        <input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION"
                                                                               value="/wEdAAJa6gKDDjMs7zJNsYCreNP/mPTFF8I2hIDwda9rxHz0/zpW0mtrjDi6VK8m/zZ5/ifnfyIUokWLGdjGpgccfMLi">
                                                                            </div>
                                                                            <div id="ctl00_divUser" style="float: right; margin-right: 16px;">
                                                                                <a href="?view=user">
                                                                                    <span id="ctl00_lblLogIn" class="label label-success">ducvxhe161346</span></a> | <a
                                                                                    href="?logout=true" class="label label-success">logout</a> |
                                                                                <span id="ctl00_lblCampusName" class="label label-success"> CAMPUS: FPTU-Hòa Lạc</span>
                                                                            </div>
                                                                            <ol class="breadcrumb">
                                                                                <li>
                                                                                    <span id="ctl00_lblNavigation"><a href="Home.jsp">Home</a>&nbsp;|&nbsp;<b>View</b></span>
                                                                                </li>
                                                                            </ol>
                                                                            <table>
                                                                                <tbody>
                                                                                    <tr style="border-bottom: 0 none">
                                                                                        <td>
                                                                                            <div>
                                                                                                <h2>
                                                                                                    Activity detail</h2>
                                                                                                <center>
                                                                                                    <div id="ctl00_mainContent_divTitle"><br></div>
                                                                                                    <tbody>
                                                                                                        <tr align="left">
                                                                                                            <td>Date:</td>
                                                                                                            <fmt:parseDate value="${requestScope.detail.date}" pattern="yyyy-MM-dd" var="parsedDate" type="date" />
                                                                                                            <fmt:formatDate value="${parsedDate}" var="newParsedDate" type="date" pattern="dd/MM/yyyy" />
                                                                                                            <td>${newParsedDate}</td>
                                                                                                        </tr>
                                                                                                        <tr align="left">
                                                                                                            <td>Slot:</td>
                                                                                                            <td>${requestScope.detail.slotid}</td>
                                                                                                        </tr>
                                                                                                        <tr align="left">
                                                                                                            <td>Student group</td>
                                                                                                            <td>${requestScope.detail.tier.name}
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr align="left">
                                                                                                            <td>Instructor:</td>
                                                                                                            <td>${requestScope.detail.teacher.email}
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr align="left">
                                                                                                            <td>Course:</td>
                                                                                                            <td>${requestScope.detail.course.name}</td>
                                                                                                        </tr>
                                                                                                        <tr align="left">
                                                                                                            <td>Attendance:</td>
                                                                                                            <td>
                                                                                                                <c:if test="${requestScope.detail.status == null}">
                                                                                                                    <font color="red">Not yet
                                                                                                                    </font>
                                                                                                                </c:if>
                                                                                                                <c:if test="${requestScope.detail.status != null and requestScope.detail.status eq true}">
                                                                                                                    <font color="green">Attended
                                                                                                                    </font>
                                                                                                                </c:if>
                                                                                                                <c:if test="${requestScope.detail.status != null and requestScope.detail.status eq false}">
                                                                                                                    <font color="red">Absent
                                                                                                                    </font>
                                                                                                                </c:if>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td></td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                    </table>
                                                                                            </div>
                                                                                            </center>

                                                                                            </div>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr style="border-bottom: 0 none">
                                                                                        <td>
                                                                                            <br>
                                                                                                <table width="100%" style="border: 1px solid transparent;" id="cssTable">
                                                                                                    <tbody>
                                                                                                        <tr>
                                                                                                            <td>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                            </div>
                                                                            </div>
                                                                            </div>
                                                                            <script type="text/javascript">

                                                                                var _gaq = _gaq || [];
                                                                                _gaq.push(['_setAccount', 'UA-10421012-13']);
                                                                                _gaq.push(['_trackPageview']);

                                                                                (function () {
                                                                                    var ga = document.createElement('script');
                                                                                    ga.type = 'text/javascript';
                                                                                    ga.async = true;
                                                                                    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                                                                                    var s = document.getElementsByTagName('script')[0];
                                                                                    s.parentNode.insertBefore(ga, s);
                                                                                })();

                                                                            </script>
                                                                            <script type="text/javascript">
                                                                                var isClose = false;

                                                                                //this code will handle the F5 or Ctrl+F5 key
                                                                                //need to handle more cases like ctrl+R whose codes are not listed here
                                                                                document.onkeydown = checkKeycode;
                                                                                function checkKeycode(e) {
                                                                                    var keycode;
                                                                                    if (window.event)
                                                                                        keycode = window.event.keyCode;
                                                                                    else if (e)
                                                                                        keycode = e.which;
                                                                                    if (keycode == 116) {
                                                                                        isClose = true;
                                                                                    }
                                                                                }
                                                                                function somefunction() {
                                                                                    isClose = true;
                                                                                }

                                                                                //<![CDATA[

                                                                                function bodyUnload() {

                                                                                    if (!isClose) {
                                                                                        var request = GetRequest();
                                                                                        request.open("GET", "LogOut.aspx", true);
                                                                                        request.send();
                                                                                    }
                                                                                }
                                                                                function GetRequest() {
                                                                                    var request = null;
                                                                                    if (window.XMLHttpRequest) {
                                                                                        //incase of IE7,FF, Opera and Safari browser
                                                                                        request = new XMLHttpRequest();
                                                                                    } else {
                                                                                        //for old browser like IE 6.x and IE 5.x
                                                                                        request = new ActiveXObject('MSXML2.XMLHTTP.3.0');
                                                                                    }
                                                                                    return request;
                                                                                }
                                                                                //]]>
                                                                            </script>
                                                                            <script defer=""
                                                                                    src="https://static.cloudflareinsights.com/beacon.min.js/v52afc6f149f6479b8c77fa569edb01181681764108816"
                                                                                    integrity="sha512-jGCTpDpBAYDGNYR5ztKt4BQPGef1P0giN6ZGVUi835kFF88FOmmn8jBQWNgrNd8g/Yu421NdgWhwQoaOPFflDw=="
                                                                                    data-cf-beacon="{&quot;rayId&quot;:&quot;7e15eddfbc33107b&quot;,&quot;token&quot;:&quot;56c6dd7e4ecf4947aa540f48289e45af&quot;,&quot;version&quot;:&quot;2023.4.0&quot;,&quot;si&quot;:100}"
                                                                            crossorigin="anonymous"></script>


                                                                            </body>

                                                                            </html>

