class tree {

  PShape tree;
  PShape leaf;
  float scale, x, y, z;

  tree() {
    tree = loadShape("palm-tree-trunk.obj");
    leaf = loadShape("palm-tree-leaf.obj");
    scale = 25;
    x = 500;
    y = 250;
    z = 0;
  }

  void drawTree() {
    drawTrunk();
    drawLeaves();
  }

  void moveTree() {
    moveLeafSix(0, 0, 0);
  }

  void drawLeaves() { 
    drawFirstLeaf();
    drawSecondLeaf();
    drawThirdLeaf();
    drawFourthLeaf();
    drawFifthLeaf();
    drawSixthLeaf();
  }

  void drawFirstLeaf() {
    pushMatrix();
    scale(1.5);
    translate(1.5, 0.5, 1);
    rotateX(4*PI/3);
    shape(leaf);
    popMatrix();
  }

  void drawSecondLeaf() {
    pushMatrix();
    scale(1.5);
    translate(0.8, -0.2, 1);
    rotateX(4*PI/3);
    rotateY(2*PI/8);
    shape(leaf); 
    popMatrix();
  }

  void drawThirdLeaf() {
    pushMatrix();
    scale(1.5);
    translate(0, -0.3, 1);
    rotateX(4*PI/3);
    rotateY(4*PI/8);
    shape(leaf); 
    popMatrix();
  }

  void drawFourthLeaf() {
    pushMatrix();
    scale(1.5);
    translate(-0.8, -0.2, 1);
    rotateX(4*PI/3);
    rotateY(6*PI/8);
    shape(leaf); 
    popMatrix();
  }

  void drawFifthLeaf() {
    pushMatrix();
    scale(1.5);
    translate(-1.2, 0.5, 1);
    rotateX(4*PI/3);
    rotateY(8*PI/8);
    shape(leaf); 
    popMatrix();
  }

  void drawSixthLeaf() {
    pushMatrix();
    scale(1.5);
    translate(-1.2, 1.5, 1);
    rotateX(4*PI/3);
    rotateY(10*PI/8);
    shape(leaf); 
    popMatrix();
  }
  
  void moveLeafOne(int rotate){
    pushMatrix();
    scale(1.5);
    translate(1.5, 0.5, 1);
    rotateX(4*PI/3);
    rotateY((0 + 0.5 * rotate) /PI);
    shape(leaf);
    popMatrix();
  }
  
  void moveLeafTwo(int rotate){
    pushMatrix();
    scale(1.5);
    translate(0.8, -0.2, 1);
    rotateX(4*PI/3);
    rotateY((2 + 0.5 * rotate) * PI/8);
    shape(leaf); 
    popMatrix();
  }
  
  void moveLeafThree(int rotate){
    pushMatrix();
    scale(1.5);
    translate(0, -0.3, 1);
    rotateX(4*PI/3);
    rotateY((4 + 0.5 * rotate) * PI/8);
    shape(leaf); 
    popMatrix();
  }

  void moveLeafFour(int rotate, float xShift, float yShift) {
    pushMatrix();
    scale(1.5);
    translate(-0.8 + xShift, -0.2 - yShift, 1);
    rotateX(4*PI/3);
    rotateY((6 - 0.5 * rotate) * PI/8);
    shape(leaf); 
    popMatrix();
  }

  void moveLeafFive(int rotate, float xShift, float yShift) {
    pushMatrix();
    scale(1.5);
    translate(-1.2 + xShift, 0.5 - yShift, 1);
    rotateX(4*PI/3);
    rotateY((8 - rotate * 0.5) * PI/8);
    shape(leaf); 
    popMatrix();
  }

  void moveLeafSix(int rotate, float xShift, float yShift) {
    drawTrunk();
    drawFirstLeaf();
    pushMatrix();
    scale(1.5);
    translate(-1.2 + xShift, 1.5 - yShift, 1);
    rotateX(4*PI/3);
    rotateY((10 + 0.5 * rotate) * PI/8);
    shape(leaf); 
    popMatrix();
  }

  void drawTrunk() {
    //pushMatrix();
    translate(x, y, z);
    //when no y rotation
    rotateZ(PI/8);
    //when y rotation PI
    //rotateZ(15*PI/8);
    //rotateY(PI);
    scale(scale, scale, scale);
    shape(tree);
    //popMatrix();
  }



  float trunkX() {
    return x;
  }

  float trunkY() {
    return y;
  }

  float trunkZ() {
    return x;
  }
}