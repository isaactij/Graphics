class Platform{
  float x,y,w,h;
  
  Platform(float xPos, float yPos){
    x = xPos;
    y = yPos;
    w = 200;
    h = 20;
  }
  
  void display(){
    fill(255,0,0);
    rect(x,y,w,h);
  }
  
}