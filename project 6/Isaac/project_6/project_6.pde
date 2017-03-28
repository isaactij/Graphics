bird b1;
scavenger vulture;
PShape img_vulture;
PShape img_hawk;
predator predator;
int t, vel, accel = 0;


void setup(){
  //frameRate(5);
  background(255); //<>//
  size(500, 500, P2D);
  b1 = new bird();
  vulture = new scavenger();
  img_vulture = loadShape("vulture.svg");
  img_hawk = loadShape("falc.svg");
  predator = new predator();
}

void draw(){ //<>//
  this.t += 1;
  background(255);
  b1.drawbirds();
  b1.movebirds(predator.xPos(), predator.yPos());
  shapeMode(CENTER);
  vulture.display();
  //print(vulture.x() + " \n");
  //b1.ifDead(vulture.x(), vulture.y());
  b1.ifDead(-50, -50);
  //saveFrame();
  
  //predator stuff
  predator.changeBirdPos(int(b1.birdX()), int(b1.birdY()));
  predator.changeTimeStuff(this.t);
  predator.drawPredator();
}
  