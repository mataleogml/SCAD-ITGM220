/*************************************
Savannah College of Art and Design
Spring 2021 - ITGM 220 - 01
Assignment 2: Complex Pattern
*************************************/

int [] TileColor = 
{
#02483b, //dark green
#03523b, //green
#198c74, //cyan
};

//color table for the different tiles combaination

int [] Tile01Color = 
{
#03523b, //green
#a8c9d6, //blue
#d9c7a6, //brown
};

int [] TileLightColor = 
{
#f3f3f3, //cool-tone white
#ededed, //netural light gray
};

int [] Tile02LightColor = 
{
#d9c7a6, //brown
#bdd3df, //light blue
};


//setup
void setup(){
  PFont Superclarendon;
  Superclarendon = createFont("Superclarendon.ttf",45);
  PFont SuperclarendonSmall;
  SuperclarendonSmall = createFont("Superclarendon.ttf",20);
  size(1600, 960);
  strokeWeight(2);
  for(int i = 0; i < 2480; i += 160){
    for(int j = 0; j < 1080; j += 160){
      int var = (int) random(3);;
      if(var == 0){
      tile1(i,j);
        } else if(var == 1){
        tile2(i,j);
        } else {
        tile3(i,j);
      }
    }
    fill(#ededed);
    rect(160,160,640,160);
    fill(#000000);
    //headline
      textFont(Superclarendon);
      text("HONG KONG CLASSIC",190,245);
      textFont(SuperclarendonSmall);
      text("GABRIEL LAM",190,275);
  }
}

//tile style 1
public void tile1(int x, int z){
  pushMatrix();
  int num2 = (int) random(TileLightColor.length);
  int tile_LCol = TileLightColor[num2];
  fill(tile_LCol);
  translate(x,z);
  stroke(#808285);
  square(0,0,160);
  int num = (int) random(Tile01Color.length);
  int tile_01Col = Tile01Color[num];
  fill(tile_01Col);
  rect(50,0,60,30);
  rect(50,130,60,30);
  rect(0,50,30,60);
  rect(130,50,30,60);
  line(30,50,50,30);
  line(110,30,130,50);
  line(30,110,50,130);
  line(110,130,130,110);
  line(0,80,160,80);
  line(80,0,80,160);
  popMatrix();
}

//tile style 2
public void tile2(int x, int z){
  pushMatrix();
  int num2 = (int) random(TileLightColor.length);
  int tile_LCol = TileLightColor[num2];
  fill(tile_LCol);
  translate(x,z);
  stroke(#808285);
  square(0,0,160);
  int num = (int) random(TileColor.length);
  int tile_Col = TileColor[num];
  fill(tile_Col);
  rect(0,0,30,30);
  rect(0,130,30,30);
  rect(130,0,30,30);
  rect(130,130,30,30);
  int num3 = (int) random(Tile02LightColor.length);
  int tile_02LCol = Tile02LightColor[num3];
  fill(tile_02LCol);
  rect(30,30,100,100);
  popMatrix();
}

//tile style 3
public void tile3(int x, int z){
  pushMatrix();
  int num2 = (int) random(TileLightColor.length);
  int tile_LCol = TileLightColor[num2];
  fill(tile_LCol);
  translate(x,z);
  stroke(#808285);
  square(0,0,160);
  int num = (int) random(TileColor.length);
  int tile_Col = TileColor[num];
  fill(tile_Col);
  rect(0,0,30,15);
  rect(50,65,30,15);
  rect(80,80,30,15);
  rect(130,145,30,15);
  rect(145,0,15,30);
  rect(80,50,15,30);
  rect(65,80,15,30);
  rect(0,130,15,30);
  line(80,0,80,160);
  line(0,80,160,80);
  line(30,15,50,65);
  line(95,50,145,30);
  line(65,110,15,130);
  line(110,95,130,145);
  popMatrix();
}
