tree a; //<>// //<>// //<>// //<>//
int count;
int step;
float xShiftSix;
float yShiftSix;
float xShiftFive;
float yShiftFive;
float xShiftFour;
float yShiftFour;
boolean countDown;
boolean wind;
int windCount;
boolean shake;
boolean back;
boolean windDone;
int onlyShake;
int windBlowCount;

sun sun1;
int xpos = 1000;
double ypos = 4000, y;
float turn = 0;
float ang = 0;
int y1 = (int) y;
float day = 255;
boolean daynight = true, nightday = false;

void setup() {
  size(1000, 500, P3D);
  a = new tree();
  background(255);
  count = 0;
  step = 0;
  xShiftSix = 0.0;
  yShiftSix = 0.0;
  xShiftFive = 0.0;
  yShiftFive = 0.0;
  countDown = false;
  wind = false;
  windCount = 0;
  shake = false;
  back = true;
  windDone = false;
  onlyShake = 0;
  windBlowCount = 0;
  sun1 = new sun();
}

void draw() {
  background(255, 0); //<>//
  ambientLight(255, day, 0, sun1.x, sun1.y, sun1.z + 50);
  stroke(10);
  sun1.display(xpos, ypos, turn);
  if (xpos > -600){ // moves the sun
    xpos -= 1;}  
  if (ypos > -600){
    ypos = 150 * cos(ang + PI) - 150;}
    
  if (xpos <= -600){ // resets the sun when it reaches arbitrarily picked number
    xpos = 350;}
  if (ypos <= -600){
    ypos = 0;}
    
  if (daynight == true){
    day -= .25;}
  else if (nightday == true){
    day += .25;}
  
  if (day == 140){
    nightday = true; daynight = false;}
  if (day == 255){
    daynight = true; nightday = false;}
  
  turn = turn - PI/20; //sets speed of rotation
  ang += PI/500; // sets speed of wave
  
  
  if (wind == true) {
    windBlow();
    a.moveLeafSix(count, xShiftSix, yShiftSix);
    a.moveLeafFive(count, xShiftFive, yShiftFive);
    a.moveLeafFour(count, xShiftFour, yShiftFour);
    a.moveLeafThree(onlyShake);
    a.moveLeafTwo(onlyShake);
    a.moveLeafOne(onlyShake);
    step++;
    if (step == 5) {
      if (count == 10) {
        shake = true;
      }
      if(count == 0 && countDown == true){
        windDone = true;
        windBlowCount = 0;
      }
      if (count == 0) {
        countDown = false;
        back = true;
      }
      if (count == 12) {
        countDown = true;
      }

      if (count == 10 && countDown == true) {
        shake = false;
        if (back == true) {
          countDown = false;
          shake = true;
          back = false;
        }
      }
      if (shake == true && countDown == true) {
        
        onlyShake--;
        count--;
        windBlowCount++;
      }
      if (shake == true && countDown == false) {
        
        onlyShake++;
        count++;
        windBlowCount++;
      }
      if (countDown == true && shake == false) {
        count--;
        windBlowCount++;
        xShiftSix -= 0.22;
        yShiftSix -= 0.05;
        xShiftFive -= 0.2;
        yShiftFive -= 0.09;
        xShiftFour -= 0.18;
        yShiftFour -= 0.02;
      }
      if (countDown == false && shake == false) {
        count++;
        windBlowCount++;
        xShiftSix += 0.22;
        yShiftSix += 0.05;
        xShiftFive += 0.2;
        yShiftFive += 0.09;
        xShiftFour += 0.18;
        yShiftFour += 0.02;
      }
      step = 0;
    }
    if (windDone == true) {
      windCount = 0;
      wind = false;
    }
  } else {
    a.drawTree();
  }
  windCount ++;
  if (windCount == 100) {
    wind = true;
    windDone = false;
  }
}

void windBlow(){
  stroke(49, 70, 180);
  line(100 + 25 * windBlowCount, 250, 0, 250 + 25 * windBlowCount, 250, 0);
  line(100 + 25 * windBlowCount, 275, 0, 250 + 25 * windBlowCount, 275, 0);
  line(100 + 25 * windBlowCount, 300, 0, 250 + 25 * windBlowCount, 300, 0);
  line(100 + 25 * windBlowCount, 325, 0, 250 + 25 * windBlowCount, 325, 0);
  line(100 + 25 * windBlowCount, 350, 0, 250 + 25 * windBlowCount, 350, 0);
}