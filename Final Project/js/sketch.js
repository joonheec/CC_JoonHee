var cnv; //canvas
var fft; //Fast Fourier Transform
var lowerPeakDetect; 
var midPeakDetect; // mid range peak
var higherPeakDetect; // higher range peak
var soundFile;
var binCount = 512;
var particles =  new Array(binCount);
var tempoSlider;
var tempoValue;
var ampSlider;
var ampValue;
var amp;
var speed;
var randomInt;

//
// variables to manage the three character images
//

var w1 = null;
var w2 = null;
var w3 = null;

var minimumWidth1 = 400;
var minimumWidth2 = 300;
var minimumWidth3 = 250;
var maximumWidth1 = minimumWidth1 + (minimumWidth1 * .25);
var maximumWidth2 = minimumWidth2 + (minimumWidth1 * .25);
var maximumWidth3 = minimumWidth3 + (minimumWidth1 * .55);

var imagePath1 = "../img/circle.png";
var imagePath2 = "../img/circle.png";
var imagePath3 = "../img/circle.png";

var imageCache = {};
//Particle Class and spectrum by Jason Sigal editted by me 
//https://github.com/therewasaguy/p5-music-viz/tree/master/demos/04_fft_freq_spectrum
//
function getRandomInt(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min)) + min;
}
var Particle = function(position) {
  this.position = position;
  this.scale = random(0, 1);
  this.speed = createVector(0, random(0, 7) );
  this.color = [255, random(30,180), random(140,255),random(70,90)];

}

var theyExpand = 1;

// use FFT bin level to change speed and diameter
Particle.prototype.update = function(someLevel) {
  this.position.y += this.speed.y / (someLevel*2);
  if (this.position.y > height) {
    this.position.y = 0;
  }
  this.diameter = map(someLevel, 0, 1, 0, 75) * this.scale * theyExpand;
  if (lowerPeakDetect.isDetected){
    this.diameter *= 1.03;
  }
  if (midPeakDetect.isDetected){
    this.diameter *= 1.05;
  }
  if (higherPeakDetect.isDetected){
    this.diameter *= 1.1;
  }

}

Particle.prototype.draw = function() {
    noStroke();
    // if(randomInt == 0){
    //   this.color = [random(30,40), random(30,180), 255,random(20,90)];
    // }
    // else if(randomInt == 1){
    //   this.color = [random(40,120), 255, random(180,255),random(70,90)];
    // }
    // else if(randomInt == 2){
    //   this.color = [255, random(150,180), random(40,170),random(50,90)];
    // }
    // else{
    //   this.color = [255, random(30,180), random(140,255),random(70,90)];
    // }
    fill(this.color);
    ellipse(
      this.position.x, this.position.y,
      this.diameter, this.diameter
    );

}

function preload(){

  imageCache[imagePath1] = loadImage(imagePath1);
  imageCache[imagePath2] = loadImage(imagePath2);
  imageCache[imagePath3] = loadImage(imagePath3);

  soundFile = loadSound("../mp3/mercy-threatz.mp3");
}

function setup() {

  var cnv = createCanvas(windowWidth, windowHeight);
  background(0);
  noStroke();
  //make canvas drag and droppable
  canvasDragDrop(cnv, newFile);
  fill(255);
  textAlign(CENTER);
  imageMode(CENTER);
  stroke(0);

  //instantiate a slider
  tempoSlider = createSlider(0,2000,1000);
  tempoSlider.position(windowWidth/2, 50);
  ampSlider = createSlider(0,1000,500);
  ampSlider.position(windowWidth/2, 200);

  fft = new p5.FFT();

  lowerPeakDetect = new p5.PeakDetect(40,2000);
  midPeakDetect = new p5.PeakDetect(2000,4000);
  higherPeakDetect = new p5.PeakDetect(4000,10000);

  fft = new p5.FFT(0.99, 1024);
  fft.setInput(soundFile);

  for (var i = 0; i < particles.length; i++) {
    var x = map(i, 0, binCount, 0, width * 2);
    var y = random(0, height);
    var position = createVector(x, y);
    particles[i] = new Particle(position);
    if(randomInt == 0){
      particles[i].color = [random(30,40), random(30,180), 255,random(20,90)];
    }
    else if(randomInt == 1){
      particles[i].color = [random(40,120), 255, random(180,255),random(70,90)];
    }
    else if(randomInt == 2){
      particles[i].color = [255, random(150,180), random(40,170),random(50,90)];
    }
    else{
      particles[i].color = [255, random(30,180), random(140,255),random(70,90)];
    }
  }
}

function draw() {

  //
  // update the background and UI elements
  //
  background(0);
  fill(255);
  text('click to play/pause', width/10, height/10);
  text('drag and drop songs to load into visualizer',width/10,height/10+20);  
  var spectrum = fft.analyze(binCount);

  //
  // update peakDetect via FFT 
  //
  fft.analyze();
  lowerPeakDetect.update(fft);
  midPeakDetect.update(fft);
  higherPeakDetect.update(fft);

  //
  // set sizes based on peak detect
  //
  if (lowerPeakDetect.isDetected){
      w1 = maximumWidth1;
  }
    else{
      w1 *= 0.95;
  }

  if(w1 < minimumWidth1){
    w1 = minimumWidth1;
  }

  if (midPeakDetect.isDetected){
    w2 = maximumWidth2;
  }
  else{
    w2 *= 0.95;
  }

  if(w2 < minimumWidth2){
    w2 = minimumWidth2;
  }

  if (higherPeakDetect.isDetected){
    w3 = maximumWidth3;
  }
  else{
    w3 *= 0.95;
  }

  if(w3 < minimumWidth3){
    w3 = minimumWidth3;
  }

  //
  // update images width, height, x, y based on peak detection
  //
  image(imageCache[imagePath1],windowWidth/2, (height/2)+lowerPeakDetect.energy *100,w1,w1);
  image(imageCache[imagePath2], width/2 - (imageCache[imagePath2].width/2)-200, (height/2)  + midPeakDetect.energy *100, w2, w2);
  image(imageCache[imagePath3], width/2 - (imageCache[imagePath3].width/2) + maximumWidth3+200, (height/2 )  + higherPeakDetect.energy *100, w3, w3);

  for (var i = 0; i < binCount; i++) {
    var thisLevel = map(spectrum[i], 0, 255, 0, 1);
    // update values based on amplitude
    particles[i].update(thisLevel);

    // draw the particle in index 
    particles[i].draw();

    particles[i].position.x = map(i, 0, binCount, 0, width * 2);

  }
  //get value from slider 
  speed = tempoSlider.value()/1000;
  speed = constrain(speed,0,2);
  amp = ampSlider.value()/1000;
  amp = constrain(amp,0,1);
  //set rate of song
  soundFile.rate(speed);
  soundFile.setVolume(amp);

}
function canvasDragDrop(cnv, newFile) {
  cnv.drop(newFile);
}

function newFile(file) {
  soundFile.dispose();
  soundFile = loadSound(file);
  fft.setInput(soundFile);
  fft.analyze(soundFile);
}
function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
}
// toggle play/stop when canvas is clicked
function mouseClicked() {
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
    randomInt = getRandomInt(0,3);
    if (soundFile.isPlaying() ) {
      soundFile.stop();
      binCount = 32;
    } else {
      soundFile.loop();
      binCount = 512;
    }
  }
}