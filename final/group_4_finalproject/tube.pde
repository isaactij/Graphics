class tube {

  float x, y, w, h;

  tube() {
    x = 50;
    y = 50;
    w = 100;
    h = 150;
  }

  tube(int givenX) {
    x = givenX;
    y = 230;
    w = 65;
    h = 95;
  }

  void display(int px) {
    fill(33, 234, 65);
    rect((x) + px, y, w, h);
    rect((x) + px - 5, y, w + 10, 35);
  }

  boolean inArea(int marioX, int marioY, int marioWidth, int marioHeight) {
    if ((marioX < (x) + w && marioX > (x)) || (marioX + marioWidth < (x) + w && marioX + marioWidth > (x))) {
      if (marioY > y) {
        return true;
      }
    }
    return false;
  }
}