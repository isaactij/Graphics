import processing.sound.*; //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//

//initial push
Table highScore;
String username = "";
PImage background, brick, test, fireball;
int x = 0, y = 200, px = 0, brick_x, tryX = 0, time;
int start = 0, lives = 3, score;
int fireTimeX, fireTimeY;
boolean givenUp;
boolean end;
Flag f;


platform[] p;
Mario m;
Fireball fball;
gameOver finish;
boolean left, right, up, down, space, shift = false;
boolean music = false;
boolean intro, pause, shoot;
SoundFile theme;
mushroom[] mush;

//tube[] t;
boolean[] scoreStop;

void setup() {
  size(500, 450, P2D);
  highScore = new Table();
  highScore.addColumn("Username");
  highScore.addColumn("Score");
  finish = new gameOver();
  x = 0;
  y = 200;
  px = 0;
  tryX = 0;
  start = 0;
  fireball = loadImage("fireball.png");
  background = loadImage("background.png");
  test = loadImage("banner.png");
  brick = loadImage("brick.jpg");  
  brick.resize(30, 30);
  test.resize(500, 385);
  start = 0;
  time = 0;
  fireTimeX = 0;
  brick_x = 50;
  frameRate(10);
  shoot = false;
  end = false;
  theme = new SoundFile(this, "theme.mp3");
  music = true;
  if (music == true) {
    theme.loop();
  }
  intro = true;
  pause = false;

  p = new platform[7];
  //t = new tube[4];
  mush = new mushroom[4];
  mush[0] = new mushroom(500, 300);
  p[0] = new platform(500, 200, 1, 1);
  p[1] = new platform(640, 200, 5, 3); 
  p[2] = new platform(720, 100, 1, 1);
  //t[0] = new tube(940);
  //t[1]  = new tube(1105);
  mush[1] = new mushroom(1200, 300);
  //t[2] = new tube(1270);
  mush[2] = new mushroom(1350, 300);
  mush[3] = new mushroom(1450, 300);
  //t[3] = new tube(1535);
  p[3] = new platform(1700, 200, 1, 1);
  p[4] = new platform(1840, 200, 3, 2);
  p[5] = new platform(1920, 100, 8, 4);
  p[6] = new platform(2440, 100, 4, 2);

  m = new Mario(30, 40, 250, 285);
  f = new Flag();

  fball = new Fireball();
  score = 0;
  scoreStop = new boolean[p.length];
  for (int i = 0; i < scoreStop.length; i++) {
    scoreStop[i] = false;
  }
}


void draw() {
  background(255);
  pushMatrix();
  translate(px, 0);
  image(background, 0, 0);  
  image(background, background.width, 0);  
  image(background, background.width * 2, 0); 
  image(background, background.width * 3, 0);
  image(background, background.width * 4, 0);
  image(background, background.width * 4, 0);
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

  p[0].display(px);
  p[1].display(px);
  p[2].display(px);
  p[3].display(px);
  //t[0].display(px);
  //t[1].display(px);
  //t[2].display(px);
  //t[3].display(px);
  p[4].display(px);
  p[5].display(px);
  p[6].display(px);
  platformAreaCheck();

  if (start > 2) {
    for (int i = 0; i < mush.length; i++) {
      if ((mush[i].x() + px) < 600 && (mush[i].x() + px) > -600) {
        mush[i].move();
      }
      //println(px);
      //for (int j = 0; j < t.length; j++) {
      //  if (t[j].inArea(mush[i].x(), mush[i].y(), mush[i].w(), mush[i].h())) {
      //    mush[i].turn();
      //  }
      //}
      if (mush[i].inArea(m.x(), m.y(), m.w(), m.h())) {
        mush[i].kill();
      } else {
        if (m.inArea(mush[i].x(), mush[i].y(), mush[i].w(), mush[i].h())) {
          lives--;
          m = new Mario(30, 40, 250, 285);
          px = 0;
          //setup();
        }
      }
      if (fball.fball_x() > mush[i].x() && fball.fball_x() < mush[i].x() + mush[i].w()) {
        mush[i].kill();
        fball.unToggle();
      }
      mush[i].display(px);
    }
    m.display();
    if (keyPressed == true) {
      if (key == 'f') {
        fball.toggle = true;
        //fball.display();
      }
    }

    if (fball.toggle == true) {
      fball.display();
    }


    px = m.update(up, left, right, px);
    //up = false;
    //left = false;
    //right = false;

    if (px > 0) {
      px = 0;
    }
    if (px < -2441) {
      px = -2441;
      end = true;
    }
  }
  f.display(px);

  if ((lives == 0) || (end == true)) {

    String a = finish.show();
    if ((end == true) && (lives > 0)) { 
      finish.victory = true;
    }
    if (finish.isDone() == true) {
      TableRow newRow = highScore.addRow();
      newRow.setString("Username", a);
      newRow.setInt("Score", score);
      saveTable(highScore, "data/highScores.csv");
      intro = true;
      px = 0;
      setup();
    }
  }
}

void keyPressed() {
  switch (keyCode) {
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
void keyReleased() {
  switch (keyCode) {
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
  if (key == 'f') {
    m.display();
  }
}

void gameOver() {
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
  text("Score: " + score, 250, 440);
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
    text("This game uses arrow keys to move your Mario.\nUse the right arrow to move right.\nUse the  arrow to move left.\nUse the up arrow to jump up.\n\nPress N to move to the next slide", 10, 170);
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
  for (int i = 0; i < p.length; i ++) {
    if (p[i].inArea(m.x(), m.y(), m.w(), m.h()) == 1) {
      m.backCount();
      if (!scoreStop[i]) {
        score += 10;
        scoreStop[i] = true;
      }
    } else {
      if (p[i].inArea(m.x(), m.y(), m.w(), m.h()) == 2) {
        m.backCount();
        if (!scoreStop[i]) {
          score += 10;
          scoreStop[i] = true;
        }
      } else {
        scoreStop[i] = false;
      }
    }
  }
}