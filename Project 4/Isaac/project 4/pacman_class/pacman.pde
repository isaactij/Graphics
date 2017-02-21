class pacman{
  float x, y, radius;
  int mouthStep;
  boolean up;
  int count;
  float[][] path;
  
  //Starting position
  pacman(){
    x = 227.5; //<>//
    y = 370;
    radius = 10;
    mouthStep = 0;
    up = false;
    count = 0;
  }
  
  void writePath(){
    int[][] path = new int[4400][5000];
    
    
    //(32.5, 27.5) to left
    float point = 27.5;
    for(float i = 32.5; i < 202.5; i++){
      path[int(i * 10)][int(point * 10)] = 1;
    }
    //(32.5, 27.5) down
    point = 32.5;
    for(float i = 27.5; i < 142.5; i++){
      path[int(point * 10)][int(i * 10)] = 1;
    }
    //(32.5, 87.5) to left
    point = 87.5;
    for(float i = 32.5; i < 437.5; i++){
      path[int(i * 10)][int(point * 10)] = 1;
    }
    //(32.5, 142.5) to left
    point = 142.5;
    for(float i = 32.5; i < 117.5; i++){
      path[int(i * 10)][int(point * 10)] = 1;
    }
    //(117.5, 27.5) down
    point = 117.5;
    for(float i = 27.5; i < 412.5; i++){
      path[int(point * 10)][int(i * 10)] = 1;
    }
    //(202.5, 27.5) down
    point = 202.5;
    for(float i = 27.5; i < 87.5; i++){
      path[int(point * 10)][int(i * 10)] = 1;
    }
    
    
    
    
    
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