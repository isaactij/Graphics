scavenger vulture;
PShape img_vulture;


void setup(){ 
  size(600, 600);
  vulture = new scavenger();
  img_vulture = loadShape("vulture.svg");
  
}
  
void draw(){
  background(255);
  shapeMode(CENTER);
  vulture.display();}