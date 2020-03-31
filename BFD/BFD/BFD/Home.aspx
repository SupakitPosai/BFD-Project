<%@ Page Title="" Language="C#" MasterPageFile="~/BFD.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="BFD.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     
    <style>
        .btn1{
             background-color:#F2B90C;
             width:170px;
             font-family: 'DB Helvethaica X Blk v3.2';
            font-size:22px;
            height:30px;
         }
        .btn2{
             background-color:#F2B90C;
             width:170px;
             font-family: 'DB Helvethaica X Blk v3.2';
            font-size:22px;
            height:30px;
         }
        .btn3{
             background-color:#F2B90C;
             width:170px;
             font-family: 'DB Helvethaica X Blk v3.2';
            font-size:22px;
            height:30px;
         }
        .bb1{
           float:right;
           margin-right:80px;
            margin-top:-18px;
            
        }
        .co1{
            width:100%;
        }
       .carousel-inner img {
    
        width: 100%; /* Set width to 100% */
        margin: auto;
        
         }
      .carousel-caption h3 {
        color: #fff !important;
      }
      @media (max-width: 600px) {
        .carousel-caption {
          display: none; /* Hide the carousel text when the screen is less than 600 pixels wide */
        }
      }
      .tx1{

          margin-top: -6px;
             
      }  
   .slideanim {visibility:hidden;}
  .slide {
    animation-name: slide;
    -webkit-animation-name: slide;
    animation-duration: 1s;
    -webkit-animation-duration: 1s;
    visibility: visible;
  }
 @keyframes slide {
    0% {
      opacity: 0;
      transform: translateY(70%);
    } 
    100% {
      opacity: 1;
      transform: translateY(0%);
    }
  }
  @-webkit-keyframes slide {
    0% {
      opacity: 0;
      -webkit-transform: translateY(70%);
    } 
    100% {
      opacity: 1;
      -webkit-transform: translateY(0%);
    }
  }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <script src="https://www.gstatic.com/firebasejs/5.9.3/firebase.js"></script>
    <%--<%if (Session["ID"] == null)  
        {
            Response.Redirect("Login.aspx");
        } %>--%>
  
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="Pic/k3.png" alt="New York" width="1200" height="500">
        <%--<div class="carousel-caption">
         <%-- <h3>New York</h3>
          <p>The atmosphere in New York is lorem ipsum.</p>
        </div>   --%>   
      </div>

      <div class="item">
        <img src="Pic/k1.png" alt="Chicago" width="1000" height="500">
        <%--<div class="carousel-caption">
          <%--<h3>Chicago</h3>
          <p>Thank you, Chicago - A night we won't forget.</p>
        </div> --%>     
      </div>
    
      <div class="item">
        <img src="Pic/k2.png" alt="Los Angeles" width="1000" height="500">
        <%--<div class="carousel-caption">
          <%--<h3>LA</h3>
          <p>Even though the traffic was a mess, we had the best time playing at Venice Beach!</p>
        </div>--%>      
      </div>
    </div>
         
    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>
    <div class="container co1">
    <div class="r1 row">
        
        <div class=" col-sm-12 text-center">
            <h3>ระบบบริหารข้อมูลไก่ประกัน</h3>
        </div>
           
    </div>
    <br />
    <br />
        </div>
    <div class="container" id="Home">
        
    </div>
       <%-- <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>--%>
   
    <script type="text/javascript">
        $(window).scroll(function () {
            $(".slideanim").each(function () {
                var pos = $(this).offset().top;

                var winTop = $(window).scrollTop();
                if (pos < winTop + 600) {
                    $(this).addClass("slide");
                }
            });
        });
        // Your web app's Firebase configuration
        var firebaseConfig = {
            apiKey: "AIzaSyCKzwPN3ZYKdDvN_qZjHAMMWG_jDz0rCyg",
            authDomain: "bfd1-641d7.firebaseapp.com",
            databaseURL: "https://bfd1-641d7.firebaseio.com",
            projectId: "bfd1-641d7",
            storageBucket: "",
            messagingSenderId: "963166752196",
            appId: "1:963166752196:web:04bf0910787dc935"
        };
        // Initialize Firebase
        firebase.initializeApp(firebaseConfig);

        var divfff1 = 0;

        <%for (int b = 0; b < Convert.ToInt32(Session["nFrNav"]); b++)
        {%>


                         <%for (int b1 = 0; b1 < Convert.ToInt32(Session["nBuNav" + b]); b1++)


        {%>

                                        <%for (int b2 = 0; b2 < Convert.ToInt32(Session["nSe1Nav[" + b + "," + b1 + "]"]); b2++)
        {%>


                                            var Problem = firebase.database().ref().child('<%=Session["idBuiNav[" + b + "," + b1 + "]"].ToString()%>' + '/' + '<%=Session["idSenNav" + b + "," + b1 + "," + b2].ToString()%>' + '/Problem');
                                            Problem.on('value', snap => {
                                                var proo = snap.val();
                                                var aa1 = proo.slice(9, 10);
                                                //    console.log(proo);
                                                if (proo != "" && aa1 == "ผ") {
                                                    divfff1 = divfff1 + 1;
                                                    var Recommend = firebase.database().ref().child('<%=Session["idBuiNav[" + b + "," + b1 + "]"].ToString()%>' + '/' + '<%=Session["idSenNav" + b + "," + b1 + "," + b2].ToString()%>' + '/Recommend');

                                                    Recommend.on('value', snap => {
                                                        var rr = snap.val();
                                                        console.log(rr + "111");
                                                        if (rr != "") {
                                                            console.log(rr);
                                                            divfff1 = divfff1 + 1;
                                                        }
                                                        home(divfff1);
                                                    });


                                                }
                                                
                                                home(divfff1);

                                                
                                            });



                                        <%}%>


                        <%}%>
        <%}%>

        

        function home(dd1) {

        
        var x2 = '<%= Session["ID_Login"].ToString() %>';
        var idl = x2.slice(0, -4);
        if (dd1 != 0) {
            var Home = '<div class="row  slideanim">' +
                '<div class="col-sm-4 text-center">' +
                '   <img src="/Pic/farm.png" alt="Lights" style="width: 43%">' +

                ' <br/><p>ฟาร์มเป็นหน้าที่จะเริ่มต้นในการเลี้ยงไก่<br/>จะทำให้การเลี้ยงไก่มีคุณภาพมากยิ่งขึ้น</p> <a href="Farm.aspx" type="button" class="btn btn1 btn-warning"><div class="tx1">ฟาร์ม</div></a>' +
                ' </br>' +
                ' </br>' +
                '</div>' +
                //'   <div class="col-sm-6 text-center">' +
                //'      <img src="/Pic/p2.png" alt="Lights" style="width: 70%">' +
                //' </br>' +
                //'        <a href="Building.aspx" type="button" class="btn btn-danger btn-block">โรงเรือน</a>' +
                //'   </div>' +
                
                //' </div>' +
                //'<div class="row">' +
                '   <div class="col-sm-4 text-center">' +
                '      <img src="/Pic/Bell1.png" alt="Lights" style="width: 43%"></br>' +
                '<p>แจ้งเตือนแบบเรียวทาม จะสามารถบอก<br/>กระบวนการเลี้ยงได้อย่างทันเวลา</p>     <a href="Problem_recommend.aspx" type="button" class="btn btn2 btn-warning"><span class="sr-only" >(current)</span><div class="tx1">แจ้งเตือน</div></a><span class="badge bb1 badge-danger">' + dd1 + '</span>' +
                ' </br>' +
                ' </br>' +
                '</div>' +
                '<div class="col-sm-4 text-center">' +
                '   <img src="/Pic/report.png" alt="Lights" style="width: 43%"></br>' +
                '<p>รายงานผลการเลี้ยง จะสามารถรายงานผลการเลี้ยง<br/>ในแต่ละวันและยังสามารถดูย้อนหลังได้</p>  <a href="Report.aspx" type="button" class="btn btn3 btn-warning"><div class="tx1">รายงาน</div></a>' +
                ' </br>' +
                ' </br>' +
                '</div>' +
                ' </div>';



        } else {

            var Home = '<div class="row  slideanim">' +
                '<div class="col-sm-4 text-center">' +
                '   <img src="/Pic/farm.png" alt="Lights" style="width: 43%">' +

                ' <br/><p>ฟาร์มเป็นหน้าที่จะเริ่มต้นในการเลี้ยงไก่<br/>จะทำให้การเลี้ยงไก่มีคุณภาพมากยิ่งขึ้น</p> <a href="Farm.aspx" type="button" class="btn btn1 btn-warning"><div class="tx1">ฟาร์ม</div></a>' +
                ' </br>' +
                ' </br>' +
                '</div>' +
                //'   <div class="col-sm-6 text-center">' +
                //'      <img src="/Pic/p2.png" alt="Lights" style="width: 70%">' +
                //' </br>' +
                //'        <a href="Building.aspx" type="button" class="btn btn-danger btn-block">โรงเรือน</a>' +
                //'   </div>' +

                //' </div>' +
                //'<div class="row">' +
                '   <div class="col-sm-4 text-center">' +
                '      <img src="/Pic/Bell1.png" alt="Lights" style="width: 43%"></br>' +
                '<p>แจ้งเตือนแบบเรียวทาม จะสามารถบอก<br/>กระบวนการเลี้ยงได้อย่างทันเวลา</p><a href="Problem_recommend.aspx" type="button" class="btn btn2 btn-warning "><div class="tx1">แจ้งเตือน</div></a>' +
                ' </br>' +
                ' </br>' +
                '</div>' +
                '<div class="col-sm-4 text-center">' +
                '   <img src="/Pic/report.png" alt="Lights" style="width: 43%"></br>' +
                '<p>รายงานผลการเลี้ยง จะสามารถรายงานผลการเลี้ยง<br/>ในแต่ละวันและยังสามารถดูย้อนหลังได้</p>  <a href="Report.aspx" type="button" class="btn btn3 btn-warning"><div class="tx1">รายงาน</div></a>' +
                ' </br>' +
                ' </br>' +
                '</div>' +
                ' </div>';

        }
        document.getElementById("Home").innerHTML = Home;
        }
    </script>
</asp:Content>
