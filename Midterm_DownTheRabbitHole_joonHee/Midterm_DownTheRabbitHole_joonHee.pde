//Joon Hee Choi
//Down the Rabbit Hole
PImage introScreen;
PImage secondScene;
PImage rabbitHole;
PImage hallwayScene;
PImage gameOver;
PImage cakeRoom;
PImage tooBig;
PImage potionScene;
PImage teaParty;
PImage wakeUp;
PImage lockedDoor;
PImage deadEndDoor;
PImage tooSmall;
PImage hugeAlice;
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
  
  introScreen = loadImage("intro-screen.jpg");//https://s-media-cache-ak0.pinimg.com/originals/a0/76/dd/a076dde3ebce8c4a35cfae702b59e120.jpg
  secondScene = loadImage("second-scene.jpg");//http://2.bp.blogspot.com/-4sIUdebRoBs/U2fOL9dr3fI/AAAAAAAADJ4/CmrVnh0vc7g/s1600/Alice+in+Wonderland+1951+Disney+The+White+Rabbit+and+the+rabbit+hole.png
  rabbitHole = loadImage("rabbit-hole.jpg");//http://65.media.tumblr.com/a4e060a1f80516e64e783eb8caebc753/tumblr_n10e511G601qh78g0o1_500.jpg
  hallwayScene = loadImage("hallway.jpg");//
  deadEndDoor = loadImage("dead-end-door.jpg");//http://vignette3.wikia.nocookie.net/disney/images/a/aa/Alice-in-wonderland-disneyscreencaps.com-8568.jpg/revision/latest?cb=20140604210419
  lockedDoor = loadImage("alice-locked-door.jpg");//https://bplusmovieblog.files.wordpress.com/2012/09/alice-in-wonderland-30.png?w=590&h=368
  gameOver = loadImage("game-over.jpg");//http://67.media.tumblr.com/b2694848f85f29673a10356f7d20fe40/tumblr_mwygka4nd81s15sdeo1_500.jpg
  cakeRoom = loadImage("eat-me.jpg");//https://s-media-cache-ak0.pinimg.com/564x/92/90/97/92909780c538ae284e1988d392808f0a.jpg
  teaParty = loadImage("teaparty.jpg");//https://i.ytimg.com/vi/Qn55Mcufb7Y/maxresdefault.jpg
  potionScene = loadImage("potion.jpg");//https://i.ytimg.com/vi/di7dZwidXZU/maxresdefault.jpg
  tooBig = loadImage("too-big.jpg");//https://s-media-cache-ak0.pinimg.com/originals/e2/94/9c/e2949c95c20860ae0b466cb9e460a9c5.jpg
  wakeUp = loadImage("wake-up.jpg");//http://images6.fanpop.com/image/photos/35900000/Alice-in-Wonderland-1951-random-35957945-1424-1080.jpg
  tooSmall = loadImage ("tiny-alice.jpg"); //http://cdn5.movieclips.com/disney/a/alice-in-wonderland-1951/0026949_23333_MC_Tx360.jpg
  hugeAlice = loadImage ("huge-alice.jpg");//http://vignette1.wikia.nocookie.net/sspmes/images/b/b7/Alice_feeling_curious_when.jpg/revision/latest?cb=20150213130854
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
      text("Z - Leave the rabbit alone", 550,200);
      text("M - Follow the rabbit", 525, 260);
      break;  
    case "rabbitHole" : 
      println("Rabbit Hole Scene");
      image(rabbitHole,0,0);
      
      break;
    case "hallwayScene":
      println("Hallway Scene");
      background(0);
      textFont(fontSmall);
      textAlign(CENTER);
      text("You followed the rabbit down the rabbit hole, and you've ended up in this hallway.",100, 100,600,300);
      text("Press a number to enter the door. ",100, 350,600,300);
      fill(250,0,0);
      rectMode(CORNER);
      rect(0,550,150, 250);
      fill(0,250,0);
      rect(200,550,150, 250);
      fill(0,0,250);
      rect(400,550,150, 250);
      fill(255);
      rect(725,675,75, 125);
      fill (255,255,0);
      ellipse(20,700,20,20);
      ellipse(220,700,20,20);
      ellipse(420,700,20,20);
      ellipse(745,745,20,20);
      fill(238,232,170);
      text("1", 62.5,670);
      text("2", 262.5,670);
      text("3", 462.5,670);
      fill(0);
      text("4", 765,745);
      fill(255);
      if(!gardenKey){
        
        text("CTRL - PICK UP KEY", 400,275);
      } else{
        text("You have the Key", 400,275);
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
      text("You stumble into a room with a cake.", width/2, 250);
      if(!cake){
          text("CTRL - To Eat The Cake", width/2, 300);
          text("Z - Back to the hallway", width/2, 350);
          break;
        }
        else{
          text("Z - Back to the hallway", width/2, 350);
          break;
        }
     case "lockedGarden" :
       println("Locked Garden");
       image(lockedDoor,0,0);
       text("You came across a series of doors.  ",width/2, 100,600,300);
       text("Press M to start opening them out of curiosity...",width/2, 100,600,300);

       break;
     case "deadEnd" : 
       println("No Key");
       image (deadEndDoor,0,0);
       text("You end up at a door that's too small for you to fit through. The Doorknob won't let you in without a key.",width/2, 100,600,300);
       text("Press Z to go back to the hallway.",width/2, 200,600,300);
       break;
     case "room2":
      image(potionScene,0,0);
      fill(255);
      text("You enter a room with a table and a bottle. The bottle says 'Drink Me'. ",100, 150,600,300);;
      if(potion == false){
        fill(255);
        text("CTRL - Drink Potion",width/2, 250);
        text("Z - Back to the hallway", width/2, 300);
        fill(255);
      }
      else{
        text("Z - Back to the hallway", width/2, 250);
      }
      
      break;
     case "room3":
      image(teaParty,0,0);
      text("You arrive at the March Hare's House, and are treated to a Mad Tea Party.", width/2, 50);
      text("The attendants are way too arguementative for your taste.", width/2, 200);
      text("Z - Leave the tea party",width/2,300);
      break;
     case "gardenScene":
      image(wakeUp,0,0);
      fill(255);
      textFont(fontSmall);
      text("You open the door to the garden only to wake up to the very same garden you were in", width/2, 200);
      text("Everything turned out to be a dream.",width/2, 300);
      textFont(fontBig);
      text("Z - Dream again?", width/2, height/2);
      break;
      
     case "fatScene": 
       image(tooBig,0,0);
       fill(255);
       text("The cake made you too big to fit through the door!", width/2, 300);
       text("Z - Back to the hallway", width/2, 500);
       break;
     case "smallScene" :
       image(tooSmall, 0, 0);
       text("You drank the potion. The potion shrunk your size! ",100, 250,600,300);
       text("Z - Back to the hallway. ",100, 280,600,300);
       break;
     case "hugeAliceScene":
       image(hugeAlice,0,0);
       text("You ate the cake. The cake increased your size! ",100, 250,600,300);
       text("Z - Back to the hallway. ",100, 280,600,300);
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
  if (state == "rabbitScene" && (key == 'z')){
    state = "gameOver1";
  }
  if (state == "rabbitScene" && (key == 'm')){
    state = "hallwayScene";
  }
  if (state == "hallwayScene" && (key == '1')){
    int index = int(random(randomRooms.length));
    state = randomRooms[index];
  }
  if (state == "hallwayScene" && (key == '2')){
    int index = int(random(randomRooms.length));
    state = randomRooms[index];
  }
  if (state == "hallwayScene" && (key == '3')){
    int index = int(random(randomRooms.length));
    state = randomRooms[index];
  }
  if(state == "hallwayScene" && (key == '4') && (gardenKey == false)){
    state = "lockedGarden";
  }
  if (state == "lockedGarden"&& (key == 'm')){
    state = "deadEnd";
  }
  if (state == "deadEnd" && (key == 'z')){
    state = "hallwayScene";
  }
  if (state == "hallwayScene" && (key == '4') && (gardenKey == true)){
    if (potion == true){
      state = "gardenScene";
    }
    else if (cake == true){
      state = "fatScene";
    }
  }
  if (state == "fatScene" && (key == 'z')){
    state = "hallwayScene";
  }
  if (state == "hallwayScene" && (keyCode == CONTROL)){
    state = "key";
  }
  if ((state == "room1") && (keyCode == CONTROL)){
    cake = true;
    potion = false;
    state = "hugeAliceScene"; 
  }
  if (state == "hugeAliceScene" && (key == 'z')){
    state = "hallwayScene";
  }
  if((state == "room1") && (key == 'z')){
    state = "hallwayScene";
  }
  if ((state == "room2") && (keyCode == CONTROL)){
    potion = true;
    cake = false;
    fill(255);
    state = "smallScene";
  }
  if((state == "smallScene") && (key == 'z')){
    state = "hallwayScene";
  }
  if (state == "key" && (keyCode == CONTROL)){
    gardenKey = true;
    state = "hallwayScene";
  }
  if((state == "room2") && (key == 'z')){
    state = "hallwayScene";
  }
  if (state == "room3" && (key == 'z')){
    state = "hallwayScene";
  }
  if (state == "gardenScene" && (key == 'z')){
    cake = false;
    gardenKey = false;
    potion = false;
    state = "intro";

  }
}