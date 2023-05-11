<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Login</title>
    </head>

    <body>
        <form action="/t6_23/checklogin.controller" method="post">
            <table>
                <tr>
                    <td>UserName:</td>
                    <td><input type="text" name="username"></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="password"></td>
                </tr>
                <tr>
                    <td colspan="2"><button type="submit" value="login">Login</button></td>
                </tr>
            </table>
        </form>
    </body>

    </html>