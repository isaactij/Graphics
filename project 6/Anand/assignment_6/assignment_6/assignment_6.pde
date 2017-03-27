bird b1;
scavenger vulture;
predator predator;
PShape img_vulture;
int t, vel, accel = 0;


void setup(){
  //frameRate(5);
  background(255); //<>// //<>//
  size(500, 500, P2D);
  b1 = new bird();
  vulture = new scavenger();
  predator = new predator();
  img_vulture = loadShape("vulture.svg");
}

void draw(){
  this.t +=1;
  background(255);
  b1.drawbirds();
  b1.movebirds();
  shapeMode(CENTER);
  vulture.display();
  //print(vulture.x() + " \n");
  b1.ifDead(vulture.x(), vulture.y());
  
  //predator stuff
  predator.changeBirdPos(int(b1.birdX()), int(b1.birdY()));
  predator.changeTimeStuff(this.t);
  predator.drawPredator();
  
  
  
}

//note from Dylan to Isaac, to get predator position, call predator.xPos() and 
//predator.yPos();
  