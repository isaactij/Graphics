//initial push
Mario m;
PImage background, brick, test;
int x = 0, y = 200, px = 0, brick_x, tryX = 0;
int start = 0;
boolean left,right,up,down,space,shift = false;




void setup(){
  size(500, 385, P2D);
  background = loadImage("background.png");
  test = loadImage("banner.png");
  brick = loadImage("brick.jpg");
  brick.resize(30, 30);
  test.resize(500, 385);
  start = 0;
  m = new Mario();
  brick_x = 50;
}

void gui(){  
  if (start == 0){
    textSize(25);
    image(test, px, 0);

    text("PRESS B TO BEGIN", 120, 250);
    if (keyPressed == true){
      if (key == 'b' || key == 'B'){
        start += 1;
        }
      }
  }
  
  if (start == 1){
    image(background, 0, 0);
    textSize(18);
    text("This game uses ASDW to move your Mario character.\nUse D to move right, A to move left, and W to jump up.\n\nPress N to move to the next slide", 10, 200);
    if (keyPressed == true){
      if (key == 'n' || key == 'N'){
        start += 1;
      }
    }    
  }  
  if (start == 2){
    image(background, 0, 0);
    textSize(18);
    text("Press P to pause the game.\n\nPress V to toggle background volume.\n\nPress SPACE to begin the game.", 10, 200);
    if (keyPressed == true){
      if (key == ' '){
        start += 1;
      }
    }    
  }
  
}
  
void draw(){
  background(0);
  m.update();
  pushMatrix();
  translate(px, 0);
  image(background, 0, 0);  image(background, background.width, 0);  image(background, background.width * 2, 0); image(background, background.width * 3, 0);
  image(brick, 50, 200);
  int brick_x = 50;
  for (int i = 0; i < 5; i ++){
    image(brick, brick_x, 200);
    brick_x += 31;}
    popMatrix();
  ellipse(100, y, 50, 50);
  gui();
  if (keyPressed == true){
    if (key == 'd' || key == 'D'){ //move right
      px -= 1;
      tryX += 1;}
    else if (key == 'a' || key == 'A'){ //move left
      px += 1;}
    else{
      px += 0;}}
  //print(px + " ");
  if (px > 0){
    px = 0;}
  if (px < -1900){
    px = -1900;}
   print(tryX + " ");
   m.display();
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