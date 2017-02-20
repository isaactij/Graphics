class ghost{
  float x, y;
  
  
  ghost(){
    x = 215;
    y = 215;
  }
  
  ghost(float startX, float startY){
    
    x = startX;
    y = startY;
  }
  
  void display(){
    PShape ghost1 = createShape(GROUP);
    PShape body = createShape();
    PShape eyeLeft = createShape(ELLIPSE, 30, 40, 20, 20);
    PShape eyeRight = createShape(ELLIPSE, 70, 40, 20, 20);
    PShape pupilLeft = createShape(ELLIPSE, 30, 40, 10, 10);
    PShape pupilRight = createShape(ELLIPSE, 70, 40, 10, 10);
    
    pupilLeft.setFill(color(0));
    pupilRight.setFill(color(0));
    
    eyeLeft.setFill(color(255));
    eyeLeft.setStroke(false);
    eyeRight.setFill(color(255));
    eyeRight.setStroke(false);
    
    body.beginShape();
    body.fill(255, 50, 50);
    body.vertex(0, 100);
    body.vertex(0, 30);
    body.curveVertex(0, 30);
    body.curveVertex(0, 25);
    body.curveVertex(50, 0);
    body.curveVertex(100, 25);
    body.curveVertex(100, 30);
    body.vertex(100, 30);
    body.vertex(100, 100);
    body.endShape();
    
    ghost1.addChild(body);
    ghost1.addChild(eyeLeft);
    ghost1.addChild(eyeRight);
    ghost1.addChild(pupilLeft);
    ghost1.addChild(pupilRight);
    
    shape(ghost1, x, y, 20, 20);
  }
  
  void moveX(){
    x++;

  }
  
  void moveY(){
    y++;
  }
}