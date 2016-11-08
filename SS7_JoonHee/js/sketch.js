var song1_image;
var song1;
var song2;
var song2_image;
var song3;
var song3_image;
var volumeSlider;
var volumeValue;
var speed;  
var state = 'aurora';
var canvas;
var button;
function preload(){
  song1 = loadSound("../mp3/aurora.mp3");
  song1_image = loadImage("../img/aurora.jpg");
  song2 = loadSound("../mp3/frontlines.mp3");
  song2_image = loadImage("../img/front-lines.jpg");
  song3 = loadSound("../mp3/kanye-ookay-remix.mp3");
  song3_image = loadImage("../img/kanye.jpg");
}
function setup() {
  canvas = createCanvas(500,600);
  imageMode(CENTER);
  song1_image.loadPixels();
  song2_image.loadPixels();
  song3_image.loadPixels();
  song1.play();
  song2.pause();
  song3.pause();
  volumeSlider = createSlider(0,2000,1000);
  volumeSlider.position(460, 560);
  button = createButton('>>');
  button.position(700, 560);
  button.mousePressed(nextSong);
  
}

function draw() {
  speed = volumeSlider.value()/1000;
  speed = constrain(speed,0,2);
  song1.rate(speed);
  song2.rate(speed);
  song3.rate(speed);
  fill(0,0,0);
  textAlign(CENTER);
  text("Tempo", 50,520);
  text("-",0, 520);
  text("+",110, 520);
  console.log(state);
  if (state == 'aurora'){

    image(song1_image,250,250);
    
  }
  if(state == 'second'){

    image(song2_image,250,250);
    
  }
  if(state =='third'){
   
    image(song3_image,250,250);
    
  }

  
}
function nextSong() {
  if (state == 'aurora'){
  
    song1.stop();
    song3.pause();
    state = 'second';
    song2.play();

  }
  else if(state == 'second'){
    song2.stop();
    song1.pause();
    state = 'third';

    song3.play();

    
  }
  else if(state == 'third'){
    
    song3.stop();
    song2.pause();
    state = 'first';
    song1.play();
  }
}

