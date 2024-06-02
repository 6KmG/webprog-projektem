window.onload = function()
{
	width = 1280;
	height = 800;

	document.body.style.margin = 0;
	document.body.style.padding = 0;

	canvas = document.getElementById("canvas");
	canvas.width = width;
	canvas.height = height;
	canvas.style.position ="absolue";
	canvas.style.left ="0";
	canvas.style.top ="0";
	canvas.style.width ="100%";
	canvas.style.height = "100%";
	canvas.style.background = "#000";

	canvas.addEventListener('mousedown', function(event)
	{ 
		touchStart(event.pageX, event.pageY); 
	});
	canvas.addEventListener('touchstart', function(event)
	{ 
		touchStart(event.touches[0].pageX, event.touches[0].pageY );
	});
	canvas.addEventListener('mouseup', function(event)
	{ 
		touchEnd(); 
	});
	canvas.addEventListener('touchend', function(event)
	{ 
		touchEnd(); 
	});
	document.addEventListener('keyup', function(event) 
	{ 
		keyUp(event.keyCode); 
		keyDownList[event.keyCode] = false;
	});
	document.addEventListener('keydown', function(event) 
	{ 
		if(!(event.keyCode in keyDownList) || !keyDownList[event.keyCode]) 
		{
			keyDownList[event.keyCode] = true;
			keyDown(event.keyCode);
		}
	});
	var keyDownList = [];

	var ctx = canvas.getContext("2d");
	var deltaTime;
	var mainFps;
	var touched;

	function loop(time)
	{
		if(prevT == 0) prevT = time;
		deltaTime = time - prevT;
		prevT = time;
		
		if(mainFps)
		{
			update(deltaTime / 1000, mainFps);
			ctx.clearRect(0, 0, width, height);
			render(ctx);
		}
		if(time >= lastFpsTime + 1000)
		{
			mainFps = frameCount;
			lastFpsTime = time;
			frameCount = 0;
		}
		else frameCount++;
		
		window.requestAnimationFrame(loop);
	}
	start();
	
	//setInterval(function(){ loop(new Date().getTime()); }, 1000/60);
	loop();
}

var prevT = 0;
var lastFpsTime = 0;
var frameCount = 0;

var width, height;
var canvas;