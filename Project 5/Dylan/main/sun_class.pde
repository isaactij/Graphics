class sun{
  float x, y, z;
  
  sun(){
    
    x = 350;
    y = 0;
    z = -600;}
    
  sun(float startX, float startY, float startZ){
    
    x = startX;
    y = startY;
    z = startZ;
  }
  
  void display(float x, double y, float turn){
    
    int y1 = (int) y;
    pushMatrix();
    translate(x, y1, -100);
    //camera(x, y, 100, 0, 0, 0, 0, 1, 0);
    //ambientLight(255, 255, 0, x, y1, z + 50);
    rotateY(turn);
    //noStroke();
    sphere(50);
    popMatrix();}
  

}
  
  
  
  
  
  
  
  
  
  
  
  
  