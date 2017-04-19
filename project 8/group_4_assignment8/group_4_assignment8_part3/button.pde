class button {

  int x;
  int y;
  int r;
  color c;

  button() {
    x = 0;
    y = 0;
    r = 0;
    c = color(0);
  }

  button(int givenX, int givenY, int givenR, color givenC) {
    x = givenX;
    y = givenY;
    r = givenR;
    c = givenC;
  }

  boolean inArea(int xpos, int ypos) {
    if ((xpos <= x + r && xpos >= x - r) && (ypos <= y + r && ypos >= y - r)) {
      return true;
    } else {
      return false;
    }
  }
  
  void display(String text){
    fill(c);
    ellipse(x, y, textWidth(text) + 10, r);
    fill(0);
    text(text, x - (textWidth(text) / 2), y + 5);
  }

  int x() {
    return x;
  }

  int y() {
    return y;
  }

  int r() {
    return r;
  }
}