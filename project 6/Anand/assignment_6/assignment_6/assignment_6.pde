//Anand
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
  b1.movebirds(predator.xPos(), predator.yPos());
  shapeMode(CENTER);
  vulture.display();
  //print(vulture.x() + " \n");
  b1.ifDead(vulture.x(), vulture.y());
  print(vulture.y() + "\n");

  vulture.eatBird(b1.bird1dead(),b1.bird2dead(),b1.bird3dead(),b1.bird4dead(),b1.bird5dead(),b1.bird6dead(), b1.bird1X(), b1.bird2X(), b1.bird3X(), b1.bird4X(), b1.bird5X(), b1.bird6X(), b1.bird1Y(), b1.bird2Y(), b1.bird3Y(), b1.bird4Y(), b1.bird5Y(), b1.bird6Y());
  //predator stuff
  predator.changeBirdPos(int(b1.birdX()), int(b1.birdY()));
  predator.changeTimeStuff(this.t);
  predator.drawPredator();
  
  
  
}

//note from Dylan to Isaac, to get predator position, call predator.xPos() and 
//predator.yPos();
  