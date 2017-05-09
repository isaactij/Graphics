class platform {
  float x, y, w, h;
  int numOfBlocks, numOfMysteryBoxes;
  boolean displayCoin;
  //int[] positionOfMysteryBoxes;
  PImage coin;
  int disCoinCount;
  float coinY;
  float coinX;
  boolean coinDown;
  int[] numOfCoins;

  platform(float xPos, float yPos, int givenNumOfBlocks, int givenNumOfMysteryBoxes) {
    x = xPos;
    y = yPos;
    w = 40;
    h = 40;
    numOfBlocks = givenNumOfBlocks;
    numOfMysteryBoxes = givenNumOfMysteryBoxes;
    //positionOfMysteryBoxes = givenPositionOfMysteryBoxes;
    PImage buff = loadImage("coin.png");
    coin = createImage(buff.width, buff.height, ARGB);
    for (int j = 0; j < buff.width; j++) {
      for (int l = 0; l < buff.height; l++) {
        if (green(buff.pixels[j + l * buff.width]) == 255 && red(buff.pixels[j + l * buff.width]) == 255 && blue(buff.pixels[j + l * buff.width]) == 255) {
          coin.pixels[j + l * coin.width] = color(255, 0);
        } else {
          coin.pixels[j + l * coin.width] = color(red(buff.pixels[j + l * buff.width]), green(buff.pixels[j + l * buff.width]), blue(buff.pixels[j + l * buff.width]));
        }
      }
    }
    coin.updatePixels();
    disCoinCount = 0;
    coinDown = false;
    numOfCoins = new int[givenNumOfBlocks];
    for (int i = 0; i < givenNumOfBlocks; i++) {
      numOfCoins[i] = int(random(1, 5));
    }
  }

  void display(int px) {
    if (displayCoin) {
      image(coin, coinX + 10, y + coinY, 20, 20);
      if (!coinDown) {
        coinY -= 20;
      } else {
        coinY += 20;
      }
      if (coinY <= -50) {
        coinDown = true;
      } else {
        if (coinY >= 0) {
          coinDown = false;
          displayCoin = false;
        }
      }
    }

    for (int i = 0; i < numOfBlocks; i++) {
      if (i % 2 == 1) {
        if (numOfCoins[i] > 0) {
          fill(245, 199, 32);
          rect((x + i * w) + px, y, w, h);
        } else {
          fill(85, 57, 4);
          rect((x + i * w) + px, y, w, h);
        }
      } else {
        if (numOfCoins[i] > 0) {
          fill(85, 57, 4);
          rect((x + i * w) + px, y, w, h);
          stroke(0);
          strokeWeight(3);
          line((x + i * w) + px + (w / 2), y + 2, (x + i * w) + px + ( w / 2), y + h);
          line((x + i * w) + px + 2, y + h / 2, (x + i * w) + px + w, y + h / 2);
          strokeWeight(1);
        } else {
          fill(85, 57, 4);
          rect((x + i * w) + px, y, w, h);
        }
      }
    }
  }

  int inArea(int marioX, int marioY, int marioWidth, int marioHeight) {
    for (int i = 0; i < numOfBlocks; i++) {
      if ((marioX < (x + i * w) + px + w && marioX > (x + i * w) + px) || (marioX + marioWidth < (x + i * w) + px + w && marioX + marioWidth > (x + i * w) + px)) {
        //if (marioY > y && marioY < y + h && marioY + marioHeight > y && marioY + marioHeight < y + h) {
        if (marioY > y && marioY < y + h) {
          if (i % 2 == 1) {
            //println(1);
            if (numOfCoins[i] > 0) {
              numOfCoins[i]--;
              println(numOfCoins[i]);
              coinY = 0;
              coinX = x + i * w + px;
              displayCoin = true;
            }
            return 2;
          } else {
            if (numOfCoins[i] > 0) {
              numOfCoins[i]--;
              println(numOfCoins[i]);
              displayCoin = true;
              coinY = 0;
              coinX = x + i * w + px;
            }
            return 1;
          }
        }
      }
    }
    return 0;
  }
}