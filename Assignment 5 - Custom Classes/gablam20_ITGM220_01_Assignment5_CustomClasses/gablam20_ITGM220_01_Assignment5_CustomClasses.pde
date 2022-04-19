/*************************************
 Savannah College of Art and Design
 Spring 2021 - ITGM 220 - 01
 Assignment 5: Custom Classes
 *************************************/
import processing.sound.*;
SoundFile DajaVu;

PImage you, others, PassLic, FailLic, StartScreen, GrassBG, Asphalt;
float rt;

int r=0;
int s=0;
int p=0;
int []dvy={-50, 100, 250, 400, 550, 700, 900};
int dvp=2;
int x=350, y=800;
int rx1() {
  return int(random(175, 315));
}
int rx2() {
  return int(random(385, 525));
}
int ry() {
  return int(random(-60, -59));
}
int rs() {
  return int(random(2));
}
int[]cx={rx1(), rx1(), rx2(), rx2()};
int[]cx1={rx1(), rx1(), rx2(), rx2()};
float[]cy={-59, -200, -350, -600};
float[]cyr={-59, -200, -350, -600};

int scr;
int k=0;
int roadside =rs();
float m=5; //Bypassing Vehicle Speed
float d=m;
float n=0.001;
int pos=0;

myVehicle mainV = new myVehicle();
othersVehicle othersV = new othersVehicle();

void setup() {

  size(700, 900);
  textAlign(CENTER, CENTER);
  GrassBG=loadImage("GrassBG.png");
  you=loadImage("AE86.png");
  StartScreen=loadImage("StartScreen.png");
  PassLic=loadImage("LicensePass.png");
  FailLic=loadImage("LicenseFail.png");
  Asphalt=loadImage("Asphalt.png");
  others=loadImage("OtherVehicle.png");
  DajaVu = new SoundFile(this, "DajaVu.mp3");
  DajaVu.amp(0.2);
  DajaVu.play();
  DajaVu.loop();
  for (int i=0; i<=3; i++) {
    cy[i]=ry();
    cx[i]=p;
  }
}
void draw() {
  background(0, 150, 0);
  if (k==1) {
    d=0;
    n=0;
    dvp=0;
  }
  if (k==0) {
    d=m;
    n=.001;
    dvp=2;
  }

  //start screen and game
  imageMode(CENTER); 
  image(StartScreen, 350, 450);
  textSize(32);
  fill(255);
  text("PRESS R TO START YOUR TEST", 350, 850);
  if (r==0) {
    fill(0);
  }
  if (r==1) {
    gameover();
  }
  if (r==2) {
    //road
    image(GrassBG, 350, 450);
    rectMode(CENTER);
    //fill(#ffdd35); //road color
    rect(350, 450, 400, 900);
    image(Asphalt, 350, 450);
    noFill();
    for (int i=0; i<=6; i++) {
      fill(255);
      noStroke();
      rect(width/2, dvy[i], 10, 100); //road centre line
    }
    for (int i=0; i<=6; i++) {
      dvy[i]+=dvp;
      if (dvy[i]>=950) {
        dvy[i]=-50;
      }
    }
    //player car position
    mainV.ourV(); //goto myVehicle
    othersV.othersV();
    fill(255);
    textSize(50);
    text(scr, 70, 70); //scroe location
    m+=n;
    for (int i=0; i<=3; i++) {
      cy[i]+=d;
    }
    for (int i=0; i<=3; i++) {
      if (cy[i]>=959) {
        scr+=5;  //+5 when ever passes a car
        print(scr);
        cy[i]=ry();
        roadside=rs();
        if (roadside==0) {
          cx[i]=rx1();
        }
        if (roadside==1) {
          cx[i]=rx2();
        }
      }
    }
    if (x>=521) {
      x=521;
    } else if (x<=179) {
      x=179;
    }
    if (y>=840) {
      y=840;
    } else if (y<=60) {
      y=60;
    }
    for (int i=0; i<=3; i++) {
      if (cy[i]>=(y-117) && cy[i]<=(y+117) && cx[i]>=(x-46) && cx[i]<=(x+46)) {
        gameover();
      }
    }
  }
}

void keyPressed() {
  if (keyCode == 32) {
    k=1;
  }
  if (keyCode==RIGHT) {
    x+=d;
  } else if (keyCode==LEFT) {
    x-=d;
  } else if (keyCode==UP) {
    y-=d;
  } else if (keyCode==DOWN) {
    y+=d;
  }
  if (key=='r') {
    r=2;
    scr=0;
    reset();
    m=5;
    d=m;
    s=0;
  }
}

//crash screen
void gameover() {
  //b.play();
  r=1;
  fill(0);
  if (scr<=49) {
    image(FailLic, 350, 550);
    textSize(50);
    text(scr, 350, 550);
  }
  if (scr>=50) {
    image(PassLic, 350, 550);
    textSize(30);
    text(scr, 350, 550);
  }
  s++;
  reset();
}

//for resetting
void reset() {
  x=350;
  y=800;
  d=5;
  for (int i=0; i<=3; i++) {
    cx[i]=cx1[i];
    cy[i]=cyr[i];
  }
}
