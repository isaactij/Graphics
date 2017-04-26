//initial push
PImage background, brick, test;
int x = 0, y = 200, px = 0, brick_x, tryX = 0;
int start = 0;



void setup(){
  size(500, 385, P2D);
  background = loadImage("background.png");
  test = loadImage("banner.png");
  brick = loadImage("brick.jpg");
  brick.resize(30, 30);
  test.resize(500, 385);
  start = 0;
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
}