/************************************* //<>//
 Savannah College of Art and Design
 Spring 2021 - ITGM 220 - 01
 Assignment 3: Interactive Time-Based Platform
 *************************************/
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Collections;
import java.util.Random;

String [] BlueColor = 
  {
  "Admarity", 
  "Kowloon Tong", 
  "Lam Tin", 
  "Mei Foo", 
};

String [] BrownColor = 
  {
  "Cheung Sha Wan", 
  "Wong Tai Sin", 
  "Sheung Wan", 
  "Sai Wan Ho", 
};

String [] GreenColor = 
  {
  "Tai Wo Hau", 
  "Chai Wan", 
  "Shek Kip Mei", 
  "Sham Shui Po", 
  "Jordan", 
};

String [] RedColor = 
  {
  "Tsuen Wan", 
  "Lai King", 
  "Mong Kok", 
  "Central", 
  "Taikoo", 
  "Kowloon Bay", 
};

//declear var
PImage TrainInterior;
PImage LeftDoor;
PImage RightDoor;
PImage Tunnel;
PImage Button;
PImage Blue;
PImage Red;
PImage Brown;
PImage Green;
float x;  //train drive speed
float y;  //door open speed
PGraphics TunnelLayer;
PGraphics DoorLayer;

//setup
void setup() {
  size(450, 975);
  TrainInterior = loadImage("TrainInterior.png");
  Tunnel = loadImage("Tunnel.png");
  LeftDoor = loadImage("LeftDoor.png");
  RightDoor = loadImage("RightDoor.png");
  Button = loadImage("Button.png");
  Blue = loadImage("Blue.png");
  Red = loadImage("Red.png");
  Brown = loadImage("Brown.png");
  Green = loadImage("Green.png");
  image(TrainInterior, 0, 0, 450, 975);
  DoorLayer = createGraphics(width, height);
  TunnelLayer = createGraphics(width, height);
  //structMCQ();
}

//select random color and station
HashMap <String, Boolean> multipleChoice = new HashMap<String, Boolean>();

public String structMCQ() {
  String[] colorArray = {"BlueColor", "RedColor", "BrownColor", "GreenColor"};
  String Color;
  Color = randomPickFromArray(colorArray);

  //  System.out.print(Color);
  String correctAns = null;
  String wrongAns1 = null;
  String wrongAns2 = null;
  String wrongAns3 = null;
  System.out.print(Color);
  switch(Color) {
  case "BlueColor":
    {
      correctAns = randomPickFromArray(BlueColor);
      wrongAns1 = randomPickFromArray(RedColor);
      wrongAns2 = randomPickFromArray(BrownColor);
      wrongAns3 = randomPickFromArray(GreenColor);
      break;
    }

  case "RedColor":
    {
      correctAns = randomPickFromArray(RedColor);
      wrongAns1 = randomPickFromArray(BlueColor);
      wrongAns2 = randomPickFromArray(BrownColor);
      wrongAns3 = randomPickFromArray(GreenColor);
      break;
    }


  case "BrownColor":
    {
      correctAns = randomPickFromArray(BrownColor);
      wrongAns1 = randomPickFromArray(RedColor);
      wrongAns2 = randomPickFromArray(GreenColor);
      wrongAns3 = randomPickFromArray(BlueColor);
      break;
    }

  case "GreenColor":
    {
      correctAns = randomPickFromArray(GreenColor);
      wrongAns1 = randomPickFromArray(RedColor);
      wrongAns2 = randomPickFromArray(BrownColor);
      wrongAns3 = randomPickFromArray(BlueColor);
      break;
    }
  }

  multipleChoice.put(correctAns, true);
  multipleChoice.put(wrongAns1, false);
  multipleChoice.put(wrongAns2, false);
  multipleChoice.put(wrongAns3, false);
  return Color;
}

public boolean answerMCQ(String Ans) {
  return multipleChoice.get(Ans);
}

public void resetMCQ() {
  multipleChoice = new HashMap<String, Boolean>();
}

private static String randomPickFromArray(String[] input) {
  int rnd = new Random().nextInt(input.length);
  return input[rnd];
}

//count station time
long currentTime = System.currentTimeMillis();
boolean excuted = false;

//continue tunnel movement
String Color2 = null;
List <String> options;
void draw() {
  image(LeftDoor, 0+y, 183, 225, 547);
  image(RightDoor, 225-y, 183, 225, 547);
  //drawTunnel();
  if (System.currentTimeMillis() - currentTime >= 15000 && System.currentTimeMillis() - currentTime < 13000) {
    image(TrainInterior, 0, 0, 450, 975);
    image(Button, 40, 780, 370, 150);

    options = new ArrayList<String>(multipleChoice.keySet());
    if (!excuted) {    
      Color2 = structMCQ();
      Collections.shuffle(options);
      excuted = true;
    } else {
      switch(Color2) {
      case "BlueColor":
        {
          image(Blue, 40, 183, 370, 547);
          break;
        } 
      case "RedColor":
        {
          image(Red, 40, 183, 370, 547);
          break;
        } 
      case "BrownColor":
        {
          image(Brown, 40, 183, 370, 547);
          break;
        } 
      case "GreenColor":
        {
          image(Green, 40, 183, 370, 547);
          break;
        }
      }
      //System.out.print(options);
      pushMatrix();
      textSize(15);
      fill(#000000);
      text(options.get(0), 85, 815);
      text(options.get(1), 290, 815);
      text(options.get(2), 85, 905);
      text(options.get(3), 290, 905);
      textAlign(LEFT);
      popMatrix();
    }
    if (key == 'a') {
      System.out.println("hi");
    }
  }
  y=y-5;
  if (y <= -195) {
    y = -195;
  }
}

public void drawTunnel() {
  image(Tunnel, x, 183, 550, 500);
  x-=15;
  if (x <= -845) {
    x = 1295;
  }
}

void keyTyped() {
  if (excuted) {
    if (int(key) > options.size()) {
      return;
    }
    if (answerMCQ(options.get(int(key)-1))) {
      //play correct sound, score + 10
      text("Correct!", 200, 130);
      textSize(30);
      fill(#000000);
      textAlign(CENTER);
    } else {
      //play wrong sound, score - 10
    }
  }
  excuted = false;
  resetMCQ();
  currentTime = System.currentTimeMillis();
  //count++
}

void keyPressed() {
  if (excuted) {
    System.out.println("hi");
    boolean correct = false;
    switch(key) {
    case '1': 
      correct = answerMCQ(options.get(0)); 
      break;
    case '2': 
      correct = answerMCQ(options.get(1)); 
      break;
    case 'C': 
    case '3': 
      correct = answerMCQ(options.get(2)); 
      break;
    case 'D': 
    case '4': 
      correct = answerMCQ(options.get(3)); 
      break;
    default: 
      return;
    }

    if (correct) {
      //play correct sound, score + 10
      System.out.println("Correct");
    } else {
      //play wrong sound, score - 10
      System.out.println("Vely Wrong");
    }

    excuted = false;
    resetMCQ();
    currentTime = System.currentTimeMillis();
    //count++
  }
}

public void drawDoor() {
  if (System.currentTimeMillis() - currentTime > 13000) {
    image(LeftDoor, 0, 183, 225, 547);
    image(RightDoor, 225, 183, 225, 547);
  }
  if (System.currentTimeMillis() - currentTime > 15000) {
    //draw the boxes
  }
} 
