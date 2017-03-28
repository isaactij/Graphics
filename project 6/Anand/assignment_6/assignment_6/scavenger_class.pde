class scavenger{
  
  float sizeX, sizeY, x, y;
  float dist = 25;    
  float lerpy;
  float lerpx;
  float i = .01; 
  boolean dead1 = false;
  boolean dead2 = false;
  boolean dead3 = false;
  boolean dead4 = false;
  boolean dead5 = false;
  boolean dead6 = false;
  
  float x1;
  float y1;
  float x2;
  float y2;
  float x3;
  float y3;
  float x4;
  float y4;
  float x5;
  float y5;
  float x6;
  float y6;
  
  void setup(){
    img_vulture = loadShape("vulture.svg");}
    
  scavenger(){
    x = 40;
    y = 40;
    sizeX = 25;
    sizeY = 25;}
    
  float x(){
    return this.x;}
    
      
  float y(){
    return this.lerpy;}
    
    
  void display(){

    fill(0);
    if (y < 500){
      //lerpy = lerp(10, 400, i);
      shape(img_vulture, x, y, sizeX, sizeY);
      
      y += 1;}
    else{
      //i = .1;
      //shape(img_vulture, x, y, sizeX, sizeY);
      y = 40; 
        }  
  }
  
  void eatBird (boolean dead1, boolean dead2, boolean dead3, boolean dead4, boolean dead5, boolean dead6, float x1, float x2, float x3, float x4, float x5, float x6, float y1, float y2, float y3, float y4, float y5, float y6 ){
    if (dead1 == true){
      this.x = x1;// lerp(x, x1, .7);
      this.y = y1;//lerp(y, y1, .7);}
  }
    if (dead2 == true){
      this.x = x2;//lerp(x, x2, .7);
      this.y = y2;//lerp(y, y2, .7);}
}
    if (dead3 == true){
      this.x = x3;//lerp(x, x3, .7);
      this.y = y4;//lerp(y, y3, .7);} 
      }
    if (dead4 == true){
      this.x = x4;//lerp(x, x4, .7);
      this.y = y4;//lerp(y, y4, .7);}
      }
    if (dead5 == true){
      this.x = x5;//lerp(x, x5, .7);
      this.y = y5;//lerp(y, y5, .7);}
      }
    if (dead6 == true){
      this.x = x6;//lerp(x, x6, .7);
      this.y = y6;//lerp(y, y6, .7);}
      }
  }
    
    
    //taken out from display()
    //if ((predX < width/2) && (predY < height/2)){
    //  shape(img_vulture, predX - dist, predY - dist, sizeX, sizeY);
    //}
    
    //else if ((predX < width/2) && (predY > height/2)){
    //  shape(img_vulture, predX - dist, predY + dist, sizeX, sizeY);
    //}
    
    //else if ((predX > width/2) && (predY < height/2)){
    //  shape(img_vulture, predX + dist, predY - dist, sizeX, sizeY);
    //}
    
    //else if ((predX >= width/2) && (predY >= height/2)){
    //  shape(img_vulture, predX + dist, predY + dist, sizeX, sizeY);
    //}
   
  

}