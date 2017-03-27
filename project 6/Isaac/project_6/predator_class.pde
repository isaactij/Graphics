class predator{
  
  int birdX, birdY;
  int x, y = 0;
  float t, vel;
  float accel = .01;
  boolean stop = false;
  int timer = 200;
  PShape img_hawk;

  
  void setup(){
    //img_hawk = loadShape("vulture.svg");
  }
  
  void drawPredator(){
    changePredPos();
    ellipse(x, y, 20, 20);
    //shape(img_hawk,100,100,50,50);    
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