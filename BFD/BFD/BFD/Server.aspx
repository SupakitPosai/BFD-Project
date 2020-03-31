<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Server.aspx.cs" Inherits="BFD.Server" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BFD Server</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="https://www.gstatic.com/firebasejs/5.9.3/firebase.js"></script>
    <script src="scripts/jquery-1.3.2.min.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>เซิฟเวอร์บันทึกข้อมูล</h1>
        </div>
    </form>

    <script type="text/javascript">

        

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

        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


        var ii = "S0001";
        var Age = firebase.database().ref().child('B0001/Age');
        var Value = firebase.database().ref().child('B0001/' + ii + '/Value');
        var Problem = firebase.database().ref().child('B0001/' + ii + '/Problem');
        var DateProblem = firebase.database().ref().child('B0001/' + ii + '/DateProblem');
        var Solution = firebase.database().ref().child('B0001/' + ii + '/Solution');
        var Recommend = firebase.database().ref().child('B0001/' + ii + '/Recommend');
        var DateRecom = firebase.database().ref().child('B0001/' + ii + '/DateRecom');
        var Finish = firebase.database().ref().child('B0001/Finish');
        var Age1 = 0;
        var Vall = 0;
        var proo = "";
        var Date1 = "";
        var solu = "";
        var re = "";
        var datere = 0;
        var finn = "";
        Age.on('value', snap => {
            Age1 = snap.val();
            console.log(Age1);
            if (Age1 != 0) {
                console.log(ii);
                Value.on('value', snap => {


                     Vall = snap.val();
                    Problem.on('value', snap => {


                         proo = snap.val();
                         console.log(proo);
                        DateProblem.on('value', snap => {



                             Date1 = snap.val();
                         
                           
                           
                          
                                Solution.on('value', snap => {

                                     solu = snap.val();
                                    console.log(solu);
                                    Recommend.on('value', snap => {

                                        re = snap.val();
                                        DateRecom.on('value', snap => {
                                            datere = snap.val();
                                            Finish.on('value', snap => {
                                                finn = snap.val();
                                                if (finn != 1) {
                                                    $.ajax({
                                                        type: "POST",
                                                        url: "Server.aspx/S1",
                                                        data: '{age: "' + Age1 + '", data: "' + Vall + '", pro: "' + proo + '", time: "' + Date1 + '" , solu: "' + solu + '", ids: "' + ii + '", re: "' + re + '" , datere: "' + datere + '"}',
                                                        contentType: "application/json; charset=utf-8",
                                                        dataType: "json",
                                                        success: function () {
                                                            //aaaggg = aggee;
                                                            console.log("success");
                                                        },
                                                        failure: function () {
                                                            //console.log(aggee+"!!! F");
                                                        }
                                                    });
                                                }
                                            });
                                           
                                        });
                                        

                                    });
                                   

                                });


                            

                        });

                    });



                });
            }
        });
        
        

       
            
           

                
            
        
        
       
                        

                    

                        


            
       



       

        

        
       
       

    </script>

</body>
</html>
