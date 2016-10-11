
//class Timer {
 
//  int savedTime; // When Timer started
//  int totalTime; // How long Timer should last
  
//  Timer(int tempTotalTime) {
//    totalTime = tempTotalTime;
//  }
  
//  // Starting the timer
//  void start() {
//    // When the timer starts it stores the current time in milliseconds.
//    savedTime = millis(); 
//  }
  
//  // The function isFinished() returns true if 5,000 ms have passed. 
//  // The work of the timer is farmed out to this method.
//  boolean isFinished() { 
//    // Check how much time has passed
//    int passedTime = millis()- savedTime;
//    if (passedTime > totalTime) {
//      return true;
//    } else {
//      return false;
//    }
//   }
   
// }
 
//Timer timer;
PImage introScreen;
PImage secondScene;
PImage hallwayScene;
PImage gameOver;
PImage cakeRoom;
String state = "intro";
PFont fontBig;
PFont fontSmall;
boolean gardenKey = false;
void setup() {
  size(800,800);
  background(0);
  introScreen = loadImage("rabbit-hole.jpg");
  secondScene = loadImage("rabbitchase.jpg");
  hallwayScene = loadImage("hallway.jpg");
  gameOver = loadImage("game-over.jpg");
  cakeRoom = loadImage("eat-me.jpg");
  fontBig = createFont("LobsterTwo-Regular.otf", 30);
  fontSmall = createFont("LobsterTwo-Regular.otf", 24);
  //timer = new Timer(10000);
  //timer.start();
}

void draw() {
  //textSize(32);
  //text(timer.totalTime-millis(), 10, 30); 
  //background
  //if (timer.isFinished()) {
  //  background(random(255));
  //  timer.start();
  //}
  switch(state){
    case "intro":
      println("State: Intro");
      image(introScreen,0,0);
      textAlign(CENTER);
      fill(0);
      textFont(fontBig);
      text("Down the Rabbit Hole", width/2, 150);
      textFont(fontSmall);
      if (mouseY >= 190 && mouseY <= 210 && mouseX >= 250 && mouseX <= 550){
        fill(255);
      }
      text("click here to start the game", width/2, 200);
      break;
    case "rabbitScene":
      println("State: Rabbit Scene");
      image(secondScene,0,0);
      fill(255);
      textFont(fontBig);
      text("Alice is sitting outdoors when she sees a rabbit with a pocket watch.", width/2,100);
      text("W - Leave the rabbit alone", 550,200);
      text("D - Follow the rabbit", 525, 260);
      break;  
    case "hallwayScene":
      println("Hallway Scene");
      image(hallwayScene,0,0);
      text("W - Random Room", 550,200);
      text("A - Random Room", 550,260);
      text("S - Random Room", 550,320);
      text("D - Tiny Door", 530,380);
      if(!gardenKey){
        text("E - Pick up Key", 550,700);
      } else{
        text("You have the Key", 550,700);
      }
      break;
    case "gameOver1":
      println("Game Over Scene");
      image(gameOver,0,0);
      background(255,0,0);
      text("Game Over", width/2, height/2);
      text("Click to Restart", width/2, 500);
      break;
    case "room1":
      println("Cake Room");
      image(cakeRoom,0,0);
      text("Room 1", width/2, height/2);
      break;
     case "room2":
      background(0);
      text("Room 2", width/2, height/2);
      break;
     case "room3":
      background(0);
      text("Room 3", width/2, height/2);
      break;
     case "gardenScene":
      background(0);
      text("Garden", width/2, height/2);
      break;
  }

} 

void mousePressed(){
  if(state=="intro"){
    if (mouseY >= 190 && mouseY <= 210 && mouseX >= 250 && mouseX <= 550){
        state = "rabbitScene";
      }
  }
  if(state == "gameOver1"){
    state = "intro";
  }
}
void keyPressed(){
  if (state == "rabbitScene" && (key == 'w')){
    state = "gameOver1";
  }
  if (state == "rabbitScene" && (key == 'd')){
    state = "hallwayScene";
  }
  if (state == "hallwayScene" && (key == 'w')){
    state = "room1";
  }
  if (state == "hallwayScene" && (key == 'a')){
    state = "room2";
  }
  if (state == "hallwayScene" && (key == 's')){
    state = "room3";
  }
  if (state == "hallwayScene" && (key == 'd') && gardenKey == true){
    state = "gardenScene";
  }
  if (state == "hallwayScene" && (key == 'e')){
    state = "key";
  }
  if (state == "room1" && (key == 'e')){
    state = "hallwayScene";
  }
  if (state == "key" && (key == 'e')){
    state = "hallwayScene";
    gardenKey = true;
  }
}