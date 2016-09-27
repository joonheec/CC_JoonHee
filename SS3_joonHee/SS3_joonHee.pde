// Joon Hee Choi
// Mad Circles
// Mouse over the different quadrants of the image!
// Drag the mouse to change the alpha value of the circles!
// Click to clear!
float a = 200;
float value = 100;
boolean loop = true; 
void setup(){
  size(1000,1000);
  noStroke();
  ellipseMode(CENTER);
  for(int i=2000; i>0; i-= 50){
    if(i%150 == 0){
      fill(random(10,255),random(10,255),random(10,255),a);
    }
    ellipse(width/2,height/2,i,i);
  }
}

void draw(){
  noStroke();

    if(mouseX <width/2 && mouseY < width/2){
      fill(random(10,255),random(10,255),random(10,255),a);
      for(int i =300; i>0; i-=50){
        if(i%150 == 0){
        fill(random(10,255),random(10,255),random(10,255),a);
        }
        ellipse(width/2,height/2,i,i);
      }
    }
    else if(mouseX> width/2 && mouseY < width/2){
      for(int i =600; i>0; i-=50){
        if(i%150 == 0){
        fill(random(10,255),random(10,255),random(10,255),a);
        }
        ellipse(width/2,height/2,i,i);
      }
    }
    else if(mouseX> width/2 && mouseY> width/2){
      for(int i =1400; i>0; i-=50){
        if(i%150 == 0){
        fill(random(10,255),random(10,255),random(10,255),a);
        }
        ellipse(width/2,height/2,i,i);
      }
    }
    else{
      ellipse(random(0,1000),random(0,1000), value,value);
      value+=10;
        if(value> 200){
          value = 100;
        }
    }
   //if(mouseX<100 && mouseY<100){
   //  noLoop();
   //}
}

void mouseDragged(){
  a-=5;
  if(a<2){
    a=200;
  }
}

void mouseClicked(){
  for(int i=2000; i>0; i-= 50){
    if(i%150 == 0){
      fill(random(10,255),random(10,255),random(10,255),a);
    }
    ellipse(width/2,height/2,i,i);
  }
}