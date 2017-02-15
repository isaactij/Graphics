int windowWidth = 700;
color one = color(255, 100, 50);
color two = color(10, 50, 255);
color three = color(10, 255, 50);
PFont georgia;

void setup(){
  size(700, 600);
}

void draw(){
  georgia = createFont("Georgia", 10);
  textFont(georgia);
  background(255);
  noLoop();
  write();
}

void mousePressed(){
  if(mousePressed == true){ //<>//
    redraw();
  }
  
}
void write(){
  String[] lines = loadStrings("uniquewords.txt"); //<>//
  int x = 0;
  int y = 16;
  int tSize = 10;
  textSize(tSize);
  color now = one;
  int word = int(random(lines.length - 1));
  for(int i = 0; i < lines.length; i++){    
    int wordLength = lines[word].length();
    if(wordLength < 6){      
      now = one;      
    }else{
      if(wordLength >= 6 && wordLength < 8){
      now = two;
      }else{
      now = three;
      }
    }
    fill(now);
    text(lines[word], x, y);
    x += textWidth(lines[word]);
    x += 5;
    word = int(random(lines.length - 1));
    int test = x;
    if((test += textWidth(lines[word])) > windowWidth){
      x = 0;
      y += tSize;
      if(y >= 600){
        i = lines.length;
      }
    }
  } //<>//
}