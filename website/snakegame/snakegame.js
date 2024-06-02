var FPS = 77;
const locked = 2;
const SPEED = 600;
const DELAY = 125;
const SNAKESIZE = 30;

var body = document.body;
var x = 0;
var y = 0;
var cooldown = 0
var i = 0;
var count = 35;
var start;
var score = 0;

var movement = [false, false, locked, true];
var canvas = document.getElementById("Canvas");
var ctx = canvas.getContext("2d");
ctx.fillStyle = "black";
var SnakeLen = [];

var FoodRad = 20;
let FoodX = Math.floor(Math.random() * canvas.width);
let FoodY = Math.floor(Math.random() * canvas.height);
  
body.addEventListener("keydown", function(event) {
    if (event.key === "d" && movement[3]!=locked && performance.now() > cooldown){
        movement = [false, false, locked, true];
        cooldown = performance.now()+DELAY;
    }
    if (event.key === "a" && movement[2]!=locked && performance.now() > cooldown) {
        movement = [false, false, true, locked];
        cooldown = performance.now()+DELAY;
    }
    if (event.key === "w" && movement[0]!=locked && performance.now() > cooldown) {
        movement = [true, locked, false, false];
        cooldown = performance.now()+DELAY;
    }
    if (event.key === "s" && movement[1]!=locked && performance.now() > cooldown) {
        movement = [locked, true, false, false];
        cooldown = performance.now()+DELAY;
    }
});

setInterval(Update,1000/FPS);
let running = true;
function Update(){
    if (running){
        const element = document.getElementById('score');
        element.innerHTML = 'Score: ' + score;

        ctx.clearRect(0, 0, canvas.width, canvas.height);
        if (movement[3] === true){
            ctx.fillRect(x, y, SNAKESIZE, SNAKESIZE);
            x+=SPEED/FPS;
        }
        if (movement[2] === true){
            ctx.fillRect(x, y, SNAKESIZE, SNAKESIZE);
            x-=SPEED/FPS;
        }
        if (movement[0] === true){
            ctx.fillRect(x, y, SNAKESIZE, SNAKESIZE);
            y-=SPEED/FPS;
        }
        if (movement[1] === true){
            ctx.fillRect(x, y, SNAKESIZE, SNAKESIZE);
            y+=SPEED/FPS;
        }

        ctx.beginPath();
        ctx.arc(FoodX, FoodY, FoodRad, 0, 2 * Math.PI);
        ctx.fill();

        if(x<-SNAKESIZE || x>canvas.width || y<-SNAKESIZE || y>canvas.height){
            running = false;
        }

        if(x+SNAKESIZE>FoodX-FoodRad && x-SNAKESIZE<FoodX+FoodRad && y+SNAKESIZE>FoodY-FoodRad && y-SNAKESIZE<FoodY+FoodRad){
            FoodX = Math.floor(Math.random() * canvas.width);
            FoodY = Math.floor(Math.random() * canvas.height);
            count+=8;
            score++;
        }
        SnakeLen[0] = x;
        SnakeLen[1] = y;
        if(i < FPS/2){
            SnakeLen[i] = x;
            SnakeLen[i+1] = y;
            i+=2;
        }
        else{ 
            ctx.fillRect(SnakeLen[10], SnakeLen[11], SNAKESIZE, SNAKESIZE);
            ctx.fillRect(SnakeLen[18], SnakeLen[19], SNAKESIZE, SNAKESIZE);
            ctx.fillRect(SnakeLen[26], SnakeLen[27], SNAKESIZE, SNAKESIZE);
            SnakeLen[0] = x;
            SnakeLen[1] = y;
            for (var j=count; j>2; j-=2){
                SnakeLen[j] = SnakeLen[j-2];
                SnakeLen[j-1] = SnakeLen[j-3];
            }
        }
        for(start = 36; start < count; start+=8){
            ctx.fillRect(SnakeLen[start], SnakeLen[start+1], SNAKESIZE, SNAKESIZE);
            if (x > SnakeLen[start] && y > SnakeLen[start+1] && x < SnakeLen[start]+SNAKESIZE && y < SnakeLen[start+1]+SNAKESIZE){
                running = false;
            }
        }
    }
}