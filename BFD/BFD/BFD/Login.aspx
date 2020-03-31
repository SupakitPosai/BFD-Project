<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BFD.Login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BFD</title>
    <meta charset="utf-8">
  
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
    <!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

	<!--Custom styles-->
	<%--<link rel="stylesheet" type="text/css" href="styles.css">--%>
  
  <style>
      @font-face {
    font-family: 'DB Helvethaica X Blk v3.2'; /*a name to be used later*/
    src: url("/font/DB Helvethaica X Blk v3.2.ttf"); /*URL to font*/
}
      @font-face {
    font-family: 'DB Helvethaica X Bd Cond v3.2'; /*a name to be used later*/
    src: url("/font/DB Helvethaica X Bd Cond v3.2.ttf"); /*URL to font*/
}
body  {
    background-image: url("/Pic/bg1.jpg");
  background-color: #cccccc;

}
@import url('https://fonts.googleapis.com/css?family=Numans');


html,body{
    font-size:14px;
background-size: cover;
background-repeat: no-repeat;
height: 100%;
font-family: 'Numans', sans-serif;
}

.container{
height: 100%;
align-content: center;
}

.card{
    font-family: 'DB Helvethaica X Bd Cond v3.2';
    font-size: 22px;
height: 380px;
margin-top: auto;
margin-bottom: auto;
width: 400px;
background-color: rgba(0,0,0,0.5) !important;
}

.social_icon span{
font-size: 60px;
margin-left: 10px;
color: #FFC312;
}

.social_icon span:hover{
color: white;
cursor: pointer;
}

.card-header h4{
color: white;
font-family: 'DB Helvethaica X Blk v3.2';
font-size: 33px;
}
.card-footer{
color: white;

}

.social_icon{
position: absolute;
right: 20px;
top: -45px;
}

.input-group-prepend span{
width: 50px;

background-color: #FFC312;
color: black;
border:0 !important;
}
.form-control{
    font-size: 22px;
    height:40px;
}
input:focus{
outline: 0 0 0 0  !important;
box-shadow: 0 0 0 0 !important;

}

.remember{
color: white;
}

.remember input
{
width: 20px;
height: 20px;
margin-left: 15px;
margin-right: 5px;
}

.login_btn{
color: black;
background-color: #FFC312;
width: 100px;
font-size: 22px;
}

.login_btn:hover{
color: black;
background-color: white;
}

.links{
color: white;
}

.links a{
margin-left: 4px;
}
</style>
  
  
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <br />
            <br />
            <br />
            <br />
            <br />
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<h4>ระบบบริหารข้อมูลไก่ประกัน <br />สำหรับเจ้าหน้าที่ส่งเสริม</h4>
				<div class="d-flex justify-content-end social_icon">
					<img src="Pic/Logo.png"  alt="Logo" style="width: 25%"> 
					
					
				</div>
			</div>
            <div class="card-body">
				<form>
					<div class="input-group form-group">
						<div class="input-group-prepend ">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
                <asp:TextBox runat="server" type="tel" class="form-control" ID="txt_tel" placeholder="กรอกเบอร์โทร" name="tel"></asp:TextBox>
            </div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
                <asp:TextBox runat="server" type="password" class="form-control" placeholder="กรอกรหัสผ่าน" ID="txt_pwd"  name="pwd"></asp:TextBox>
            </div>
					<div class="row align-items-center remember">
						<input type="checkbox">จำรหัสผ่าน
					</div>
					<div class="form-group">
            <asp:Button type="submit" runat="server" text="เข้าสู่ระบบ" class="btn float-right login_btn" ID="btn_login" OnClick="btn_login_Click"  />
           </div>
				</form>
			</div>
			<div class="card-footer">
				<p>ติดต่อเรา : 0987654321</p>
              
			</div>
		</div>
	</div>
</div>

    </form>
</body>
</html>
