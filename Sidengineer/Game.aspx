<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Game.aspx.cs" Inherits="Game" %>


<html>
<head>
    <title>Sid Game</title>

    <style type="text/css">
        .canvas1 {
        }
    </style>

</head>

<input type="button" id="btn2" value="Start" name="btn2" style="position:absolute;top:x;left:400;font-style:times new roman;cursor:pointer;border-color:black;background-color:black;color:white;" onclick="start();" />
<input type="button" id="btn1" value="Pause" name="btn1" style="position:absolute;top:x;left:450;font-style:times new roman;cursor:pointer;border-color:black;background-color:black;color:white;" onclick="pause();" />



<canvas id="game" width="800px" height="600px" class="canvas1"></canvas>
<img src="sid.jpg" width="50px" style="position:absolute;top:310;left:380" ;></img>


<script type="text/javascript">

    var canvas;
    var canvascontext;
    var ballX = 100;
    var ballY = 100;
    var ballSpeedX = 10;
    var ballSpeedY = 6;
    var frameset = 60;
    var paddely = 100;
    var paddelHeight = 150;
    var tempspeedX;
    var tempspeedY;
    var i = 1;
    var time = 0;
    var timer1;
    var call1;
    var t1 = 30;


    window.onload = function () {
        canvas = document.getElementById("game");
        canvascontext = canvas.getContext("2d");

        setInterval(both, 1000 / frameset);  //1000=1sec
        call1 = setInterval(level2, 1000); //level2();
        //setInterval(find1,100);

        settimer1(); //call timer
        function mouseCount(event) {
            var mouseX = event.clientX;
            var mouseY = event.clientY;

            return {

                x: mouseX,
                y: mouseY

            }


        }



        canvas.addEventListener("pointermove", function (event) {

            //event.preventDefault();
            paddely = mouseCount(event).y - paddelHeight / 2;


        });




    } //close window.onload();



    function find1() {
        //frameset=t1;
        console.log(frameset);
    }


    //both

    function both() {
        moveEvery();
        drawevery();
    }

    //moveEvery
    function moveEvery() {
        ballX = ballX + ballSpeedX;
        ballY = ballY + ballSpeedY;


        if (ballX >= canvas.width) {
            //reset();
            ballSpeedX = -ballSpeedX;
        }

        if (ballX <= 0) {

            if (ballY > paddely && ballY < paddely + paddelHeight) {
                ballSpeedX = -ballSpeedX;
            }
            else {
                ballSpeedX = -ballSpeedX;
                reset();

            }

        }

        if (ballY >= canvas.height) {
            ballSpeedY = -ballSpeedY;
        }

        if (ballY <= 0) {
            ballSpeedY = -ballSpeedY;
        }





    }



    //drawevery
    function drawevery() {
        //Back-ground
        canvascontext.fillStyle = "black";
        canvascontext.fillRect(0, 0, 800, 600);
        canvascontext.fillStyle = "white";
        canvascontext.figcaption = "sid";
        //Left Paddle
        canvascontext.fillRect(2, paddely, 10, paddelHeight);
        //Right Paddle
        canvascontext.fillRect(788, ballY - 50, 10, 150);
        //Ball
        canvascontext.fillRect(ballX, ballY, 10, 10);

        canvascontext.font = "20px times new roman";
        canvascontext.fillText("SID GAME", 350, 290);

    }



    //..................reset................................................../

    function reset() {



        if (i == 3) {
            //canvas=document.getElementById("game");
            //canvascontext=canvas.getContext("2d");
            //canvascontext.fillStyle="red";
            //canvascontext.fillRect(ballX,ballY,10,10);
            alert("U r game is over");
            i = 1;
            pause();
            //reset();
        }

        else {
            ballX = 100;
            ballY = 100;
            //canvascontext.fillStyle="red";

            //alert("U r"+ i+" chance is over");
            i++;
        }

    }


    //pause

    function pause() {
        canvas = document.getElementById("game");
        tempspeedX = ballSpeedX;
        tempspeedY = ballSpeedY;
        ballSpeedX = 0;
        ballSpeedY = 0;
        stoptimer1(); //call for pause timer

    }

    //start

    function start() {
        if (ballSpeedX == 0 && ballSpeedY == 0) {
            ballSpeedX = tempspeedX;
            ballSpeedY = tempspeedY;
            settimer1();
        }
    }

    //set timer

    function settimer1() {
        time = parseInt(time) + 1;
        timer1 = setTimeout(settimer1, 1000);
        console.log(time);
    }

    //stoptimer
    function stoptimer1() {
        clearTimeout(timer1);
    }

    //level 2
    function level2() {
        if (time == 60) {
            if (i < 3) {
                frameset = frameset + 10;
                alert("level2 is start");
                window.onload();
                clearInterval(call1);
            }


        }
    }





</script>




</html>