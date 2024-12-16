<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
          integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <style>
        body{
            background-color:pink;
            width:100vw;
            height:100vh;
        }
        .loginForm {
            /*边框高度*/
            height: 350px;
            /*边框宽度*/
            width: 500px;
            /*边框颜色*/
            border: #4d4d4d solid 1px;
            /*边框圆角*/
            border-radius: 4px;
            /*阴影 水平方向，竖直方向，模糊距离*/
            box-shadow: 5px 5px 5px #4d4d4d;
            /*上边界距离*/
            margin-top: 300px;
            /*左边界距离：自动*/
            margin-left: auto;
            /*右边界距离：自动*/
            margin-right: auto;
            /*用户名、密码间距*/
            padding: 20px 40px;
            background-color:#fff;
        }

        /*将用户登录置于中间*/
        .loginForm h2 {
            text-align: center;
        }

        /*修改button属性*/
        .button {
            text-align: center;
            vertical-align: middle;
        }
    </style>
</head>
<body>
<div class="text-center">
    <img src="./Images/pet-shop.png" alt="MyPetShop Logo" style="height: 60px; margin: 20px;">
</div>
<div class="loginForm">
    <h2>用户登录</h2>
    <form>
        <div class="form-group">
            <label for="exampleInputEmail1">用户名</label>
            <input type="email" class="form-control" id="exampleInputEmail1" placeholder="请输入用户名">
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">密码</label>
            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="请输入密码">
        </div>

        <div class="checkbox">
            <label>
                <input type="checkbox"> 同意
                <a href="#">&nbsp;&nbsp;&nbsp;&nbsp;xxx安全协议</a> 与 <a href="#">&nbsp;&nbsp;&nbsp;&nbsp;xxx隐私协议</a>
            </label>
        </div>
        <div class="button">
            <input type="submit" class="btn btn-primary" value="登 录"/>
        </div>
    </form>
</div>


</body>
</html>
