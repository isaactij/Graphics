class Fireball extends Mario {

  float x, y;
  boolean isRight, isLeft, toggle;
  PImage fireball;

  float i = .01, lerpx;

  Fireball() {
    super();
    toggle = false;
    fireball = loadImage("fireball.png");
    fireball.resize(15, 15);
    x = m.x();
    y = m.y();
  }

  void display() {
    if (toggle == true) {
      if (m.lastDirectionRight == true) {
        if (i < 1) {
          lerpx = lerp(m.x(), m.x() + 175, i);
          image(fireball, lerpx, m.y() + 20);
          i = i + .05;
          //print(lerpx + " ");}
        } else {
          toggle = false;
          image(fireball, lerpx, m.y() + 20);
          i = .01;
        }
      } else {
        if (i < 1) {
          lerpx = lerp(m.x(), m.x() - 175, i);
          image(fireball, lerpx, m.y() + 20);
          i = i + .05;
        } else {
          toggle = false;
          image(fireball, lerpx, m.y() + 20);
          i = .01;
        }
      }
    }
  }

  float fball_x() {
    if (!toggle) {
      return 10000;
    }
    return lerpx;
  }

  float fball_y() {
    return (m.y() + 20);
  }
  
  void unToggle(){
    toggle = false;
     i = .01;
  }
}