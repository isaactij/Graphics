class scavenger{
  
  float sizeX, sizeY, x, y;
  float dist = 50;
  
  void setup(){
    img_vulture = loadShape("vulture.svg");}
    
  scavenger(){
    x = mouseX;
    y = mouseY;
    sizeX = 50;
    sizeY = 50;}
    
  float x(){
    if (mouseX < width/2){
      return (mouseX - dist);}
    else {
      return (mouseX + dist);}}
      
  float y(){
    if (mouseY < height/2){
      return (mouseY - dist);}
    else {
      return (mouseY + dist);}}
    
  void display(){
    fill(0);
    if ((mouseX < width/2) && (mouseY < height/2)){
      shape(img_vulture, mouseX - dist, mouseY - dist, sizeX, sizeY);
    }
    
    else if ((mouseX < width/2) && (mouseY > height/2)){
      shape(img_vulture, mouseX - dist, mouseY + dist, sizeX, sizeY);
    }
    
    else if ((mouseX > width/2) && (mouseY < height/2)){
      shape(img_vulture, mouseX + dist, mouseY - dist, sizeX, sizeY);
    }
    
    else if ((mouseX > width/2) && (mouseY > height/2)){
      shape(img_vulture, mouseX + dist, mouseY + dist, sizeX, sizeY);
    }
   
  }  
  
}