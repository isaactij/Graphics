class hover {
  int x;
  int y;
  float w;
  int h;
  
  hover() {
    x = 0;
    y = 0;
    w = 0;
    h = 0;
  }
  
  hover(int givenX, int givenY , float givenW, int givenH){
    x = givenX;
    y = givenY;
    w = givenW;
    h = givenH;
  }
  
  boolean inArea(int xpos, int ypos){
    if((xpos <= x + w && xpos >= x - w) && (ypos <= y + h && ypos >= y - h)){
      return true;
    }else{
      return false;
    }
  }
  
  int x(){
    return x;
  }
  
  int y(){
    return y;
  }
  
  float w(){
    return w;
  }
  
  int h(){
    return h;
  }
}