class predator{
  
  int birdX, birdY;
  int x, y = 0;
  float t, vel;
  float accel = .004;
  boolean stop = false;
  int timer = 200;
  
  void drawPredator(){
    changePredPos();
    ellipse(x, y, 20, 20);
    
  }
  
  void changeTimeStuff(float t){
    this.t = t; 
    this.vel += accel;
  }
  
  void changeBirdPos(int x, int y){
   this.birdX = x;
   this.birdY = y;
  }
  
  void changePredPos(){
    int xDiff = birdX - x;
    int yDiff = birdY - y;
    
    if(this.stop == false){
      if(xDiff < 0){
        x -= vel;
      }
      if(xDiff > 0){
        x += vel; 
      }
      if(yDiff < 0){
        y -= vel; 
      }
      if(yDiff > 0){
        y += vel; 
      }
    }
    
    if(birdX == x){
      this.vel = 0; 
      this.stop = true;
    }
    
    if(this.stop == true){
      timer -= 1;
      if(timer == 0){
        this.stop = false;
        timer = 200;
      }
      
    }
    



    
    
  }
  
  int xPos(){
    return this.x;
  }
  
  int yPos(){
    return this.y;
  }
  
  
}