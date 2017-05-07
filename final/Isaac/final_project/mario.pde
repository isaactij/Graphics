class Mario { //<>// //<>//

  float w, h, x, y, vx, vy, accelX, accelY, speedLimit, friction, bounce, gravity;
  float jumpForce = -5;
  boolean isOnGround;
  int px;

  boolean lastDirectionRight;
  int spriteCount;
  boolean backCount;
  boolean up, right;
  PImage[] leftWalk;
  PImage[] rightWalk;
  PImage[] rightJump;
  PImage[] leftJump;

  Mario() {

    w = 50;
    h = 50;
    x = 50; 
    y = 200;
    vx = 0;
    vy = 0;
    accelX = 0;
    accelY = 0;
    speedLimit = 0;

  //  spriteCount = 0;
  //  backCount = false;
   // right = true;
   // up = false;
    lastDirectionRight = true;
   // setUpSprite();
  }

  Mario(int givenW, int givenH, int givenX, int givenY) {
    w = givenW;
    h = givenH;
    x = givenX;
    y = givenY;
    vx = 0;
    vy = 0;
    accelX = 0;
    accelY = 0;
    speedLimit = 0;

 //   spriteCount = 0;
 //   backCount = false;
  //  right = true;
   // up = false;
    lastDirectionRight = true;
    //setUpSprite();
  }

  //Returns px to update the map in the main
  int update(boolean givenUp, boolean left, boolean right, int px) {  
    if (givenUp) {
      vy += -50;
      friction = 1;
      //print('x');
      //sprite stuff
      //if (!up) {
      //  spriteCount = 0;
     //   backCount = false;
      //}
      //up = true;
     // px += 0;
    }
    if (left) {
      // vx =-5;
      accelX = -0.2;
      friction = 1;
      // if(currentFrame <= startLeft){currentFrame=startLeft;}

      //sprite stuff
      /*
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
      */
      
    }
    if (right) {
      // vx =5;
      accelX = 0.2;
      friction = 1;

      //sprite stuff
      
      /*
      if (up && lastDirectionRight) {
        lastDirectionRight = false;
      } else {
        if (!up) {
          lastDirectionRight = true;
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
      */
    }
    if (!left&&!right) {
      // vx=0;
      accelX = 0;
      friction = 0.96;
      gravity = 0.3;
    } else if (left&&right) {
      // vx=0;
      accelX = 0;
      friction = 0.96;
      gravity = 0.3;
    }

    if (vy < -5) {
      vy = -5;
    }

    vx += accelX;
    vy += accelY;
    vy += gravity;
    y += vy;
    px-=vx;
    y+=vy;

    if (y > 300) {
      y = 300;
    }
    return px;
  }

  void display() {
    
  fill(255,0,0);
  rect(x,y,w,h);

    
    /*
    if (up) {
      if (lastDirectionRight) {
        image(rightJump[spriteCount], x, y, w, h);
      } else {
        image(leftJump[spriteCount], x, y, w, h);
      }
      if (backCount) {
        spriteCount--;
        y += 50;
      } else {
        spriteCount++;
        y -= 50;
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
        image(rightWalk[spriteCount], x, y, w, h);
      } else {
        image(leftWalk[spriteCount], x, y, w, h);
      }
    }
    */
  }

  /*
  void setUpSprite() {
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
  }
  */
  
  boolean inArea(int givenX, int givenY, int givenW, int givenH){
    if ((givenX < x + w && givenX > x) || (givenX + givenW < x + w && givenX + givenW > x)) {
      if ((givenY < y + h && y > y) || (givenY + givenH < y + h && givenY + givenH > y)) {
        return true;
      }
    }
    return false;
  }

  int x() {
    return int(x);
  }

  int y() {
    return int(y);
  }

  int w() {
    return int(w);
  }

  int h() {
    return int(h);
  }

  void backCount() {
    backCount = true;
  }
  
  
}