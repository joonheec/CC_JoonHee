
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
PImage tooBig;
PImage potionScene;
PImage teaParty;
PImage wakeUp;
String state = "intro";
PFont fontBig;
PFont fontSmall;
boolean gardenKey = false;
boolean potion = false;
boolean cake = false;
float r=3;
float b=5;
float g=2;
String[] randomRooms = { "room1", "room2", "room3"};
void setup() {
  size(800,800);
  background(0);
  introScreen = loadImage("rabbit-hole.jpg");
  secondScene = loadImage("rabbitchase.jpg");
  hallwayScene = loadImage("hallway.jpg");
  gameOver = loadImage("game-over.jpg");
  cakeRoom = loadImage("eat-me.jpg");
  teaParty = loadImage("teaparty.jpg");
  potionScene = loadImage("potion.jpg");
  tooBig = loadImage("too-big.jpg");
  wakeUp = loadImage("wake-up.jpg");
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
      textFont(fontSmall);
      text("You followed the rabbit down the rabbit hole, and you've ended up in this hallway.",width/2, 130);
      text("W - Random Room", width/2,300);
      text("A - Random Room", width/2,360);
      text("S - Random Room", width/2,420);
      text("D - Tiny Door", width/2,480);
      if(!gardenKey){
        text("E - Pick up Key", 550,700);
      } else{
        text("You have the Key", 550,700);
      }
      break;
    case "gameOver":
      println("Game Over Scene");
      image(gameOver,0,0);
      fill(0);
      text("Game Over", width/2, height/2);
      text("Click to Restart", width/2, 500);
      break;
    case "room1":
      println("Cake Room");
      image(cakeRoom,0,0);
      text("You stumble into a room with a cake.", width/2, height/2);
      if(!cake){
          text("E - To eat the cake", width/2, 500);
          text("R - Back to the hallway", width/2, 600);
          break;
        }
        else{
          text("R - Back to the hallway", width/2, 500);
          break;
        }
     case "room2":
      image(potionScene,0,0);
      fill(255);
      text("There's a bottle that says 'Drink Me'", width/2, height/2);
      if(potion == false){
        fill(255);
        text("E - Drink potion",width/2, 500);
        fill(255);
      }
      else{
        text("R - Back to the hallway", width/2, 500);
      }
      
      break;
     case "room3":
      image(teaParty,0,0);
      text("You arrive at the March Hare's House, and are treated to a Mad Tea Party.", width/2, 200);
      text("The attendants are way too arguementative for your taste.", width/2, 300);
      text("R - Leave the tea party",width/2,400);
      break;
     case "gardenScene":
      image(wakeUp,0,0);
      fill(255);
      textFont(fontSmall);
      text("You open the door to the garden only to wake up to the very same garden you were in", width/2, 200);
      text("Everything turned out to be a dream.",width/2, 300);
      textFont(fontBig);
      text("R - Dream again?", width/2, height/2);
      break;
      
     case "fatScene": 
       image(tooBig,0,0);
       fill(255);
       text("The potion made you too big to fit through the door!", width/2, 300);
       text("E - Back to the hallway", width/2, 500);
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
    state = "gameOver";
  }
  if (state == "rabbitScene" && (key == 'd')){
    state = "hallwayScene";
  }
  if (state == "hallwayScene" && (key == 'w')){
    int index = int(random(randomRooms.length));
    state = randomRooms[index];
  }
  if (state == "hallwayScene" && (key == 'a')){
    int index = int(random(randomRooms.length));
    state = randomRooms[index];
  }
  if (state == "hallwayScene" && (key == 's')){
    int index = int(random(randomRooms.length));
    state = randomRooms[index];
  }
  if (state == "hallwayScene" && (key == 'd') && (gardenKey == true)){
    if (cake == true){
      state = "gardenScene";
    }
    else{
      state = "fatScene";
    }
  }
  if (state == "fatScene" && (key == 'e')){
    state = "hallwayScene";
  }
  if (state == "hallwayScene" && (key == 'e')){
    state = "key";
  }
  if ((state == "room1") && (key == 'e')){
    cake = true;
    potion = false;
    state = "hallwayScene"; 
  }
  if((state == "room1") && (key == 'r')){
    state = "hallwayScene";
  }
  if ((state == "room2") && (key == 'e')){
    potion = true;
    cake = false;
    fill(255);
    state = "hallwayScene";
  }
  if (state == "key" && (key == 'e')){
    gardenKey = true;
    state = "hallwayScene";
  }
  if (state == "room3" && (key == 'r')){
    state = "hallwayScene";
  }
  if (state == "gardenScene" && (key == 'r')){
    cake = false;
    gardenKey = false;
    potion = false;
    state = "intro";

  }
}