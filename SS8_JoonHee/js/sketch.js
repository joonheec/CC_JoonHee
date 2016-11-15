//Joon Hee Choi

var pokemon; 

var img_pokedex;
var state = "1";
var index;
var name;
var height;
var weight;
var base_experience;
var bulbasaur;
var ivy;
function preload () {
  pokemon = loadTable("../data/pokemon.csv", "header"); // preloading necessary data
  img_pokedex = loadImage("../img/pokedex.png");
  bulbasaur = loadImage("../img/bulbasaur.gif");
  ivy = loadImage("../img/2.gif");
}

function setup() {
  createCanvas(800,600); 
  img_pokedex.loadPixels();
  image(img_pokedex,0,0);
  imageMode(CENTER);
  textSize(16);
  // for (var i = 0; i < pokemon.getRowCount(); i++) {
  //   index = pokemon.getString(i,"id");
  //   name = pokemon.getString(i,"identifier");
  //   height = pokemon.getString(i,"height");
  //   weight = pokemon.getString(i,"weight");
  //   base_experience = pokemon.getString(i,"base_experience");
    
  // }
}

function draw () {
  if (state == "1"){
    pokemon.getRow(0);
    index = pokemon.getString(0,"id");
    name = pokemon.getString(0,"identifier");
    height = pokemon.getString(0,"height");
    weight = pokemon.getString(0,"weight");
    base_experience = pokemon.getString(0,"base_experience");
    image(bulbasaur,200,300,300,300);
    text("Pokedex Index: " + index, 490,250);
    text("Name: " + name, 490,300);
    text("Weight: " + weight, 490,350);
    text("Base Experience: " + base_experience, 490,400);

  }
  if (state == "2"){
    pokemon.getRow(1);
    index = pokemon.getString(1,"id");
    name = pokemon.getString(1,"identifier");
    height = pokemon.getString(1,"height");
    weight = pokemon.getString(1,"weight");
    base_experience = pokemon.getString(1,"base_experience");
    image(ivy,200,300,300,300);
    text("Pokedex Index: " + index, 490,250);
    text("Name: " + name, 490,300);
    text("Weight: " + weight, 490,350);
    text("Base Experience: " + base_experience, 490,400);

  }
  if (state == "3"){
    
  }
  if (state == "4"){
    
  }
  if (state == "5"){
    
  }
  if (state == "6"){
    
  }
  if (state == "7"){
    
  }
  if (state == "8"){
    
  }
  if (state == "9"){
    
  }
}
function mousePressed(){
  if (state == "1"){
    state == "2";
  }
  if (state == "2"){
    state == "3";
  }
  if (state == "3"){
    state =="4";
  }
  if (state == "4"){
    state =="5";
  }
  if (state == "5"){
    state =="6";
  }
  if (state == "6"){
    state =="7";
  }
  if (state == "7"){
    state =="8";
  }
  if (state == "8"){
    state =="9";
  }
  if (state == "9"){
    state =="1";
  }
}
