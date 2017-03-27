class predator{
  
  int birdX, birdY;
  int x, y = 0;
  float t, vel, accel;
  int target_x, target_y;
  
  void drawPredator(){
    changePredPos();
    ellipse(x, y, 20, 20);
    
  }
  
  void changeTimeStuff(float t, float vel, float accel){
    this.t = t; 
    this.vel = vel;
    this.accel = accel;
  }
  
  void changeBirdPos(int x, int y){
   this.birdX = x;
   this.birdY = y;
  }
  
  void changePredPos(){
    if(this.t % 100 == 0){
      this.target_x = birdX;
      this.target_y = birdY;
    }
    this.x = floor(lerp(x, target_x, 0.2));
    this.y = floor(lerp(y, target_y, 0.2));

    
    
  }
  
  int xPos(){
    return this.x;
  }
  
  int yPos(){
    return this.y;
  }
  
  
}