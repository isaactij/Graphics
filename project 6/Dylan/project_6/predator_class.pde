class predator{
  
  int birdX, birdY;
  int x, y = 0;
  float t, vel, accel;
  
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
    if(this.t % 30 == 0){
      this.x = this.birdX;
      this.y = this.birdY;
    }
    
  }
  
  int xPos(){
    return this.x;
  }
  
  int yPos(){
    return this.y;
  }
  
  
}