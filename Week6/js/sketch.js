var r = 100;
var g = 215;
var b = 100;


function setup() {
	createCanvas(500,500);
}

function draw() {
	background(r,g,b);
	ellipse(mouseX, mouseY, 80, 80);
}
function mousePressed(){
	r = random(50);
	g = random(180);
	b = random(200);
}