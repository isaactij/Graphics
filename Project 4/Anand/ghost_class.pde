class ghost{
  float x, y, xPrev;
  int lastStep;
  int path[][];  
  boolean left, right, up, down;
  PShape ghost1;
  
  
  ghost(){
    x = 227.5;
    y = 208;
    writePath();
    lastStep = 4;
    
    
  }
  
  ghost(float startX, float startY){
    
    x = startX;
    y = startY;
  }
  

  
  float x(){
    return x;
  }
  
  float y(){
    return y;
  }
  
  void writePath(){
    path = new int[4600][5000];
    
    //float point = 228.5; 
    //for(float i = 190; i <= 265; i += 0.5){
    //  path[int(i * 10)][int(point * 10)] = 1;
    //}
    
    float point = 227.5;
    for(float i = 228.5; i >= 187.5; i -= 0.5){
      path[int(point * 10)][int(i * 10)] = 1;
    }
    
    
    //(32.5, 22.5) to left  ******************************************************************************************
    point = 22.5;
    for(float i = 32.5; i <= 202.5; i += 0.5){
      path[int(i * 10)][int(point * 10)] = 1;
    }
    //(252.5, 22.5) to left  ******************************************************************************************
    point = 22.5;
    for(float i = 237.5; i <= 422.5; i += 0.5){
      path[int(i * 10)][int(point * 10)] = 1;
    }
    //(422.5, 22.5) down
    point = 422.5;
    for(float i = 22.5; i <= 142.5; i += 0.5){
      path[int(point * 10)][int(i * 10)] = 1;
    }
    //(422.5, 142.5) to right
    point = 142.5;
    for(float i = 422.5; i >= 337.5; i -= 0.5){
      path[int(i * 10)][int(point * 10)] = 1;
    }
    //(237.5, 22.5) down
    point = 237.5;
    for(float i = 22.5; i <= 87.5; i += 0.5){
      path[int(point * 10)][int(i * 10)] = 1;
    }
    //(287.5, 87.5) down  ****************************************************************************
    point = 282.5;
    for(float i = 87.5; i <= 137.5; i += 0.5){
      path[int(point * 10)][int(i * 10)] = 1;
    }
    //(287.5, 137.5) to right  ***********************************************************************
    point = 117.5;
    for(float i = 287.5; i >= 252.5; i -= 0.5){
      path[int(i * 10)][int(point * 10)] = 1;
    }
    //(252.5, 137.5) down  ****************************************************************************
    point = 252.5;
    for(float i = 137.5; i <= 187.5; i += 0.5){
      path[int(point * 10)][int(i * 10)] = 1;
    }    
    //(32.5, 22.5) down  **************************************************************************************
    point = 32.5;
    for(float i = 22.5; i <= 137.5; i += 0.5){
      path[int(point * 10)][int(i * 10)] = 1;
    }
    //(32.5, 87.5) to left  ***************************************************************************
    point = 87.5;
    for(float i = 32.5; i <= 422.5; i += 0.5){
      path[int(i * 10)][int(point * 10)] = 1;
    }
    //(32.5, 137.5) to left  *********************************************************************************
    point = 137.5;
    for(float i = 32.5; i <= 117.5; i += 0.5){
      path[int(i * 10)][int(point * 10)] = 1;
    }
    //(117.5, 22.5) down  **************************************************************************************
    point = 117.5;
    for(float i = 22.5; i <= 412.5; i += 0.5){
      path[int(point * 10)][int(i * 10)] = 1;
    }
    //(337.5, 22.5) down  ***************************************************************************************************
    point = 337.5;
    for(float i = 22.5; i <= 412.5; i += 0.5){
      path[int(point * 10)][int(i * 10)] = 1;
    }    
    //(202.5, 22.5) down
    point = 202.5;
    for(float i = 22.5; i <= 87.5; i += 0.5){
      path[int(point * 10)][int(i * 10)] = 1;
    }
    //(167.5, 87.5) down  *****************************************************************************************
    point = 167.5;
    for(float i = 87.5; i <= 137.5; i += 0.5 ){
      path[int(point * 10)][int(i * 10)] = 1;
    }
    //(167.5, 137.5) to left  ****************************************************************************************
    point = 137.5;
    for(float i = 167.5; i <= 202.5; i += 0.5){
      path[int(i * 10)][int(point * 10)] = 1;
    }
    //(202.5, 137.5) down  **********************************************************************************
    point = 202.5;
    for(float i = 137.5; i <= 187.5; i += 0.5){
      path[int(point * 10)][int(i * 10)] = 1;
    }
    //(167.5, 187.5) to left  *****************************************************************************
    point = 187.5;
    for(float i = 167.5; i <= 287.5; i += 0.5){
      path[int(i * 10)][int(point * 10)] = 1;
    }
    //(287.5, 187.5) down  *****************************************************************************************
    //this is suppose to go down to 323.75, but to make it easier
    point = 287.5;
    for(float i = 187.5; i <= 323.5; i += 0.5){
      path[int(point * 10)][int(i * 10)] = 1;
    }
    //(167.5, 187.5) down  *********************************************************************************************
    //this is suppose to go down to 323.75, but to make it easier
    point = 167.5;
    for(float i = 187.5; i <= 323.5; i += 0.5){
      path[int(point * 10)][int(i * 10)] = 1;
    }
    //(32.5, 323.5) to left
    point = 323.5;
    for(float i = 32.5; i <= 202.5; i += 0.5){
      path[int(i * 10)][int(point * 10)] = 1;
    }
    //(252.5, 323.5) to left
    point = 323.5;
    for(float i = 252.5; i <= 437.5; i += 0.5){
      path[int(i * 10)][int(point * 10)] = 1;
    }
    //(32.5, 323.5) down
    point = 32.5;
    for(float i = 323.5; i <= 373.5; i += 0.5){
      path[int(point * 10)][int(i * 10)] = 1;
    }
    //(437.5, 323.5) down
    point = 437.5;
    for(float i = 323.5; i <= 373.5; i += 0.5){
      path[int(point * 10)][int(i * 10)] = 1;
    }
    //(32.5, 373.5) to left
    point = 373.5;
    for(float i = 32.5; i <= 67.5; i += 0.5){
      path[int(i * 10)][int(point * 10)] = 1;
    }
    //(437.5, 373.5) to right
    point = 373.5;
    for(float i = 437.5; i >= 387.5; i -= 0.5){
      path[int(i * 10)][int(point * 10)] = 1;
    }
    //(67.5, 373.5) down
    point = 67.5;
    for(float i = 373.5; i <= 412.5; i += 0.5){
      path[int(point * 10)][int(i * 10)] = 1;
    }
    //(387.5, 373.5) down
    point = 387.5;
    for(float i = 373.5; i <= 412.5; i += 0.5){
      path[int(point * 10)][int(i * 10)] = 1;
    }
    //(32.5, 412.5) to left
    point = 412.5;
    for(float i = 32.5; i <= 117.5; i += 0.5){
      path[int(i * 10)][int(point * 10)] = 1;
    }
    //(437.5, 412.5) to right
    point = 412.5;
    for(float i = 422.5; i >= 337.5; i --){
      path[int(i * 10)][int(point * 10)] = 1;
    }
    //(32.5, 412.5) down
    point = 32.5;
    for(float i = 412.5; i <= 470; i += 0.5){
      path[int(point * 10)][int(i * 10)] = 1;
    }
    //(422.5, 412.5) down
    point = 422.5;
    for(float i = 412.5; i <= 470; i += 0.5){
      path[int(point * 10)][int(i * 10)] = 1;
    }
    //(32.5, 470) to left
    point = 470;
    for(float i = 32.5; i <= 422.5; i += 0.5){
      path[int(i * 10)][int(point * 10)] = 1;
    }
    //(202.5, 323.5) down
    point = 202.5;
    for(float i = 323.5; i <= 370; i += 0.5){
      path[int(point * 10)][int(i * 10)] = 1;
    }
    //(252.5, 323.5) down
    point = 252.5;
    for(float i = 323.5; i <= 370; i += 0.5){
      path[int(point * 10)][int(i * 10)] = 1;
    }
    //(117.5, 370) to left
    point = 370;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
    for(float i = 117.5; i < 337.5; i += 0.5){
      path[int(i * 10)][int(point * 10)] = 1;
    }
    //(167.5, 370) down
    point = 167.5;
    for(float i = 370; i <= 412.5; i += 0.5){
      path[int(point * 10)][int(i * 10)] = 1;
    }
    //(287.5, 370) down
    point = 287.5;
    for(float i = 370; i <= 412.5; i += 0.5){
      path[int(point * 10)][int(i * 10)] = 1;
    }
    //(167.5, 412.5) to left
    point = 412.5;
    for(float i = 167.5; i <= 202.5; i += 0.5){
      path[int(i * 10)][int(point * 10)] = 1;
    }
    //(287.5, 412.5) to right
    point = 412.5;
    for(float i = 287.5; i >= 252.5; i -= 0.5){
      path[int(i * 10)][int(point * 10)] = 1;
    }
    //(202.5, 412.5) down
    point = 202.5;
    for(float i = 412.5; i <= 470; i += 0.5){
      path[int(point * 10)][int(i * 10)] = 1;
    }
    //(252.5, 412.5) down
    point = 252.5;
    for(float i = 412.5; i <= 470; i += 0.5){
      path[int(point * 10)][int(i * 10)] = 1;
    }
    //(32.5, 232.5) to left  ***********************************************************************************************
    point = 232.5;
    for(float i = 32.5; i <= 167.5; i += 0.5){
      path[int(i * 10)][int(point * 10)] = 1;
    }
    //(287.5, 232.5) to left  ***************************************************************************************************
    point = 232.5;
    for(float i = 287.5; i <= 422.5; i += 0.5){
      path[int(i * 10)][int(point * 10)] = 1;
    }
    //(167.5, 270) to left
    point = 270;
    for(float i = 167.5; i <= 287.5; i += 0.5){
      path[int(i * 10)][int(point * 10)] = 1;
    }
    
  }
  
  //step 1=left; 2=right; 3=down; 4=up
  void move(){
    //if (x < xPrev){
    //  eye_left();}
    
    if(((x -= 0.5) == 32.5) && (y == 232.5) && lastStep == 1){
      x = 422.5;
      y = 232.5;
      lastStep = 1;
      return;
    }
    if(((x += 0.5) == 422.5) && (y == 232.5) && lastStep == 2){
      x = 32.5;
      y = 232.5;
      lastStep = 2;
      return;
    }
    
    if(path[int((x - 0.5) * 10)][int(y * 10)] == 1){
      if(lastStep != 2){
      left = true;
      }else{
      left = false;
    }
    }else{
      left = false;
    }
    if(path[int((x + 0.5) * 10)][int(y * 10)] == 1){
      if(lastStep != 1){
        right = true;
      }  else{
      right = false;
    }    
    }else{
      right = false;
    }
    if(path[int(x * 10)][int((y - 0.5) * 10)] == 1){
      if(lastStep != 3){
        up = true;
      }else{
      up = false;
    }
    }else{
      up = false;
    }
    if(path[int(x * 10)][int((y + 0.5) * 10)] == 1){
      if(lastStep != 4){
        down = true;
      }else{
      down = false;
    }
    }else{
      down = false;
    }
    
    if(left == true && right == true && up == true && down == true){
      float direction = random(4);
      if(direction < 1){
        x -= 0.5;
        lastStep = 1;
      }
      if(1 <= direction && direction < 2 ){
        x += 0.5;
      lastStep = 2;
      }
      if(2 <= direction && direction < 3 ){
        y -= 0.5;
      lastStep = 4;
      }
      if(3 <= direction && direction < 4 ){
        y += 0.5;
      lastStep = 3;   
      }      
    }
    if(left == false && right == true && up == true && down == true){
      float direction = random(3);
      if(direction < 1){
        x += 0.5;
      lastStep = 2;
      }
      if(1 <= direction && direction < 2 ){
        y -= 0.5;
      lastStep = 4;
      }
      if(2 <= direction && direction < 3 ){
        y += 0.5;
      lastStep = 3;   
      }    
    }
    if(left == true && right == false && up == true && down == true){
      float direction = random(3);
      if(direction < 1){
        x -= 0.5;
        lastStep = 1;
      }
      if(1 <= direction && direction < 2 ){
        y -= 0.5;
      lastStep = 4;
      }
      if(2 <= direction && direction < 3 ){
        y += 0.5;
      lastStep = 3;   
      }    
    }
    if(left == true && right == true && up == false && down == true){
      float direction = random(3);
      if(direction < 1){
        x -= 0.5;
      lastStep = 1;
      }
      if(1 <= direction && direction < 2 ){
        x += 0.5;
      lastStep = 2;
      }
      if(2 <= direction && direction < 3 ){
        y += 0.5;
      lastStep = 3;   
      }    
    }
    if(left == true && right == true && up == true && down == false){
      float direction = random(3);
      if(direction < 1){
        x -= 0.5;
      lastStep = 1;
      }
      if(1 <= direction && direction < 2 ){
        x += 0.5;
      lastStep = 2;
      }
      if(2 <= direction && direction < 3 ){
        y -= 0.5;
      lastStep = 4;
      }    
    }
    if(left == false && right == false && up == true && down == true){
      float direction = random(2);
      if(direction < 1){
        y -= 0.5;
      lastStep = 4;
      }
      if(1 <= direction && direction < 2 ){
        y += 0.5;
      lastStep = 3;   
      }    
    }
    if(left == true && right == false && up == false && down == true){
      float direction = random(2);
      if(direction < 1){
        x -= 0.5;
      lastStep = 1;
      }
      if(1 <= direction && direction < 2 ){
        y += 0.5;
      lastStep = 3;   
      }    
    }
    if(left == true && right == true && up == false && down == false){
      float direction = random(2);
      if(direction < 1){
        x += 0.5;
      lastStep = 2;
      }
      if(1 <= direction && direction < 2 ){
        x -= 0.5;
        lastStep = 1;
      }    
    }
    if(left == false && right == true && up == true && down == false){
      float direction = random(2);
      if(direction < 1){
        x += 0.5;
        lastStep = 2;
      }
      if(1 <= direction && direction < 2 ){
        y -= 0.5;
      lastStep = 4;
      }    
    }
    if(left == false && right == true && up == false && down == true){
      float direction = random(2);
      if(direction < 1){
        x += 0.5;
      lastStep = 2;
      }
      if(1 <= direction && direction < 2 ){
        y += 0.5;
      lastStep = 3;   
      }    
    }
    if(left == true && right == false && up == true && down == false){
      float direction = random(2);
      if(direction < 1){
        x -= 0.5;
        lastStep = 1;
      }
      if(1 <= direction && direction < 2 ){
        y -= 0.5;
      lastStep = 4;
      }    
    }
    if(left == false && right == false && up == false && down == true){
      ghost1 = createShape(GROUP);
      shapeMode(CENTER);
      PShape body = createShape();
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
      PShape eyeLeft = createShape(ELLIPSE, 30, 40, 30, 30);
      PShape eyeRight = createShape(ELLIPSE, 70, 40, 30, 30);
      PShape pupilLeft = createShape(ELLIPSE, 30, 40, 10, 10);
      PShape pupilRight = createShape(ELLIPSE, 70, 40, 10, 10);    
      pupilLeft.setFill(color(0));
      pupilRight.setFill(color(0));    
      eyeLeft.setFill(color(255));
      eyeLeft.setStroke(false);
      eyeRight.setFill(color(255));
      eyeRight.setStroke(false);
      ghost1.addChild(eyeRight);    
      ghost1.addChild(pupilRight);
      ghost1.addChild(eyeLeft);
      ghost1.addChild(pupilLeft);
      y += 0.5;
      lastStep = 3;   
    }
    if(left == true && right == false && up == false && down == false){
            ghost1 = createShape(GROUP);
      shapeMode(CENTER);
      PShape body = createShape();
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
      PShape eyeLeft = createShape(ELLIPSE, 30, 40, 30, 30);
      PShape eyeRight = createShape(ELLIPSE, 70, 40, 30, 30);
      PShape pupilLeft = createShape(ELLIPSE, 30, 40, 10, 10);
      PShape pupilRight = createShape(ELLIPSE, 70, 40, 10, 10);    
      pupilLeft.setFill(color(0));
      pupilRight.setFill(color(0));    
      eyeLeft.setFill(color(255));
      eyeLeft.setStroke(false);
      eyeRight.setFill(color(255));
      eyeRight.setStroke(false);
      ghost1.addChild(eyeLeft);
      ghost1.addChild(pupilLeft);
      xPrev = x;
      x -= 0.5;
      lastStep = 1;   
    }
    if(left == false && right == true && up == false && down == false){
            ghost1 = createShape(GROUP);
      shapeMode(CENTER);
      PShape body = createShape();
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
      PShape eyeLeft = createShape(ELLIPSE, 30, 40, 30, 30);
      PShape eyeRight = createShape(ELLIPSE, 70, 40, 30, 30);
      PShape pupilLeft = createShape(ELLIPSE, 30, 40, 10, 10);
      PShape pupilRight = createShape(ELLIPSE, 70, 40, 10, 10);    
      pupilLeft.setFill(color(0));
      pupilRight.setFill(color(0));    
      eyeLeft.setFill(color(255));
      eyeLeft.setStroke(false);
      eyeRight.setFill(color(255));
      eyeRight.setStroke(false);
      ghost1.addChild(eyeRight);    
      ghost1.addChild(pupilRight); 
      xPrev = x;
      x += 0.5;
      lastStep = 2;
    }
    if(left == false && right == false && up == true && down == false){
            ghost1 = createShape(GROUP);
      shapeMode(CENTER);
      PShape body = createShape();
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
      PShape eyeLeft = createShape(ELLIPSE, 30, 40, 30, 30);
      PShape eyeRight = createShape(ELLIPSE, 70, 40, 30, 30);
      PShape pupilLeft = createShape(ELLIPSE, 30, 40, 10, 10);
      PShape pupilRight = createShape(ELLIPSE, 70, 40, 10, 10);    
      pupilLeft.setFill(color(0));
      pupilRight.setFill(color(0));    
      eyeLeft.setFill(color(255));
      eyeLeft.setStroke(false);
      eyeRight.setFill(color(255));
      eyeRight.setStroke(false);
      ghost1.addChild(eyeRight);    
      ghost1.addChild(pupilRight);
      ghost1.addChild(eyeLeft);
      ghost1.addChild(pupilLeft);
      //print("up ");
      y -= 0.5;
      lastStep = 4;
    }
    
    
  }
  void display(){   
    move();
    shape(ghost1, x, y, 20, 20);
  }
}