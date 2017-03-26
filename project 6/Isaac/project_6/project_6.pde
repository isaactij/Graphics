bird b1;
scavenger vulture;
PShape img_vulture;


void setup(){
  //frameRate(5);
  background(255); //<>//
  size(500, 500, P2D);
  b1 = new bird();
  vulture = new scavenger();
  img_vulture = loadShape("vulture.svg");
}

void draw(){
  background(255);
  b1.drawbirds();
  b1.movebirds();
  shapeMode(CENTER);
  vulture.display();
  //print(vulture.x() + " \n");
  b1.ifDead(vulture.x(), vulture.y());
}
  