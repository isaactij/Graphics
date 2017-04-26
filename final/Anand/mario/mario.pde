//initial push
PImage background;
PImage brick;
int x = 0, y = 200, px = 0;


void setup(){
  size(500, 385, P3D);
  background = loadImage("background.png");
  brick = loadImage("brick.jpg");
  brick.resize(30, 30);}

 
void draw(){
  background(0);
  pushMatrix();
  translate(px, 0);
  image(background, 0, 0);  image(background, background.width, 0);  image(background, background.width * 2, 0); image(background, background.width * 3, 0);
  image(brick, 50, 200);
  int brick_x = 50;
  for (int i = 0; i < 4; i ++){
    image(brick, brick_x, 200);
    brick_x += 31;}
  popMatrix();
  ellipse(100, y, 50, 50);
  if (keyPressed == true){
    if (key == 'd'){ //move right
      px -= 1;}
    else if (key == 'a'){ //move left
      px += 1;}
    else{
      px += 0;}}
print(px + " ");
  if (px > 0){
    px = 0;}
  if (px < -1900){
    px = -1900;}
    
}