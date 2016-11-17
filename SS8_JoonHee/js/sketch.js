//Joon Hee Choi
//Pokedex
//Images taken from http://www.ign.com/pokedex/pokemon/
//csv file from https://github.com/veekun/pokedex/blob/master/pokedex/data/csv/pokemon.csv
//Mouse press to go through pokedex
var pokemon; 

var img_pokedex;
var state = '1';
var index;
var name;
var height;
var weight;
var base_experience;
var bulbasaur;
var ivy;
var veno;
var charmander;
var charmeleon;
var charizard;
var squirtle;
var wartortle;
var blastoise;
function preload () {
  pokemon = loadTable("../data/pokemon.csv", "header"); // preloading necessary data
  img_pokedex = loadImage("../img/pokedex.png");
  bulbasaur = loadImage("../img/bulbasaur.gif");
  ivy = loadImage("../img/2.gif");
  veno = loadImage("../img/3.gif");
  charmander = loadImage("../img/4.gif");
  charmeleon = loadImage("../img/5.gif");
  charizard = loadImage("../img/6.gif");
  squirtle = loadImage("../img/7.gif");
  wartortle = loadImage("../img/8.gif");
  blastoise = loadImage("../img/9.gif");
}

function setup() {
  createCanvas(800,600); 
  img_pokedex.loadPixels();
  image(img_pokedex,0,0);
  imageMode(CENTER);
  textSize(16);
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

function draw () {

    
}

function mousePressed(){
  imageMode(CORNER);
  image(img_pokedex,0,0);
  if (state == '1'){
    state = '2';
    pokemon.getRow(1);
    index = pokemon.getString(1,"id");
    name = pokemon.getString(1,"identifier");
    height = pokemon.getString(1,"height");
    weight = pokemon.getString(1,"weight");
    base_experience = pokemon.getString(1,"base_experience");
    imageMode(CENTER);
    image(ivy,200,300,300,300);
    text("Pokedex Index: " + index, 490,250);
    text("Name: " + name, 490,300);
    text("Weight: " + weight, 490,350);
    text("Base Experience: " + base_experience, 490,400);
    console.log("asd");

  }
  else if (state == "2"){
    state = "3";
    pokemon.getRow(2);
    index = pokemon.getString(2,"id");
    name = pokemon.getString(2,"identifier");
    height = pokemon.getString(2,"height");
    weight = pokemon.getString(2,"weight");
    base_experience = pokemon.getString(2,"base_experience");
    imageMode(CENTER);
    image(veno,200,300,300,300);
    text("Pokedex Index: " + index, 490,250);
    text("Name: " + name, 490,300);
    text("Weight: " + weight, 490,350);
    text("Base Experience: " + base_experience, 490,400);
  }
  else if (state == "3"){
    
    state = "4";
    pokemon.getRow(3);
    index = pokemon.getString(3,"id");
    name = pokemon.getString(3,"identifier");
    height = pokemon.getString(3,"height");
    weight = pokemon.getString(3,"weight");
    base_experience = pokemon.getString(3,"base_experience");
    imageMode(CENTER);
    image(charmander,200,300,300,300);
    text("Pokedex Index: " + index, 490,250);
    text("Name: " + name, 490,300);
    text("Weight: " + weight, 490,350);
    text("Base Experience: " + base_experience, 490,400);
  }
  else if (state == "4"){
    state ="5";
    pokemon.getRow(4);
    index = pokemon.getString(4,"id");
    name = pokemon.getString(4,"identifier");
    height = pokemon.getString(4,"height");
    weight = pokemon.getString(4,"weight");
    base_experience = pokemon.getString(4,"base_experience");
    imageMode(CENTER);
    image(charmeleon,200,300,300,300);
    text("Pokedex Index: " + index, 490,250);
    text("Name: " + name, 490,300);
    text("Weight: " + weight, 490,350);
    text("Base Experience: " + base_experience, 490,400);
  }
  else if (state == "5"){
    state = "6";
    pokemon.getRow(5);
    index = pokemon.getString(5,"id");
    name = pokemon.getString(5,"identifier");
    height = pokemon.getString(5,"height");
    weight = pokemon.getString(5,"weight");
    base_experience = pokemon.getString(5,"base_experience");
    imageMode(CENTER);
    image(charizard,200,300,300,300);
    text("Pokedex Index: " + index, 490,250);
    text("Name: " + name, 490,300);
    text("Weight: " + weight, 490,350);
    text("Base Experience: " + base_experience, 490,400);
  }
  else if (state == "6"){
    state = "7";
    pokemon.getRow(6);
    index = pokemon.getString(6,"id");
    name = pokemon.getString(6,"identifier");
    height = pokemon.getString(6,"height");
    weight = pokemon.getString(6,"weight");
    base_experience = pokemon.getString(6,"base_experience");
    imageMode(CENTER);
    image(squirtle,200,300,300,300);
    text("Pokedex Index: " + index, 490,250);
    text("Name: " + name, 490,300);
    text("Weight: " + weight, 490,350);
    text("Base Experience: " + base_experience, 490,400);
  }
  else if (state == "7"){
    state = "8";
    pokemon.getRow(7);
    index = pokemon.getString(7,"id");
    name = pokemon.getString(7,"identifier");
    height = pokemon.getString(7,"height");
    weight = pokemon.getString(7,"weight");
    base_experience = pokemon.getString(7,"base_experience");
    imageMode(CENTER);
    image(wartortle,200,300,300,300);
    text("Pokedex Index: " + index, 490,250);
    text("Name: " + name, 490,300);
    text("Weight: " + weight, 490,350);
    text("Base Experience: " + base_experience, 490,400);
  }
  else if (state == "8"){
    state ="9";
    pokemon.getRow(8);
    index = pokemon.getString(8,"id");
    name = pokemon.getString(8,"identifier");
    height = pokemon.getString(8,"height");
    weight = pokemon.getString(8,"weight");
    base_experience = pokemon.getString(8,"base_experience");
    imageMode(CENTER);
    image(blastoise,200,300,300,300);
    text("Pokedex Index: " + index, 490,250);
    text("Name: " + name, 490,300);
    text("Weight: " + weight, 490,350);
    text("Base Experience: " + base_experience, 490,400);
  }
  else if (state == "9"){
    state = "1";
    pokemon.getRow(0);
    index = pokemon.getString(0,"id");
    name = pokemon.getString(0,"identifier");
    height = pokemon.getString(0,"height");
    weight = pokemon.getString(0,"weight");
    base_experience = pokemon.getString(0,"base_experience");
    imageMode(CENTER);
    image(bulbasaur,200,300,300,300);
    text("Pokedex Index: " + index, 490,250);
    text("Name: " + name, 490,300);
    text("Weight: " + weight, 490,350);
    text("Base Experience: " + base_experience, 490,400);
  }
}
