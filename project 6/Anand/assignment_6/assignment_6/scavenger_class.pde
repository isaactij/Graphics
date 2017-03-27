class scavenger{
  
  float sizeX, sizeY, x, y;
  float dist = 25;    
  float lerpy;
  float lerpx;
  float i = .01; 
  boolean scavenge = false;
  void setup(){
    img_vulture = loadShape("vulture.svg");}
    
  scavenger(){
    x = 50;
    y = 50;
    sizeX = 25;
    sizeY = 25;}
    
  float x(float predX){
    if (predX < width/2){
      return (predX - dist);}
    else {
      return (predX + dist);}}
      
  float y(float predY){
    if (predY < height/2){
      return (predY - dist);}
    else {
      return (predY + dist);}}
    
  void display(float predX, float predY){

    fill(0);
    if (i < 1){
      lerpy = lerp(10, 400, i);
      shape(img_vulture, 20, lerpy, sizeX, sizeY);
      
      i += .001;}
    else{
      i = .1;
      shape(img_vulture, 20, lerpy, sizeX, sizeY);
    }
  }
  void eatBird(float deadX, float deadY){
    this.x = lerp(x, deadX, .02);
    this.y = lerp(y, deadY, .02);}
    
    
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