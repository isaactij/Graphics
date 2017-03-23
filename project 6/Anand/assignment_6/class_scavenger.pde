class scavenger{
  
  PShape holder;
  float sizeX, sizeY, x, y;
  
  void setup(){
    img_vulture = loadShape("vulture.svg");}
    
  scavenger(){
    x = mouseX;
    y = mouseY;
    sizeX = 50;
    sizeY = 50;}
    
  void display(){
    fill(0);
    if ((mouseX < width/2) && (mouseY < height/2)){
      shape(img_vulture, mouseX - 50, mouseY - 50, sizeX, sizeY);
    }
    
    else if ((mouseX < width/2) && (mouseY > height/2)){
      shape(img_vulture, mouseX - 50, mouseY + 50, sizeX, sizeY);
    }
    
    else if ((mouseX > width/2) && (mouseY < height/2)){
      shape(img_vulture, mouseX + 50, mouseY - 50, sizeX, sizeY);
    }
    
    else if ((mouseX > width/2) && (mouseY > height/2)){
      shape(img_vulture, mouseX + 50, mouseY + 50, sizeX, sizeY);
    }
   
  }  
  
}