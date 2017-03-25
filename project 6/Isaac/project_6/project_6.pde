bird b1;
//bird b2;
//bird b3;
//bird b4;
//bird b5;
//bird b6;


void setup(){
  //frameRate(5);
  background(255);
  size(500, 500, P2D);
  b1 = new bird();
  //b2 = new bird();
  //b3 = new bird();
  //b4 = new bird();
  //b5 = new bird();
  //b6 = new bird();
}

void draw(){
  background(255);
  b1.drawbirds(); //<>//
  b1.movebirds();
  
}