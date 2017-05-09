class gameOver{
  
  int x, y;
  String username = "";
  boolean isDone;
  boolean victory;
  
  gameOver(){
    isDone = false;
    victory = false;}

String show() {
  background(255);
  //username = username.substring(0, username.length()-1);
  if (keyPressed == true){
    if (key==BACKSPACE) {
     if (username.length()>0) {
        username = username.substring(0, username.length()-1);}}
    else if (key == ENTER){
      print("enter ");
      isDone = true;}
    else{
      username += key;}}
  fill(0);
  textSize(24);
  
  if (victory == true){
  text("Game Over. You have won the game!\nEnter your username in lowercase: ", 10, 50);}
  else{  text("Game Over. You have lost the game!\nEnter your username in lowercase: ", 10, 50);}

  text(username, 20, 120);
  text("press enter to submit", 20, 150);
  noFill();
  return(username);
  
  }

boolean isDone(){
  return isDone;}

}