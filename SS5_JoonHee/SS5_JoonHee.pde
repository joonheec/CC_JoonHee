//Music Player
//SS5 - Joon Hee Choi
//Press 1-3 to play the song or click the song
// Press 4 twice to restart all tracks, press it once to pause the current track.
PImage image;
PImage image2;
PImage image3;

import ddf.minim.*;11
Minim minim;
AudioPlayer player1;
AudioPlayer player2;
AudioPlayer player3;
String state="player";
void setup() {
  size(1000, 1000);
  background(0);
  fill(255);
  minim=new Minim(this);
  image=loadImage("boombox.jpg");
  image2=loadImage("slander.jpg");
  image3=loadImage("kanye.jpg");
  player1 = minim.loadFile("boombox.mp3");
  player2 = minim.loadFile("slander.mp3");
  player3 = minim.loadFile("kanye-ookay-remix.mp3");
}

void draw() {
  //landing page
  if (state=="player") {
    image(image, 0, 0);
    image(image2, 0, 500);
    image(image3, 500, 0);
    textAlign(CENTER);
    text("1", 250,250);
    text("2", 250,750);
    text("3", 750,250);
    text("4 - Pause/Restart", 750,750);
  }
  //song selection
  if (state=="boombox"){
      player1.play();
      player2.pause();
      player3.pause();
  }
  if (state=="slander"){
      player2.play();
      player1.pause();
      player3.pause();
  }
  if (state=="ookay"){
      player3.play();
      player1.pause();
      player2.pause();

  }
  if (state=="pause"){
      
      player1.pause();
      player2.pause();
      player3.pause();
  }
  
}
void mousePressed() {
    if (mouseX > 0 && mouseX < 500 && mouseY > 0 && mouseY< 500) {
       state="boombox";
    }
    if (mouseX > 0 && mouseX <500 && mouseY > 500 && mouseY < 1000) {
       state="slander";
    }
    if (mouseX > 500 && mouseX < 1000 && mouseY > 0 && mouseY < 1000) {
       state="ookay";
    }
    if (mouseX > 500 && mouseX < 1000 && mouseY > 500 && mouseY < 500) {
       state="pause";
    } 
}

void keyPressed(){
    if(key == '1'){
      state = "boombox";
    }
    if(key == '2'){
      state = "slander";
    }
    if(key == '3'){
      state = "ookay";
    }
    
    if (key == '4') {
    state="pause";
  }
  //press 4 twice to restart
  if (state == "pause" && key == '4'){
    state = "pause";
    player1.rewind();
    player2.rewind();
    player3.rewind();
  }
    
}