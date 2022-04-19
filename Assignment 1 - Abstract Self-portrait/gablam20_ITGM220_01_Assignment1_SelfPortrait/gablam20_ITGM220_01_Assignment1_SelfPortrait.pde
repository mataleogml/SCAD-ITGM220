/*************************************
Savannah College of Art and Design
Spring 2021 - ITGM 220 - 01
Assignment 1: Abstract Self-Portrait
*************************************/
PGraphics pg; // declare the instance of the layer
float r = 0; 

void setup() {
  size(500, 500);
  background(1,1,20);
  pg = createGraphics(width, height); //initialize it to the size of window
  
  rotate(50);
  fill(#404041);
  noStroke();
  circle(0, 400, 700);  
  
  fill(#1E1E1E);
  noStroke();
  circle(500, 150, 550);
  
  colorMode(HSB,360); //colormode for the continous line
}

void draw() {
  pg.beginDraw();

// That Continous line
noFill();  
beginShape();
stroke(r,360,360);
strokeWeight(2); 
strokeJoin(ROUND);
vertex(100.4, 415.11);
vertex(151.62, 377.58);
vertex(151.62, 391.74);
vertex(191.46, 374.74);
vertex(190.46, 466.09);
vertex(204.27, 448.39);
vertex(217.79, 422.9);
vertex(201.05, 354.03);
vertex(207.7, 325.95);
vertex(184.35, 284.11);
vertex(167.99, 209.75);
vertex(180.05, 243.04);
vertex(172.25, 245.87);
vertex(159.44, 200.55);
// Left Ear 
vertex(172.25, 170.1);
vertex(181.92, 182.65);
vertex(190.3, 206.21);
vertex(200.17, 218.06);
vertex(217.79, 220.38);
// Left Glass 
vertex(245.26, 201.48);
vertex(251.22, 188.51);
vertex(245.95, 180.77);
vertex(204.27, 180.72);
vertex(201.75, 189.38);
vertex(210, 195.02);
vertex(240.24, 192.46);
vertex(244.85, 185.06);
vertex(247.67, 183.56);
vertex(263.97, 181);
// Right Glass 
vertex(307.12, 179.53);
vertex(321.06, 181.66);
vertex(333.08, 186.92);
vertex(337.57, 192.83);
vertex(337.77, 200.9);
vertex(328.78, 216.84);
vertex(307.13, 222.92);
vertex(288.25, 219.27);
vertex(276.88, 212.32);
vertex(269.73, 200.55);
vertex(276.01, 191.43);
vertex(301.07, 184.84);
vertex(319.17, 184.58);
vertex(327.23, 186.91);
vertex(329.37, 191.52);
vertex(327.01, 196.65);
vertex(319.82, 200.13);
vertex(309.3, 201.16);
vertex(301.6, 195.29);
vertex(304, 190.63);
vertex(313.19, 187.84);
vertex(336.46, 184.03);
// Right Ear
vertex(351.99, 185.71);
vertex(361.67, 194.08);
vertex(364.82, 206.55);
vertex(364.35, 217.55);
vertex(358.66, 235.06);
vertex(355.93, 248);
vertex(358.66, 252.95);
vertex(365.88, 253.76);
vertex(386.44, 229.77);
vertex(394.23, 218.25);
//Hair
vertex(396.71, 202.02);
vertex(394, 171.52);
vertex(394.94, 158.71);
vertex(399.42, 136.76);
vertex(399.39, 125.59);
vertex(374.58, 66.5);
vertex(363.56, 55.23);
vertex(319.02, 37.39);
vertex(256.21, 34.15);
vertex(251.64, 46.31);
vertex(187.2, 66.94);
vertex(163.72, 100.71);
vertex(152.23, 137.53);
// Inside Hair
vertex(154.07, 151.74);
vertex(160.75, 163.98);
vertex(168.70, 163.73);
vertex(175.1, 150.98);
vertex(183.77, 143.02);
vertex(199.45, 140.44);
vertex(216.36, 143.90);
vertex(234.07, 148.84);
vertex(236.29, 144.63);
vertex(222.77, 122.66);
vertex(219.39, 111.34);
vertex(221.07, 102.33);
vertex(233.23, 107.69);
vertex(251.23, 133.99);
vertex(260.86, 145.91);
vertex(290.36, 163.73);
vertex(316.50, 173.42);
vertex(345.14, 177.18);
vertex(369.33, 181.43);
vertex(376.74, 189.90);
vertex(378.83, 212.60);
vertex(371.47, 229.58);
vertex(359.37, 241.62);
vertex(349.93, 281.86);
// Cheek
vertex(343.01, 289.775);
vertex(308.33, 317.59);
vertex(289.48, 326.77);
vertex(262.61, 328.71);
vertex(235.39, 318.96);
vertex(230.60, 309.60);
vertex(232.37, 299.87);
// Mouth
curveVertex(245.52, 289.83);
curveVertex(269.03, 285.78);
curveVertex(288.93, 281.28);
curveVertex(277.51, 279.26);
curveVertex(236.62, 278.45);
curveVertex(225.62, 270.42);
curveVertex(234.65, 266);
curveVertex(279.69, 253.66);
// Nose
curveVertex(280.20, 250.31);
curveVertex(267.59, 251.53);
curveVertex(246.70, 250.45);
curveVertex(240.84, 245.22);
curveVertex(240.97, 237.222);
curveVertex(252.89, 207.34);
curveVertex(254.07, 187.81);
endShape();
r++;

// Text
fill(254);
 textSize(15);
 textAlign(CENTER);
 text("Gabriel Mataleo", width /2 , height - 20);

// Ending
  pg.endDraw(); 
  image(pg,0,0); // then display your buffer on screen ; otherwise, you won't see what you draw in
}
