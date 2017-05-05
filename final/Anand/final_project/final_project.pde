import processing.sound.*; //<>//

//initial push //<>//
Table highScore;
String username = "";
PImage background, brick, test, fireball;
int x = 0, y = 200, px = 0, brick_x, tryX = 0, time;
int start = 0, lives, score;
int fireTimeX, fireTimeY;

platform p;
Mario m;
Fireball fball;
gameOver finish;
float t;
boolean left, right, up, down, space, shift = false, music;
boolean intro, pause, shoot;
SoundFile theme;

tube tu;


void setup() {
  size(500, 450, P2D);
  highScore = new Table();
  highScore.addColumn("Username");
  highScore.addColumn("Score");
  finish = new gameOver();
  fireball = loadImage("fireball.png");
  background = loadImage("background.png");
  test = loadImage("banner.png");
  brick = loadImage("brick.jpg");
  brick.resize(30, 30);
  test.resize(500, 385);
  start = 0;
  time = 0;
  fireTimeX = 0;
  lives = 3;
  brick_x = 50;
  frameRate(10);
  shoot = false;

  theme = new SoundFile(this, "theme.mp3");
  music = true;
  if (music == true) {
    theme.loop();
  }
  intro = true;
  pause = false;

  p = new platform(750, 200, 4, 2);
  m = new Mario(30, 40, 250, 285);
  tu = new tube(500);
  fball = new Fireball();
}


void draw() {
  background(255);
  pushMatrix();
  translate(px, 0);
  image(background, 0, 0);  
  image(background, background.width, 0);  
  image(background, background.width * 2, 0); 
  image(background, background.width * 3, 0);
  image(brick, 50, 200);
  int brick_x = 50;
  for (int i = 0; i < 5; i ++) {
    image(brick, brick_x, 200);
    brick_x += 31;
  }
  popMatrix();
  if (intro == false) { 
    gameplay_screen();
  }
  gui();

  p.display(px);
  platformAreaCheck();

  tu.display(px);


  if (start > 2) {
    m.display();

    if (keyPressed == true) {
      if (key == 't'){
        lives -= 1;}
      if (key == 'f'){
        fball.toggle = true;
        //fball.display();

      }
      if (keyCode == RIGHT) {
        right = true;
      } else if (keyCode == LEFT) {
        left = true;
      } else {
        if (keyCode == UP) {
          up = true;
        }
      }
    }
    
    if (fball.toggle == true){
      fball.display();}

    if (tu.inArea(m.x(), m.y(), m.w(), m.h())) {
      if (right) {
        right = false;
      } else {
        if (left) {
          left = false;
        }
      }
      if (up) {
        up = false;
      }
    }

    px = m.update(up, left, right, px);
    up = false;
    left = false;
    right = false;

    if (px > 0) {
      px = 0;
    }
    if (px < -1900) {
      px = -1900;
    } 
  }
    if (lives == 0){
      String a = finish.show();
      
      if (finish.isDone() == true){
        TableRow newRow = highScore.addRow();
        newRow.setString("Username", a);
        newRow.setInt("Score", score);
        saveTable(highScore, "data/highScores.csv");}
    }
}

void gameOver(){
  background(255);
  fill(0);
  text(username, 360, 180);
}

void gameplay_screen() {
  fill(0);
  textSize(15);
  text("Time: ", 10, 400);
  text(time, 54, 400);
  if (intro == false) {
    time += 1;
  }
  if (keyPressed == true) {
    if (key == 'p' || key == 'P') {
      pause = true;
    } else if (key == 'v' || key == 'V') {
      if (music == true) {
        music = false;
      } else {
        music = true;
      }
    }
  }

  text("Music: ", 10, 420);
  if (music == true) {
    theme.amp(1);
    text("ON", 60, 420);
  } else {
    theme.amp(0);
    text("OFF", 60, 420);
  }
  
  text("Lives: ", 10, 440);
  text(lives, 50, 440);
} 

void gui() {  //anand gui start
  if (start == 0) {
    textSize(25);
    image(test, px, 0);

    text("PRESS B TO BEGIN", 120, 250);
    if (keyPressed == true) {
      if (key == 'b' || key == 'B') {
        start += 1;
      }
    }
  }

  if (start == 1) {
    image(background, 0, 0);
    textSize(18);
    text("This game uses arrow keys to move your Mario.\nUse the right arrow to move right.\nUse the left arrow to move left.\nUse the up arrow to jump up.\n\nPress N to move to the next slide", 10, 170);
    if (keyPressed == true) {
      if (key == 'n' || key == 'N') {
        start += 1;
      }
    }
  } else if (start == 2) {
    image(background, 0, 0);
    textSize(18);
    text("Press P to pause the game.\n\nPress V to toggle background volume.\n\nPress SPACE to begin the game.", 10, 200);
    if (keyPressed == true) {
      if (key == ' ') {
        start += 1;
        intro = false;
      }
    }
  } // end of start == 2
  else if (pause == true) {
    theme.amp(0);
    fill(255);
    noStroke();
    rect(0, 0, 500, 385);
    fill(0);
    textSize(20);
    text("Press C to continue.\nPress Q to quit.", 150, 200);
    time += -1;
    if (keyPressed == true) {
      if (key == 'c' || key == 'C') {
        pause = false;
        theme.amp(1);
      } else if (key == 'q' || key == 'Q') {
        intro = true;
        px = 0;
        setup();
      }
    }
  }
}

void platformAreaCheck() {
  if (p.inArea(m.x(), m.y(), m.w(), m.h()) == 1) {
    m.backCount();
  } else {
    if (p.inArea(m.x(), m.y(), m.w(), m.h()) == 2) {
      m.backCount();}}}

void keyReleased(){
  if (key == 'f'){
    m.display();}}