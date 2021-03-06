import processing.sound.*; //<>// //<>// //<>// //<>// //<>// //<>//
pacman pac;
ghost gh;
pellet pellets;
int pellet_animator = 0;
boolean up, down, left, right;
int lives, time;
PImage logo;
PImage over;
int sec = 0;
int min = 0;
int sub = 0;
SoundFile munch;
SoundFile death;
boolean start;
boolean pause;
boolean once;

void setup() {
  size(1000, 500, P2D);
  background(0);
  logo = loadImage("header.gif");
  over = loadImage("over.jpg");
  pac = new pacman();
  gh = new ghost();
  pellets = new pellet();
  munch = new SoundFile(this, "sound.wav");
  death = new SoundFile(this, "pacman_death.wav");
  munch.rate(0.5);
  death.rate(0.5);
  munch.loop();
  up = false;
  down = false;
  left = false;
  right = false;
  start = false;
  pause = false;
  lives = 3;
  time = 0;
  once = true;
}

void draw() {
  if (!start) {
    textSize(30);
    text("PRESS B TO BEGIN", 350, 250);  
    image(logo, 250, 300);
    if (keyPressed == true) {
      if (key == 'b' || key == 'B') {
        start = true;
      }
    }
  } else {
    if(pause){
      fill(0);
      noStroke();
      rect(250, 215, 600, 50);
      fill(255);
      text("PRESS C TO CONTINUE OR Q TO QUIT", 250, 250);
      if(keyPressed == true){
        if(key == 'c' || key == 'C'){
          pause = false;
        }
        if(key == 'q' || key == 'Q'){
          munch.stop();
          setup();
        }
      }
    }else{
    time += 1;
    pellet_animator += 1;
    background(0);
    image(logo, 475, 0);
    fill(255);
    textSize(32);
    text("Lives: ", 500, 250);
    text(lives, 600, 250);
    text("Time: ", 500, 300);
    text("PRESS P TO PAUSE", 500, 500);
    sec = int(millis() / 1000) - sub;
    if (sec == 60) {
      min++;
      sub += 60;
    }
    //text(time / 60, 600, 300);
    text(min + ": " + sec, 600, 300);
    text("Points: ", 500, 350);
    text(pellets.point() * 100, 620, 350);
    fill(0);
    pellets.display(pac.x(), pac.y());
    //println(pellets.point());
    gh.display();
    gh.move();
    pac.display();
    //pac.autoMove();
    pac.manualMove(up, down, left, right);


    rect(725, 400, 55, 55);
    rect(780, 400, 55, 55);
    rect(780, 345, 55, 55);
    rect(835, 400, 55, 55);
    fill(0, 0, 0);
    text("a", 740, 435);
    text("s", 795, 435);
    text("w", 795, 380);
    text("d", 850, 435);

    if (keyPressed == true) {
      if(key == 'p' || key == 'P'){
        pause = true;
      }
      if (key == 'a' || key == 'A') {
        fill(0, 0, 255);
        rect(725, 400, 55, 55);
        fill(249, 250, 23);
        text("a", 740, 435);
        //pac.manualMove(false, false, true, false);
        if (pac.leftCheck()) {
          left = true;
          up = false;
          down = false;
          right = false;
        }
        //println(left);
        //  println(pac.x() + "-" + pac.y());
      }
      if ( key == 'w' || key == 'W') {
        fill(0, 0, 255);
        rect(780, 345, 55, 55);
        fill(249, 250, 23);
        text("w", 795, 380);
        //pac.manualMove(true, false, false, false);
        if (pac.upCheck()) {
          up = true;
          down = false;
          left = false; 
          right = false;
        }
      }
      if ( key == 's' || key == 'S') {
        fill(0, 0, 255);
        rect(780, 400, 55, 55);
        fill(249, 250, 23);
        text("s", 795, 435);
        //pac.manualMove(false, true, false, false);
        if (pac.downCheck()) {
          down = true;
          up = false;
          left = false;
          right = false;
        }
      }
      if ( key == 'd' || key == 'D') {
        fill(0, 0, 255);
        rect(835, 400, 55, 55);  
        fill(249, 250, 23);
        text("d", 850, 435);
        //pac.manualMove(false, false, false, true);
        if (pac.rightCheck()) {
          right = true;
          up = false;
          down = false;
          left = false;
        }
      }

      fill(249, 250, 23);
    }
    gh.display();
    gh.move();  
    maze();
    // to reset game
    //if (pac.x() == gh.x() && pac.y() == gh.y()) {
    if (pac.x() + 10 > gh.x() && pac.x() - 10 < gh.x() && pac.y() + 10 > gh.y() && pac.y() - 10 < gh.y()) {
      pac = new pacman();
      gh = new ghost();
      pellets = new pellet();
      lives--;
    }


    if (lives == 0) {
      background(0);
      this.deathScreen();
    }}
  }
}

void maze() {
  mazeEdges();
  mazeL();
  mazeThreePiece();
  mazeBoxes();
}

void mazeBoxes() {
  //BOTTOM LEFT
  rect(135, 341.25, 35, 11.25);

  //BOTTOM RIGHT
  rect(320, 341.25, -35, 11.25);

  //MIDDLE LEFT
  rect(135, 250, 15, 60);

  //MIDDLE RIGHT
  rect(320, 250, -15, 60);

  //TOP LEFT 
  rect(50, 40, 50, 30); //needs to end at 100

  //TOP MIDDLE LEFT
  rect(135, 40, 50, 30);

  //TOP MIDDLE RIGHT
  rect(270, 40, 50, 30);

  //TOP RIGHT
  rect(355, 40, 50, 30);

  //MIDDLE TOP LEFT
  rect(50, 105, 50, 15);

  //MIDDLE TOP RIGHT
  rect(355, 105, 50, 15);

  //Middle
  line(185, 205, 185, 252.5);
  line(185, 252.5, 270, 252.5);
  line(270, 252.5, 270, 205);
  line(270, 205, 185, 205);
  //rectMode(CORNERS);
  //rect(185, 205, 270, 252.5);  
  //rectMode(CORNER);
}

void deathScreen() {
  if(once){
    munch.stop();
  death.play();
  once = false;
  }
  
  image(over, 190, 0);
  fill(250);
  text("PRESS R TO RESTART", 300, 500);
  if(keyPressed == true){
    if(key == 'r' || key == 'R'){
      setup();
    }
  }
}

void mazeThreePiece() {
  //BOTTOM LEFT
  line(50, 437.5, 50, 452.5);
  line(50, 437.5, 135, 437.5);  
  line(135, 437.5, 135, 387.5);
  line(135, 387.5, 150, 387.5);
  line(150, 387.5, 150, 437.5);
  line(150, 437.5, 185, 437.5);
  line(185, 452.5, 185, 437.5);
  line(50, 452.5, 185, 452.5);

  //BOTTOM MIDDLE
  line(185, 387.5, 185, 402.5);
  line(185, 387.5, 270, 387.5);
  line(270, 387.5, 270, 402.5);
  line(270, 402.5, 235, 402.5);
  line(235, 402.5, 235, 452.5);
  line(235, 452.5, 220, 452.2);
  line(220, 452.5, 220, 402.5);
  line(220, 402.5, 185, 402.5);

  //BOTTOM RIGHT
  line(270, 452.5, 270, 437.5);
  line(270, 437.5, 305, 437.5);
  line(305, 437.5, 305, 387.5);
  line(305, 387.5, 320, 387.5);
  line(320, 387.5, 320, 437.5);
  line(320, 437.5, 405, 437.5);
  line(405, 437.5, 405, 452.5);
  line(405, 452.5, 270, 452.5);

  //MIDDLE BOTTOM
  noFill();
  beginShape();
  vertex(235, 352.5);
  vertex(220, 352.5);
  vertex(220, 302.5);
  vertex(185, 302.5);
  vertex(185, 287.5);
  vertex(270, 287.5);
  vertex(270, 302.5);
  vertex(235, 302.5);
  endShape(CLOSE);

  //MIDDLE LEFT
  beginShape();
  vertex(135, 105);
  vertex(150, 105);
  vertex(150, 155);
  vertex(185, 155);
  vertex(185, 170);
  vertex(150, 170);
  vertex(150, 215);
  vertex(135, 215);  
  endShape(CLOSE);

  //MIDDLE MIDDLE
  beginShape();
  vertex(185, 105);
  vertex(185, 120);
  vertex(220, 120);
  vertex(220, 170);
  vertex(235, 170);
  vertex(235, 120);
  vertex(270, 120);
  vertex(270, 105);  
  endShape(CLOSE);  

  //MIDDLE RIGHT
  beginShape();
  vertex(270, 170);
  vertex(270, 155);
  vertex(305, 155);
  vertex(305, 105);
  vertex(320, 105);
  vertex(320, 215);
  vertex(305, 215);
  vertex(305, 170);  
  endShape(CLOSE);





  fill(0);
}

void mazeL() {
  //BOTTOM LEFT
  line(50, 341.25, 50, 356.25);
  line(50, 341.25, 100, 341.25);
  line(50, 356.25, 85, 356.25);
  line(85, 356.25, 85, 402.5);
  line(100, 341.25, 100, 402.5);
  line(85, 402.5, 100, 402.5);

  //BOTTOM RIGHT
  line(370, 402.5, 355, 402.5);
  line(355, 402.5, 355, 341.25);
  line(355, 341.25, 405, 341.25);
  line(405, 341.25, 405, 356.25);
  line(405, 356.25, 370, 356.25);
  line(370, 356.25, 370, 402.5);
}

void mazeEdges() {
  //width of path is 35
  //5 pixels between each line
  //
  strokeWeight(2.5);
  stroke(42, 37, 227);

  //VERY TOP
  line(10, 0, 445, 0);
  line(15, 5, 220, 5);
  line(235, 5, 440, 5);
  //middle space
  line(220, 5, 220, 70);
  line(235, 5, 235, 70);
  line(220, 70, 235, 70);

  //LEFT SIDE FROM THE TOP TO THE MIDDLE
  //down 160, 150
  line(10, 0, 10, 160);
  line(15, 5, 15, 155);
  //to right 85, 85
  line(10, 160, 95, 160);
  line(15, 155, 100, 155);
  //down 50, 60
  line(95, 160, 95, 210);
  line(100, 155, 100, 215);
  //to left 85, 90
  line(95, 210, 10, 210);
  line(100, 215, 10, 215);

  //LEFT SIDE FROM THE MIDDLE TO THE BOTTOM
  //to right 90, 85
  line(10, 250, 100, 250);
  line(10, 255, 95, 255);
  //down 60, 50
  line(100, 250, 100, 310);
  line(95, 255, 95, 305);
  //to left 85, 85
  line(100, 310, 15, 310);
  line(95, 305, 10, 305);
  //down right line 115, the exteding part is 15 wide
  //    down 77.5 and 77.5
  line(15, 310, 15, 387.5);
  line(15, 402.5, 15, 487.5);
  //    to left 35
  line(15, 387.5, 50, 387.5);
  line(15, 402.5, 50, 402.5);
  line(50, 387.5, 50, 402.5);
  //down left line 125
  line(10, 305, 10, 492.5);

  //VERY BOTTOM
  line(15, 487.5, 440, 487.5);
  line(10, 492.5, 445, 492.5);

  //RIGHT SIDE FROM BOTTOM TO MIDDLE
  //up right line
  line(445, 492.5, 445, 305);
  //up left line
  //    up 77.5 and 77.5
  line(440, 487.5, 440, 402.5);
  line(440, 387.5, 440, 310);
  //    to right 35
  line(440, 402.5, 405, 402.5);
  line(440, 387.5, 405, 387.5);
  line(405, 402.5, 405, 387.5);
  //to left 85, 85
  line(440, 310, 355, 310);
  line(445, 305, 360, 305);
  //up 60, 50
  line(355, 310, 355, 250);
  line(360, 305, 360, 255);
  //to right 90, 85
  line(355, 250, 445, 250);
  line(360, 255, 445, 255);

  //RIGHT SIDE FROM MIDDLE TO TOP
  //to left 90, 85
  line(445, 215, 355, 215);
  line(445, 210, 360, 210);
  //up 60, 50
  line(355, 215, 355, 155);
  line(360, 210, 360, 160);
  //to right 85, 85
  line(355, 155, 440, 155);
  line(360, 160, 445, 160);
  //up 150, 160
  line(440, 155, 440, 5);
  line(445, 160, 445, 0);
}