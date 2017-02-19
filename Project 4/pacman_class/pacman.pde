class pacman{
  float x, y, radius;
  int mouthStep;
  boolean up;
  int count;
  
  //Starting position
  pacman(){
    x = 227.5; //<>//
    y = 370;
    radius = 10;
    mouthStep = 0;
    up = false;
    count = 0;
  }
  
  pacman(float x1, float y1, float radius1){
    x = x1;
    y = y1;
    radius = radius1;
  }
  
  void display(){
   stroke(0); //<>//
    if(mouthStep == 3){
      fill(249, 250, 23);
      arc(x, y, 20, 20, 0, 2*PI);
    }
    if(mouthStep == 1){
      fill(249, 250, 23);
      arc(x, y, 20, 20, PI / 4, (7 * PI) / 4);
    }
    if(mouthStep == 2){
      fill(249, 250, 23);
      arc(x, y, 20, 20, PI / 10, (19 * PI) / 10);
    }
    if(mouthStep == 0){
      fill(249, 250, 23);
      arc(x, y, 20, 20, 3*PI / 10, (17 * PI) / 10);
    }
    
  }
  
  void move(){
    x++;
    y++;
    if(up == true){
      count++;
      if(count == 4){
        count = 0;
        mouthStep++;
        if(mouthStep > 3){
        mouthStep = 2;
        up = false;
      }
      }
     
    }else{
      count++;
      if(count == 4){
        count = 0;
        mouthStep--;
        if(mouthStep < 0){
          mouthStep = 0;
          up = true;
        }
      }
      
    }  
  }
  
  
}