class Mario{ //<>//
  
  float w,h,x,y,vx,vy, accelX, accelY, speedLimit, friction, bounce, gravity;
  float jumpForce = -5;
  boolean isOnGround;
  
  Mario(){
    
    w = 50;
    h = 50;
    x = 50; 
    y = 200;
    vx = 0;
    vy = 0;
    accelX = 0;
    accelY = 0;
    speedLimit = 8;   
  }
 
  void update(){  
    if(up){
      vy += jumpForce;
      friction = 1;
      print('x');
    }
    if (left){
      // vx =-5;
        accelX = -0.2;
        friction = 1;
      // if(currentFrame <= startLeft){currentFrame=startLeft;}
      }
      if (right){
      // vx =5;
        accelX = 0.2;
        friction = 1;
      }
      if(!left&&!right) {
      // vx=0;
        accelX = 0;
        friction = 0.96;
        gravity = 0.3;
      }else if (left&&right){
      // vx=0;
        accelX = 0;
        friction = 0.96;
        gravity = 0.3;
    }
    
    if(vy < -5){
      vy = -5;  
    }
    
    vx += accelX;
    vy += accelY;
    vy += gravity;
    y += vy;
    x+=vx;
    y+=vy;
    
    if (y > 350){
      y = 350;  
    }


  }
  
  void display(){
    fill(255,0,0);
    rect(x,y,w,h);
  }
}