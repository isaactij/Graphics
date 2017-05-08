class gameOver{
  
  int x, y;
  String username = "";
  boolean isDone;
  
  gameOver(){
    isDone = false;}

void screen(){
  background(255);
  fill(0);
  textSize(24);
  text("enter username in lowercase: ", 10, 50);
  text(username, 20, 100);
  text("press enter to submit", 20, 150);
  noFill();
}
String show() {
  background(255);
  //username = username.substring(0, username.length()-1);
  if (keyPressed == true){
    if (key==BACKSPACE) {
     if (username.length()>0) {
        username = username.substring(0, username.length()-1);}}
    else if (key == ENTER){
      print("enter ");
      //username = "";
      text("DONE!", 50, 200);
      isDone = true;}
    else{
      username += key;}}
  fill(0);
  textSize(24);
  text("enter username in lowercase: ", 10, 50);
  text(username, 20, 100);
  text("press enter to submit", 20, 150);
  noFill();
  return(username);
  
  }

boolean isDone(){
  return isDone;}

}