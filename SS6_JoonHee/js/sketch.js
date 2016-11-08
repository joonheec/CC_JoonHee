var img;
var a = 200;
var value = 50;
var message = "Hello";
var loop = true;
function lowerAlpha(){
  //slowly lowers the alpha value of fill 
  a-=10;
  if(a<20){
      a=200;
  }
}
function preload(){
  	img = loadImage('../img/orange.png');
}
function setup() {
  imageMode(CENTER);
  img.loadPixels();
	createCanvas(500,500);
	noStroke();
	 ellipseMode(CENTER);
	 for(var i=1000; i>0; i-= 25){
	    if(i%150 === 0){
	      fill(random(10,255),random(10,255),random(10,255),a);
	    }
	    ellipse(width/2,height/2,i,i);
  }
}

function draw() {
	noStroke();
	if(mouseX <width/2 && mouseY < width/2){
      fill(random(10,255),random(10,255),random(10,255),a);
      for(var i =300; i>0; i-=50){
        if(i%150 === 0){
        fill(random(10,255),random(10,255),random(10,255),a);
        }
        ellipse(width/2,height/2,i,i);
      }
    }
    else if(mouseX> width/2 && mouseY < width/2){
      for(var i =600; i>0; i-=50){
        if(i%150 === 0){
        fill(random(10,255),random(10,255),random(10,255),a);
        }
        ellipse(width/2,height/2,i,i);
      }
    }
    else if(mouseX> width/2 && mouseY> width/2){
      for(var i =1400; i>0; i-=50){
        if(i%150 === 0){
        fill(random(10,255),random(10,255),random(10,255),a);
        }
        ellipse(width/2,height/2,i,i);
      }
    }
    else{
      ellipse(random(0,500),random(0,500), value,value);
      value+=5;
        if(value> 200){
          value = 50;
        }
    }
}
function mouseDragged(){
	lowerAlpha();
  // a-=10;
  // if(a<20){
  //     a=200;
  // }
}
function mousePressed(){
	image(img, width/2, height/2, 600, 600);
}
