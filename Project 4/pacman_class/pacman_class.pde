pacman pac;

void setup(){
  size(1000,500);
  background(0);
  pac = new pacman();
}

void draw(){
  background(0);
  pac.display();
  //pac.move(); //<>//
  maze();
}

void maze(){
  mazeEdges();
  mazeL();
  mazeThreePiece();
  mazeBoxes();
}

void mazeBoxes(){
  //BOTTOM LEFT
  rect(135, 337.5, 35, 15);
  
  //BOTTOM RIGHT
  rect(320, 337.5, -35, 15);
  
  //MIDDLE LEFT
  rect(135, 250, 15, 60);
  
  //MIDDLE RIGHT
  rect( 320, 250, -15, 60);
  
  //TOP LEFT (19 long for each section)
  rect(50, 40, 38, 30);
  
  //TOP MIDDLE LEFT
  rect(123, 40, 57, 30);
  
  //TOP MIDDLE RIGHT
  rect(265, 40, 57, 30);
  
  //TOP RIGHT
  rect(357, 40, 38, 30);
  
  //TOP MIDDLE LEFT
  rect(50, 105, 38, 15);
  
  //TOP MIDDLE RIGHT
  rect(357, 105, 38, 15);
}

void mazeThreePiece(){
  //BOTTOM LEFT
  line(50, 437.5, 50, 452.5);
  line(50, 437.5, 135, 437.5);  
  line(135, 437.5, 135, 387.5);
  line(135, 387.5, 150, 387.5);
  line(150, 387.5, 150, 437.5);
  line(150, 437.5, 185, 437.5);
  line(185, 452.5, 185, 437.5);
  line(50, 452.5, 185, 452.5);
  
  //BOTTOM MIDDLE
  line(185, 387.5, 185, 402.5);
  line(185, 387.5, 270, 387.5);
  line(270, 387.5, 270, 402.5);
  line(270, 402.5, 235, 402.5);
  line(235, 402.5, 235, 452.5);
  line(235, 452.5, 220, 452.2);
  line(220, 452.5, 220, 402.5);
  line(220, 402.5, 185, 402.5);
  
  //BOTTOM RIGHT
  line(270, 452.5, 270, 437.5);
  line(270, 437.5, 305, 437.5);
  line(305, 437.5, 305, 387.5);
  line(305, 387.5, 320, 387.5);
  line(320, 387.5, 320, 437.5);
  line(320, 437.5, 405, 437.5);
  line(405, 437.5, 405, 452.5);
  line(405, 452.5, 270, 452.5);
  
  //MIDDLE BOTTOM
  noFill();
  beginShape();
  vertex(235, 352.5);
  vertex(220, 352.5);
  vertex(220, 302.5);
  vertex(185, 302.5);
  vertex(185, 287.5);
  vertex(270, 287.5);
  vertex(270, 302.5);
  vertex(235, 302.5);
  endShape(CLOSE);
  
  //MIDDLE LEFT
  beginShape();
  vertex(123, 105);
  vertex(138, 105);
  vertex(138, 155);
  vertex(173, 155);
  vertex(173, 170);
  vertex(138, 170);
  vertex(138, 215);
  vertex(123, 215);  
  endShape(CLOSE);
  
  //MIDDLE RIGHT
  beginShape();
  vertex(322, 105);
  vertex(307, 105);
  vertex(307, 155);
  vertex(272, 155);
  vertex(272, 170);
  vertex(307, 170);
  vertex(307, 215);
  vertex(322, 215);  
  endShape(CLOSE);
  
  //MIDDLE MIDDLE
  //there is an extra 3.5 on each side in the path
  beginShape();
  vertex(230, 170);
  vertex(215, 170);
  vertex(215, 120);
  vertex(180, 120);
  vertex(180, 105);
  vertex(265, 105);
  vertex(265, 120);
  vertex(230, 120);  
  endShape(CLOSE);  
  fill(0);
}

void mazeL(){
  //BOTTOM LEFT
  line(50, 341.25, 50, 356.25);
  line(50, 341.25, 100, 341.25);
  line(50, 356.25, 85, 356.25);
  line(85, 356.25, 85, 402.5);
  line(100, 341.25, 100, 402.5);
  line(85, 402.5, 100, 402.5);
  
  //BOTTOM RIGHT
  line(370, 402.5, 355, 402.5);
  line(355, 402.5, 355, 341.25);
  line(355, 341.25, 405, 341.25);
  line(405, 341.25, 405, 356.25);
  line(405, 356.25, 370, 356.25);
  line(370, 356.25, 370, 402.5);
}

void mazeEdges(){
  //width of path is 35
  //5 pixels between each line
  //
  strokeWeight(2.5);
  stroke(42, 37, 227);
  
  //VERY TOP
  line(10, 0, 445, 0); //changed
  line(15, 5, 215, 5);
  line(230, 5, 440, 5);
  //middle space
  line(215, 5, 215, 55);
  line(230, 5, 230, 55);
  line(215, 55, 230, 55);
  
  //LEFT SIDE FROM THE TOP TO THE MIDDLE
  //down 160, 150
  line(10, 0, 10, 160); //<>//
  line(15, 5, 15, 155);
  //to right 85, 85
  line(10, 160, 95, 160);
  line(15, 155, 100, 155);
  //down 50, 60
  line(95, 160, 95, 210);
  line(100, 155, 100, 215);
  //to left 85, 90
  line(95, 210, 10, 210);
  line(100, 215, 10, 215);
  
  //LEFT SIDE FROM THE MIDDLE TO THE BOTTOM
  //to right 90, 85
  line(10, 250, 100, 250);
  line(10, 255, 95, 255);
  //down 60, 50
  line(100, 250, 100, 310);
  line(95, 255, 95, 305);
  //to left 85, 85
  line(100, 310, 15, 310);
  line(95, 305, 10, 305);
  //down right line 115, the exteding part is 15 wide
  //    down 77.5 and 77.5
  line(15, 310, 15, 387.5);
  line(15, 402.5, 15, 480);
  //    to left 35
  line(15, 387.5, 50, 387.5);
  line(15, 402.5, 50, 402.5);
  line(50, 387.5, 50, 402.5);
  //down left line 125
  line(10, 305, 10, 485);
  
  //VERY BOTTOM
  line(15, 480, 440, 480);
  line(10, 485, 445, 485);
  
  //RIGHT SIDE FROM BOTTOM TO MIDDLE
  //up right line
  line(445, 485, 445, 305);
  //up left line
  //    up 77.5 and 77.5
  line(440, 480, 440, 402.5);
  line(440, 387.5, 440, 310);
  //    to right 35
  line(440, 402.5, 405, 402.5);
  line(440, 387.5, 405, 387.5);
  line(405, 402.5, 405, 387.5);
  //to left 85, 85
  line(440, 310, 355, 310);
  line(445, 305, 360, 305);
  //up 60, 50
  line(355, 310, 355, 250);
  line(360, 305, 360, 255);
  //to right 90, 85
  line(355, 250, 445, 250);
  line(360, 255, 445, 255);
  
  //RIGHT SIDE FROM MIDDLE TO TOP
  //to left 90, 85
  line(445, 215, 355, 215);
  line(445, 210, 360, 210);
  //up 60, 50
  line(355, 215, 355, 155);
  line(360, 210, 360, 160);
  //to right 85, 85
  line(355, 155, 440, 155);
  line(360, 160, 445, 160);
  //up 150, 160
  line(440, 155, 440, 5);
  line(445, 160, 445, 0);
  
}