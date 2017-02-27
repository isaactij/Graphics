class pacman{
  float x, y, radius;
  int mouthStep;
  boolean mouthUp;
  int count;
  int lastStep;
  int path[][];  
  boolean left, right, up, down;
  
  //Starting position
  pacman(){
    x = 227.5; //<>//
    y = 370;
    radius = 10;
    mouthStep = 0;
    mouthUp = false;
    count = 0;
    lastStep = 1;
    writePath();
  }
  
  float x(){
    return x;
  }
  
  float y(){
    return y;
  }
  
  void writePath(){
    path = new int[4600][5000];
    
    
    //(32.5, 22.5) to left  ******************************************************************************************
    float point = 22.5;
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
  
  //step 1=left; 2=right; 3=down; 4=up
  void move(){ //<>//
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
      y += 0.5;
      lastStep = 3;   
    }
    if(left == true && right == false && up == false && down == false){
      x -= 0.5;
      lastStep = 1;   
    }
    if(left == false && right == true && up == false && down == false){
      x += 0.5;
      lastStep = 2;
    }
    if(left == false && right == false && up == true && down == false){
      y -= 0.5;
      lastStep = 4;
    }
    mouth();
    
    
  }
  
  void mouth(){
    if(mouthUp == true){
      count++;
      if(count == 4){
        count = 0;
        mouthStep++;
        if(mouthStep > 3){
        mouthStep = 2;
        mouthUp = false;
      }
      }     
    }else{
      count++;
      if(count == 4){
        count = 0;
        mouthStep--;
        if(mouthStep < 0){
          mouthStep = 0;
          mouthUp = true;
        }
      }      
    }  
  }
  
  
}