bird b1; //<>//
scavenger vulture;
PShape img_vulture;
predator predator;
int t, vel, accel = 0;


void setup() {
  //frameRate(100);
  background(255);
  size(500, 500, P2D);
  b1 = new bird();
  vulture = new scavenger();
  img_vulture = loadShape("vulture.svg");
  predator = new predator();
}

void draw() {
  this.t +=1;

  background(255);
  b1.drawbirds();
  b1.movebirds(predator.xPos(), predator.yPos(), predator.predatorStop());
  shapeMode(CENTER);
  vulture.display();
  //print(vulture.x() + " \n");
  b1.ifDead(vulture.x(), vulture.y());
  //b1.ifDead(-1, -1);

  vulture.eatBird(b1.bird1dead(), b1.bird2dead(), b1.bird3dead(), b1.bird4dead(), b1.bird5dead(), b1.bird6dead(), b1.bird1X(), b1.bird2X(), b1.bird3X(), b1.bird4X(), b1.bird5X(), b1.bird6X(), b1.bird1Y(), b1.bird2Y(), b1.bird3Y(), b1.bird4Y(), b1.bird5Y(), b1.bird6Y());

  //saveFrame();

  //predator stuff
  predator.changeBirdPos(int(b1.birdX()), int(b1.birdY()));
  predator.changeTimeStuff(this.t);
  predator.drawPredator();
}