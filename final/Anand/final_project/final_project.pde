//initial push
import processing.sound.*;
PImage background, brick, test;
int x = 0, y = 200, px = 0, brick_x, tryX = 0, time;
int start = 0;

Platform p;
Mario m;
float t;
boolean left, right, up, down, space, shift = false, music;
boolean intro, pause;
SoundFile theme;

PImage[] leftWalk;
PImage[] rightWalk;
int spriteCount;
boolean backCount;
PImage[] rightJump;
PImage[] leftJump;
int marioX;
int marioY;
int marioWidth;
int marioHeight;
boolean lastDirectionRight;


void setup() {
  size(500, 450, P2D);
  theme = new SoundFile(this, "theme.mp3"); //anand start
  music = true;
  if (music == true){
    theme.loop();}
  intro = true;
  pause = false; //anand finish
  background = loadImage("background.png");
  test = loadImage("banner.png");
  brick = loadImage("brick.jpg");
  brick.resize(30, 30);
  test.resize(500, 385);
  start = 0;
  time = 0;
  brick_x = 50;

  leftWalk = new PImage[4];
  rightWalk = new PImage[4];
  rightJump = new PImage[4];
  leftJump = new PImage[4];
  for (int i = 1; i <= 4; i++) {
    leftWalk[i - 1] = loadImage("leftWalk" + i + ".png");
    rightWalk[i-1] = loadImage("rightWalk" + i + ".png");
    rightJump[i-1] = loadImage("rightJump" + i + ".png");
    leftJump[i-1] = loadImage("leftJump" + i + ".png");
  }
  spriteCount = 0;
  backCount = false;
  right = true;
  up = false;
  marioX = 250;
  marioY = 250;
  marioWidth = 50;
  marioHeight = 80;
  lastDirectionRight = true;
  frameRate(10);
}


void draw() {

  background(255);
  pushMatrix();
  translate(px, 0);
  image(background, 0, 0);  
  image(background, background.width, 0);  
  image(background, background.width * 2, 0); 
  image(background, background.width * 3, 0);
  image(brick, 50, 200);
  int brick_x = 50;
  for (int i = 0; i < 5; i ++) {
    image(brick, brick_x, 200);
    brick_x += 31;
  }

  popMatrix();
  if (intro == false){ // anand start screen
    gameplay_screen();}
  //ellipse(100, y, 50, 50);
  gui(); //anand start screen finish

  if (start > 2) {
    if (up) {
      if (lastDirectionRight) {
        image(rightJump[spriteCount], marioX, marioY, marioWidth, marioHeight);
      } else {
        image(leftJump[spriteCount], marioX, marioY, marioWidth, marioHeight);
      }
      if (backCount) {
        spriteCount--;
        marioY += 50;
      } else {
        spriteCount++;
        marioY -= 50;
      }
      if (spriteCount >= 3) {
        backCount = true;
      } else {
        if (spriteCount <= 0) {
          backCount = false;
          up = false;
        }
      }
    } else {
      if (lastDirectionRight) {
        image(rightWalk[spriteCount], marioX, marioY, marioWidth, marioHeight);
      } else {
        image(leftWalk[spriteCount], marioX, marioY, marioWidth, marioHeight);
      }
    }

    if (keyPressed == true) {
      if (keyCode == RIGHT) { //move right
        if (up && lastDirectionRight) {
          lastDirectionRight = false;
        } else {
          if (!up) {
            lastDirectionRight = true;
            tryX += 1;
            px -= 10;
            right = true;    
            if (backCount) {
              spriteCount--;
            } else {
              spriteCount++;
            }
            if (spriteCount >= 3) {
              backCount = true;
            } else {
              if (spriteCount <= 0) {
                backCount = false;
              }
            }
          }
        }
      } else if (keyCode == LEFT) { //move left
        if (up && lastDirectionRight) {
          lastDirectionRight = true;
        } else {
          if (!up) {
            lastDirectionRight = false;
            px += 10;
            right = false;
            if (backCount) {
              spriteCount--;
            } else {
              spriteCount++;
            }
            if (spriteCount >= 3) {
              backCount = true;
            } else {
              if (spriteCount <= 0) {
                backCount = false;
              }
            }
          }
        }
      } else {
        if (keyCode == UP) {
          if (!up) {
            spriteCount = 0;
            backCount = false;
          }
          up = true;
          px += 0;
        }
      }
    }
    //print(px + " ");
    if (px > 0) {
      px = 0;
    }
    if (px < -1900) {
      px = -1900;
    }
    //print("x ", mouseX);
  }
  }

void gameplay_screen(){ // anand gameplay screen start
  fill(0);
  textSize(15);
  text("Time: ", 10, 400);
  text(time, 54, 400);
    if (intro == false){
      time += 1;}
  if (keyPressed == true){
    if (key == 'p' || key == 'P'){
      pause = true;}
    else if (key == 'v' || key == 'V'){
      if (music == true){
      music = false;}
      else{music = true;}}}
  
  text("Music: ", 10, 420);
  if (music == true){
    theme.amp(1);
    text("ON", 60, 420);}
  else{
    theme.amp(0);
    text("OFF", 60, 420);}
  
  
} //anand gameplay finish
  

void gui() {  //anand gui start
    if (start == 0) {
      textSize(25);
      image(test, px, 0);

      text("PRESS B TO BEGIN", 120, 250);
      if (keyPressed == true) {
        if (key == 'b' || key == 'B') {
          start += 1;
        }
      }
    }

    if (start == 1) {
      image(background, 0, 0);
      textSize(18);
      text("This game uses arrow keys to move your Mario.\nUse the right arrow to move right.\nUse the left arrow to move left.\nUse the up arrow to jump up.\n\nPress N to move to the next slide", 10, 170);
      if (keyPressed == true) {
        if (key == 'n' || key == 'N') {
          start += 1;
        }
      }
    }  
    else if (start == 2) {
      image(background, 0, 0);
      textSize(18);
      text("Press P to pause the game.\n\nPress V to toggle background volume.\n\nPress SPACE to begin the game.", 10, 200);
      if (keyPressed == true) {
        if (key == ' ') {
          start += 1;
          intro = false;
        }
      }
    } // end of start == 2
    else if (pause == true){
      theme.amp(0);
      fill(255);
      noStroke();
      rect(0, 0, 500, 385);
      fill(0);
      textSize(20);
      text("Press C to continue.\nPress Q to quit.", 150, 200);
      time += -1;
      if (keyPressed == true){
        if (key == 'c' || key == 'C'){
          pause = false;
          theme.amp(1);}
        else if (key == 'q' || key == 'Q'){
          intro = true;
          px = 0;
          setup();}
        }

    }
} //anand gui finish

  //void keyPressed() {
  //  switch (keyCode) {
  //  case 37://left
  //    left = true;
  //    lastDirectionRight = false;
  //    if (backCount) {
  //      spriteCount--;
  //    } else {
  //      spriteCount++;
  //    }
  //    if (spriteCount == 3) {
  //      backCount = true;
  //    } else {
  //      if (spriteCount == 0) {
  //        backCount = false;
  //      }
  //    }
  //    break;
  //  case 39://right
  //    tryX += 1;
  //    right = true;
  //    lastDirectionRight = true;
  //    if (backCount) {
  //      spriteCount--;
  //    } else {
  //      spriteCount++;
  //    }
  //    if (spriteCount == 3) {
  //      backCount = true;
  //    } else {
  //      if (spriteCount == 0) {
  //        backCount = false;
  //      }
  //    }
  //    break;
  //  case 38://up
  //    up = true;
  //    break;
  //  case 40://down
  //    down = true;
  //    break;
  //  case 32: //space
  //    space = true;
  //    break;
  //  case 16: //shift
  //    shift = true;
  //  }
  //}
  //void keyReleased() {
  //  switch (keyCode) {
  //  //case 37://left
  //  //  left = false;
  //  //  break;
  //  //case 39://right
  //  //  right = false;
  //  //  break;
  //  //case 38://up
  //  //  up = false;
  //  //  break;
  //  case 40://down
  //    down = false;
  //    break;
  //  case 32: //space
  //    space = false;
  //    break;
  //  case 16: //shift
  //    shift = false;
  //  }
  //}