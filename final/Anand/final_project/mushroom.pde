class mushroom {

  float w, h, x, y;
  PImage leftWalk, rightWalk;
  boolean left;

  mushroom() {
    w = 20;
    h = 20;
    x = 50; 
    y = 200;
  }

  mushroom(float givenX, float givenY) {
    x = givenX;
    y = givenY;
    w = 30;
    h = 30;
    setUpSprite();
    left = true;
  }

  void move() {
    if (left) {
      x -= 5;
    } else {
      x += 5;
    }
  }

  void display(int px) {
    if (!left) {
      image(rightWalk, x + px, y, w, h);
    } else {
      image(leftWalk, x + px, y, w, h);
    }
  }

  void setUpSprite() {
    leftWalk = new PImage();
    rightWalk = new PImage();
    PImage buff = loadImage("mushroomLeft.png");
    leftWalk = createImage(buff.width, buff.height, ARGB);
    for (int j = 0; j < buff.width; j++) {
      for (int l = 0; l < buff.height; l++) {
        if (green(buff.pixels[j + l * buff.width]) == 255 && red(buff.pixels[j + l * buff.width]) == 255 && blue(buff.pixels[j + l * buff.width]) == 255) {
          leftWalk.pixels[j + l * leftWalk.width] = color(255, 0);
        } else {
          leftWalk.pixels[j + l * leftWalk.width] = color(red(buff.pixels[j + l * buff.width]), green(buff.pixels[j + l * buff.width]), blue(buff.pixels[j + l * buff.width]));
        }
      }
    }
    leftWalk.updatePixels();

    buff = loadImage("mushroomRight.png");
    rightWalk = createImage(buff.width, buff.height, ARGB);
    for (int j = 0; j < buff.width; j++) {
      for (int l = 0; l < buff.height; l++) {
        if (green(buff.pixels[j + l * buff.width]) == 255 && red(buff.pixels[j + l * buff.width]) == 255 && blue(buff.pixels[j + l * buff.width]) == 255) {
          rightWalk.pixels[j + l * rightWalk.width] = color(255, 0);
        } else {
          rightWalk.pixels[j + l * rightWalk.width] = color(red(buff.pixels[j + l * buff.width]), green(buff.pixels[j + l * buff.width]), blue(buff.pixels[j + l * buff.width]));
        }
      }
    }
    rightWalk.updatePixels();
  }

  // boolean inArea(int marioX, int marioY, int marioWidth, int marioHeight) {
  //   if ((marioX < (x) + w && marioX > (x)) || (marioX + marioWidth < (x) + w && marioX + marioWidth > (x))) {
  //     if ((marioY < y + h && marioY > y) || (marioY + marioHeight < y + h && marioY + marioHeight > y)) {
  //       return true;
  //     }
  //   }
  //   return false;
  // }

  void turn() {
    left = !left;
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
}