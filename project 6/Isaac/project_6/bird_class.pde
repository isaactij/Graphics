class bird {

  float x1;
  float y1;
  float x2;
  float y2;
  PShape b;
  float x3;
  float y3;
  float x4;
  float y4;
  //float x5;
  //float y5;
  //float x6;
  //float y6;
  boolean backx;
  boolean backy;

  bird() {
    x1 = 50;
    y1 = 50;
    x2 = 55;
    y2 = 50;
    x3 = 60;
    y3 = 50;
    x4 = 65;
    y4 = 50;
    //x5 = 70;
    //y5 = 50;
    //x6 = 75;
    //y6 = 50;
    
    b = createShape();
    b.beginShape();
    b.noFill();
    b.vertex(-5, -5);
    b.vertex(0, 0);
    b.vertex(5, -5);
    b.endShape();
    
    backx = false;
    backy = false;
  }

  void drawbirds() {
    text("1", x1, y1);
    fill(255, 0, 0);
    //shape(b, x1, y1);
    text("2", x2, y2);
    //shape(b, x2, y2);
    text("3", x3, y3);
    //shape(b, x3, y3);
    text("4", x4, y4);
    //shape(b, x4, y4);
  }

  void movebirds() {
    
    if(x1 == 500){
      backx = true;
    }
    if(y1 == 500){
      backy = true;
    }
    if(x1 == 0){
      backx = false;
    }
    if(y1 == 0){
      backy = false;
    }
    if(!backx){
      x1++;
    }else{ x1--;}
    if(!backy){
      y1++;
    }else{y1--;}
    movebird2();
    movebird3();
    movebird4();
  }

  void movebird2() {
    float distX = x2 - x1;
    float distY = y2 - y1;
    if ((0 <= distX && distX <= 10) && (0 <= distY && distY < 10)) {
      if (distX > distY) {
        x2++;
      } else {
        y2++;
      }
    }

    if ((0 <= distX && distX <= 10) && (distY < 0 && distY > -10)) {
      if (Math.abs(distX) > Math.abs(distY)) {
        x2++;
      } else {
        y2++;
      }
    }

    if ((distX < 0 && distX > -10) && (distY < 0 && distY > -10)) {
      if (distX < distY) {
        x2++;
      } else {
        y2++;
      }
    }

    if ((distX < 0 && distX > -10) && (0 <= distY && distY < 10)) {
      if (Math.abs(distX) < Math.abs(distY)) {
        x2++;
      } else {
        y2++;
      }
    }

    if (distX > 10 && distY > 10) {
      x2--;
      y2--;
    }
    if (distX > 10 && distY > -10 && distY < 10) {
      x2--;
    }
    if (distX > 10 && distY < -10) {
      x2--;
      y2++;
    }
    if (distX < 10 && distX > -10 && distY < -10) {
      y2++;
    }
    if (distX < -10 && distY < -10) {
      x2++;
      y2++;
    }
    if (distX < -10 && distY > -10 && distY < 10) {
      x2++;
    }
    if (distX < -10 && distY > 10) {
      x2++;
      y2--;
    }
    if (distY > 10 && distX < 10 && distX > -10 ) {
      y2--;
    }
  }

  void movebird3() {
    float distX;
    float distY;
    for (int i = 0; i < 2; i++) {
      if (i ==0) {
        distX = x3 - x2;
        distY = y3 - y2;
      } else {
        distX = x3 - x1;
        distY = y3 - y1;
      }
      if ((0 <= distX && distX <= 10) && (0 <= distY && distY < 10)) {
        if (distX > distY) {
          x3++;
        } else {
          y3++;
        }
      }

      if ((0 <= distX && distX <= 10) && (distY < 0 && distY > -10)) {
        if (Math.abs(distX) > Math.abs(distY)) {
          x3++;
        } else {
          y3++;
        }
      }

      if ((distX < 0 && distX > -10) && (distY < 0 && distY > -10)) {
        if (distX < distY) {
          x3++;
        } else {
          y3++;
        }
      }

      if ((distX < 0 && distX > -10) && (0 <= distY && distY < 10)) {
        if (Math.abs(distX) < Math.abs(distY)) {
          x2++;
        } else {
          y2++;
        }
      }

      if (distX > 10 && distY > 10) {
        x3--;
        y3--;
      }
      if (distX > 10 && distY > -10 && distY < 10) {
        x3--;
      }
      if (distX > 10 && distY < -10) {
        x3--;
        y3++;
      }
      if (distX < 10 && distX > -10 && distY < -10) {
        y3++;
      }
      if (distX < -10 && distY < -10) {
        x3++;
        y3++;
      }
      if (distX < -10 && distY > -10 && distY < 10) {
        x3++;
      }
      if (distX < -10 && distY > 10) {
        x3++;
        y3--;
      }
      if (distY > 10 && distX < 10 && distX > -10 ) {
        y3--;
      }
    }
  }

  void movebird4() {
    float distX = 1;
    float distY = 1;
    int i = 0;
    boolean change = false;
    float distb1 = dist(x4, y4, x1, y1);
    float distb2 = dist(x4, y4, x2, y2);
    float distb3 = dist(x4, y4, x3, y3);
    //if (distb1 < distb2 && distb1 < distb3) {
    //  distX = x4 - x1;
    //  distY = y4 - y1;
    //}
    //if (distb2 < distb1 && distb2 < distb3) {
    //  distX = x4 - x2;
    //  distY = y4 - y2;
    //}
    //if(distb3 < distb1 && distb3 < distb2){
    //  distX = x4 - x3;
    //    distY = y4 - y3;
    //}
    //if(distb1 ==10 && distb2==10&&distb3==10){
    //  return;
    //}
    while (i < 3 && !change) {
      if (i ==0) {
        distX = x4 - x3;
        distY = y4 - y3;
      } else {
        if (i == 1) {
          distX = x4 - x2;
          distY = y4 - y2;
        } else {
          distX = x4 - x1;
          distY = y4 - y1;
        }
      }
      if ((0 <= distX && distX <= 10) && (0 <= distY && distY < 10)) {
        if (distX > distY) {
          x4++;
        } else {
          y4++;
        }
        change = true;
      }

      if ((0 <= distX && distX <= 10) && (distY < 0 && distY > -10)) {
        if (Math.abs(distX) > Math.abs(distY)) {
          x4++;
        } else {
          y4++;
        }
        change = true;
      }

      if ((distX < 0 && distX > -10) && (distY < 0 && distY > -10)) {
        if (distX < distY) {
          x4++;
        } else {
          y4++;
        }
        change = true;
      }

      if ((distX < 0 && distX > -10) && (0 <= distY && distY < 10)) {
        if (Math.abs(distX) < Math.abs(distY)) {
          x2++;
        } else {
          y2++;
        }
        change = true;
      }

      if (distX > 10 && distY > 10) {
        x4--;
        y4--;
        change = true;
      }
      if (distX > 10 && distY > -10 && distY < 10) {
        x4--;
        change = true;
      }
      if (distX > 10 && distY < -10) {
        x4--;
        y4++;
        change = true;
      }
      if (distX < 10 && distX > -10 && distY < -10) {
        y4++;
        change = true;
      }
      if (distX < -10 && distY < -10) {
        x4++;
        y4++;
        change = true;
      }
      if (distX < -10 && distY > -10 && distY < 10) {
        x4++;
        change = true;
      }
      if (distX < -10 && distY > 10) {
        x4++;
        y4--;
        change = true;
      }
      if (distY > 10 && distX < 10 && distX > -10 ) {
        y4--;
        change = true;
      }
      i++;
    }
  }

  float birdX() {
    return x1;
  }

  float birdY() {
    return y1;
  }

  void movebird() {
  }
}