class Flag {

  float w, h, x, y;


  Flag() {

    w = 20;
    h = 20;
    x = 50;
    y = 200;
  }


  void display(int px) {
    rect(2700+px, 125, 10, 200);
    fill(255, 255, 0);
    ellipse(2705 + px, 125, 30, 30);
    fill(0);
    text("M", 2699 +px, 129);
  }
}