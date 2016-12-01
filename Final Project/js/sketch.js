var cnv; //canvas
var fft; //Fast Fourier Transform
var lowerPeakDetect; 
var midPeakDetect; // mid range peak
var higherPeakDetect; // higher range peak
var soundFile;
var binCount = 1024;
var particles =  new Array(binCount);

//
// variables to manage the three character images
//

var w1 = null;
var w2 = null;
var w3 = null;

var minimumWidth1 = 300;
var minimumWidth2 = 250;
var minimumWidth3 = 180;
var maximumWidth1 = minimumWidth1 + (minimumWidth1 * .25);
var maximumWidth2 = minimumWidth2 + (minimumWidth1 * .25);
var maximumWidth3 = minimumWidth3 + (minimumWidth1 * .25);

var imagePath1 = "../img/circle.png";
var imagePath2 = "../img/circle.png";
var imagePath3 = "../img/circle.png";

var imageCache = {};

var Particle = function(position) {
  this.position = position;
  this.scale = random(0, 1);
  this.speed = createVector(0, random(0, 10) );
  this.color = [random(50, 255), 0, random(30,255)];
}

var theyExpand = 1;

// use FFT bin level to change speed and diameter
Particle.prototype.update = function(someLevel) {
  this.position.y += this.speed.y / (someLevel*2);
  if (this.position.y > height) {
    this.position.y = 0;
  }
  this.diameter = map(someLevel, 0, 1, 0, 100) * this.scale * theyExpand;

}

Particle.prototype.draw = function() {
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
  fill(255);
  textAlign(CENTER);
  stroke(0);
  // p5.PeakDetect requires a p5.FFT
  fft = new p5.FFT();
  lowerPeakDetect = new p5.PeakDetect(40,2000);
  midPeakDetect = new p5.PeakDetect(2000,4000);
  higherPeakDetect = new p5.PeakDetect(4000,10000);

  fft = new p5.FFT(0.8, 1024);
  fft.setInput(soundFile);
  for (var i = 0; i < particles.length; i++) {
    var x = map(i, 0, binCount, 0, width * 2);
    var y = random(0, height);
    var position = createVector(x, y);
    particles[i] = new Particle(position);
  }
}

function draw() {

  //
  // update the background and UI elements
  //
  background(0);
  
  text('click to play/pause', width/10, height/10);
  var spectrum = fft.analyze(binCount);

  //
  // update peakDetect via FFT post-analysis
  //
  fft.analyze();
  lowerPeakDetect.update(fft);
  midPeakDetect.update(fft);
  higherPeakDetect.update(fft);

  //
  // prepare size based on peak detection
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
  // update the character images width, height, x, y based on peak detection
  //
  image(imageCache[imagePath1],windowWidth/2, windowHeight/2+lowerPeakDetect.energy *100,w1,w1);
  // image(imageCache[imagePath1], width/2 - (imageCache[imagePath1].width/2) - maximumWidth1, (height/2 - (imageCache[imagePath1].height/2)) + lowerPeakDetect.energy *100, w1, w1);

  // image(imageCache[imagePath2], width/2 - (imageCache[imagePath2].width/2), (height/2 - (imageCache[imagePath2].height/2))  + midPeakDetect.energy *100, w2, w2);

  // image(imageCache[imagePath3], width/2 - (imageCache[imagePath3].width/2) + maximumWidth3, (height/2 - (imageCache[imagePath3].height/2))  + higherPeakDetect.energy *100, w3, w3);

  for (var i = 0; i < binCount; i++) {
    var thisLevel = map(spectrum[i], 0, 255, 0, 1);

    // update values based on amplitude at this part of the frequency spectrum
    particles[i].update( thisLevel );

    // draw the particle
    particles[i].draw();

    // update x position (in case we change the bin count while live coding)
    particles[i].position.x = map(i, 0, binCount, 0, width * 2);
  }
}

// toggle play/stop when canvas is clicked
function mouseClicked() {
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
    if (soundFile.isPlaying() ) {
      soundFile.stop();
    } else {
      soundFile.loop();
    }
  }
}