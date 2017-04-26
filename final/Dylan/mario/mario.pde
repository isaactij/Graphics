//initial push
Platform p;
Mario m;
PImage background;
PImage brick;
float px = 0, py = 100;
float t;
boolean left,right,up,down,space,shift = false;

void setup(){
  size(500, 385, P3D);
  background = loadImage("background.png");
  brick = loadImage("brick.jpg");
  brick.resize(30, 30);
  m = new Mario();
  p = new Platform(100,200);
}

 
void draw(){
  background(0);
  m.update();
  pushMatrix();
  translate(px, 0);
  image(background, 0, 0);  image(background, background.width, 0);  image(background, background.width * 2, 0); image(background, background.width * 3, 0);
  image(brick, 50, 200);
  p.display();
  m.display();
  int brick_x = 50;
  for (int i = 0; i < 4; i ++){
    image(brick, brick_x, 200);
    brick_x += 31;}
  popMatrix();
  ellipse(100, py, 50, 50);
  if (keyPressed == true){
    
    if (key == 'w'){
      py++;
    }
    if (key == 'd'){ //move right
      px -= 1;}
    else if (key == 'a'){ //move left
      px += 1;}
      

    else{
      px += 0;}}
  if (px > 0){
    px = 0;}
  if (px < -1900){
    px = -1900;}
    
}

void keyPressed(){
  switch (keyCode){
    case 37://left
      left = true;
      break;
    case 39://right
      right = true;
      break;
    case 38://up
      up = true;
      break;
    case 40://down
      down = true;
      break;
    case 32: //space
      space = true;
      break;
    case 16: //shift
      shift = true;
  }
}
void keyReleased(){
    switch (keyCode){
    case 37://left
      left = false;
      break;
    case 39://right
      right = false;
      break;
    case 38://up
      up = false;
      break;
    case 40://down
      down = false;
      break;
    case 32: //space
      space = false;
      break;
    case 16: //shift
      shift = false;
  }
}