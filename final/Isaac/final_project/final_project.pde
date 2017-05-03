//initial push //<>//
PImage background, brick, test;
int x = 0, y = 200, px = 0, brick_x, tryX = 0;
int start = 0;

platform p;
Mario m;
float t;
boolean left, right, up, down, space, shift = false;

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
  size(500, 385, P2D);
  background = loadImage("background.png");
  test = loadImage("banner.png");
  brick = loadImage("brick.jpg");
  brick.resize(30, 30);
  test.resize(500, 385);
  start = 0;
  brick_x = 50;

  leftWalk = new PImage[4];
  rightWalk = new PImage[4];
  rightJump = new PImage[4];
  leftJump = new PImage[4];
  for (int i = 1; i <= 4; i++) {
    PImage buff = loadImage("leftWalk" + i + ".png");
    leftWalk[i - 1] = createImage(buff.width, buff.height, ARGB);
    for (int j = 0; j < buff.width; j++) {
      for (int l = 0; l < buff.height; l++) {
        if (green(buff.pixels[j + l * buff.width]) == 255 && red(buff.pixels[j + l * buff.width]) == 255 && blue(buff.pixels[j + l * buff.width]) == 255) {
          leftWalk[i - 1].pixels[j + l * leftWalk[i - 1].width] = color(255, 0);
        } else {
          leftWalk[i - 1].pixels[j + l * leftWalk[i - 1].width] = color(red(buff.pixels[j + l * buff.width]), green(buff.pixels[j + l * buff.width]), blue(buff.pixels[j + l * buff.width]));
        }
      }
    }
    leftWalk[i - 1].updatePixels();

    buff = loadImage("rightWalk" + i + ".png");
    rightWalk[i-1] = createImage(buff.width, buff.height, ARGB);
    for (int j = 0; j < buff.width; j++) {
      for (int l = 0; l < buff.height; l++) {
        if (green(buff.pixels[j + l * buff.width]) == 255 && red(buff.pixels[j + l * buff.width]) == 255 && blue(buff.pixels[j + l * buff.width]) == 255) {
          rightWalk[i - 1].pixels[j + l * rightWalk[i - 1].width] = color(255, 0);
        } else {
          rightWalk[i - 1].pixels[j + l * rightWalk[i - 1].width] = color(red(buff.pixels[j + l * buff.width]), green(buff.pixels[j + l * buff.width]), blue(buff.pixels[j + l * buff.width]));
        }
      }
    }
    rightWalk[i - 1].updatePixels();


    buff = loadImage("rightJump" + i + ".png");
    rightJump[i-1] = createImage(buff.width, buff.height, ARGB);
    for (int j = 0; j < buff.width; j++) {
      for (int l = 0; l < buff.height; l++) {
        if (green(buff.pixels[j + l * buff.width]) == 255 && red(buff.pixels[j + l * buff.width]) == 255 && blue(buff.pixels[j + l * buff.width]) == 255) {
          rightJump[i - 1].pixels[j + l * rightJump[i - 1].width] = color(255, 0);
        } else {
          rightJump[i - 1].pixels[j + l * rightJump[i - 1].width] = color(red(buff.pixels[j + l * buff.width]), green(buff.pixels[j + l * buff.width]), blue(buff.pixels[j + l * buff.width]));
        }
      }
    }
    rightJump[i - 1].updatePixels();

    buff = loadImage("leftJump" + i + ".png");
    leftJump[i-1] = createImage(buff.width, buff.height, ARGB);
    for (int j = 0; j < buff.width; j++) {
      for (int l = 0; l < buff.height; l++) {
        if (green(buff.pixels[j + l * buff.width]) == 255 && red(buff.pixels[j + l * buff.width]) == 255 && blue(buff.pixels[j + l * buff.width]) == 255) {
          leftJump[i - 1].pixels[j + l * leftJump[i - 1].width] = color(255, 0);
        } else {
          leftJump[i - 1].pixels[j + l * leftJump[i - 1].width] = color(red(buff.pixels[j + l * buff.width]), green(buff.pixels[j + l * buff.width]), blue(buff.pixels[j + l * buff.width]));
        }
      }
    }
    leftJump[i - 1].updatePixels();
  }

  

  spriteCount = 0;
  backCount = false;
  right = true;
  up = false;
  marioX = 250;
  marioY = 285;
  marioWidth = 30;
  marioHeight = 40;
  lastDirectionRight = true;
  frameRate(10);

  //int[] temp = {(1), (3), (-1), (-1)};
  p = new platform(750, 200, 4, 2);
}


void draw() {

  background(0);
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
  //ellipse(100, y, 50, 50);
  gui();

  p.display(px);
  platformAreaCheck();
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
  }
}

void gui() {  
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
    text("This game uses ASDW to move your Mario character.\nUse the right arrow to move right, the left arrow to move left, and the up arrow to jump up.\n\nPress N to move to the next slide", 10, 200);
    if (keyPressed == true) {
      if (key == 'n' || key == 'N') {
        start += 1;
      }
    }
  }  
  if (start == 2) {
    image(background, 0, 0);
    textSize(18);
    text("Press P to pause the game.\n\nPress V to toggle background volume.\n\nPress SPACE to begin the game.", 10, 200);
    if (keyPressed == true) {
      if (key == ' ') {
        start += 1;
      }
    }
  }
}

void platformAreaCheck() {
  if (p.inArea(marioX, marioY, marioWidth, marioHeight) == 1) {
    backCount = true;
  } else {
    if (p.inArea(marioX, marioY, marioWidth, marioHeight) == 2) {
      backCount = true;
    }
  }
}

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