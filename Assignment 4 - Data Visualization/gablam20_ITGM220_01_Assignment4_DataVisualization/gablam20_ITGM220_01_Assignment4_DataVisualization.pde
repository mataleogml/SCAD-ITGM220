/*************************************
 Savannah College of Art and Design
 Spring 2021 - ITGM 220 - 01
 Assignment 4: Data Visulaization
 *************************************/
import processing.pdf.*;

// GLOBAL VARIABLES
PShape baseMap;
String csv[];
String myData[][];
PFont f;

//setup
void setup() {
  size(900, 450);
  noLoop();
  f = createFont("Avenir-Medium", 12);
  baseMap = loadShape("WorldMap.svg");
  csv = loadStrings("Vaccination.csv");
  myData = new String[csv.length][6];
  for (int i = 0; i < csv.length; i++) {
    myData[i] = csv[i].split(",");
  }
}

//draw circle depends on the no. of dose administrated
void draw() {
  beginRecord(PDF, "VaccinationStrikes.pdf");
  shape(baseMap, 0, 0, width, height);
  noStroke();

  for (int i = 0; i < myData.length; i++) {
    fill(#5AA27C, 50);
    textMode(SHAPE);
    noStroke();
    float graphLong = map(float(myData[i][3]), -180, 180, 0, width);
    float graphLat = map(float(myData[i][4]), 90, -90, 0, height);
    float markerSize = 0.025 * sqrt(float(myData[i][2])) / PI;
    ellipse(graphLong, graphLat, markerSize, markerSize);
    if (i < 10) { //point out the top 10 state/country that administrated the most dose
      fill(0);
      textFont(f);
      text(myData[i][0], graphLong + markerSize + 5, graphLat + 4);
      noFill();
      stroke(0);
      line(graphLong + markerSize / 2, graphLat, graphLong + markerSize, graphLat);
    }
    //bottom left hand corner title
    textSize(30);
    text("COVID-19 Vaccination Rollout", 50, 400);
    println(graphLong + " , " + graphLat);
  }
  endRecord();
  //you can enable the 2 options here to print the updated graphic into pdf and jpg format
  //println("PDF Saved");
  //saveFrame("Vaccination.jpg");
}
