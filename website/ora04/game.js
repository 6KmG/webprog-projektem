var back = 
{
	x: 0,
	width: 1280,
	height: 689,
	image: new Image()
};
back.image.src = "assets/back.png";

function start()
{
	console.log("start");
}
function update(dTime, fps)
{
	console.log("update", dTime, fps);
}
function render(g)
{
	g.drawImage(back.image, back.x, 0, back.width, back.height);
	//g.drawImage(resource, posX, posY, width, height);
	//g.drawImage(resource, srcX, srcY, srcWidth, srcHeight, posX, posY, width, height);
}

//Events
function keyDown(e)
{
	console.log("keyDown: "+ e);
}
function keyUp(e)
{
	console.log("keyUp")
}
function touchStart(x,y)
{
	console.log("touchStart: ("+ x +","+ y +")");
}
function touchEnd()
{
	console.log("touchEnd");
}