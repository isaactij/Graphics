sun sun1;
int xpos = 600;
double ypos = 0, y;
float turn = 0;
float ang = 0;
int y1 = (int) y;

float day = 255;
boolean daynight = true, nightday = false;



void setup() { 
  size(1000, 700, P3D);
  sun1 = new sun();
}

void draw() {
  background(255);
  camera(0, 0, 1000, 0, 0, 0, 0, 1, 0);
  //print(ypos, " ");
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
  
}