void rect1(){
  strokeWeight(5);
  fill(255);
  rect(0,0,100, 250);
}
void rect2(){
  strokeWeight(5);
  fill(255);
  rect(0,200,100,250);
}
void rect3(){
  strokeWeight(5);
  fill(17,21,71);
  rect(0,400,100,100);
}
void rect4(){
  strokeWeight(5);
  fill(103,12,12);
  rect(100,0,400,400);
}
void rect5(){
  strokeWeight(5);
  fill(255);
  rect(100,400,375,100);
}
void rect6(){
  strokeWeight(5);
  rect(475,400,25,50);
}
void rect7(){
  strokeWeight(5);
  fill(192,155,38);
  rect(475,450,25,50);
}
void drawBackground(){
  rect1();
  rect2();
  rect3();
  rect4();
  rect5();
  rect6();
  rect7();
}
void setup(){
  size(500,500);
  drawBackground();
}

void draw(){
  
}
void keyPressed(){
  drawBackground();
}

void mousePressed(){
  fill(random(10,255),random(10,255),random(10,255));
  rect(mouseX,mouseY, random(25,300), random(25,300));
}