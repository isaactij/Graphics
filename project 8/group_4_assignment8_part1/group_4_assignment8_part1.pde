//import java.util.map;
float numPass;
int i;
int start = 0;
HashMap<Integer, String> months = new HashMap<Integer, String>();
HashMap<Integer, String> years = new HashMap<Integer, String>();
String[] month;
int y = 150;
Table table;
int textX = 150, textY = 120;
int limit = 12;
int grabYear = 0;

void setup(){  
  size(1000, 875);
  table = loadTable("AirPassengers.csv", "header"); 

}
  void mousePressed(){
    start += 12;
    limit += 12;
    textX = 150;
    textY = 120;
    grabYear += 1;
    if (mousePressed == true) {
      redraw();
  } 
}
void draw(){
  background(255);
  noLoop();
  textSize(32);
  fill(0);
  //textMode(CENTER);
  text("Monthly Airline Passenger Numbers 1949 - 1960", 150, 50); 

  textSize(16);
  months.put(1, "January");  months.put(2, "February");
  months.put(3, "March");  months.put(4, "April");
  months.put(5, "May");  months.put(6, "June");
  months.put(7, "July");  months.put(8, "August");
  months.put(9, "September");  months.put(10, "October");
  months.put(11, "November");  months.put(0, "December");

  years.put(0, "1949");  years.put(1, "1950");
  years.put(2, "1951");  years.put(3, "1952");
  years.put(4, "1953");  years.put(5, "1954");
  years.put(6, "1955");  years.put(7, "1956");
  years.put(8, "1957");  years.put(9, "1958");
  years.put(10, "1959");  years.put(11, "1960");
  
  if (i == 144 && grabYear == 12){
    start = 0;
    limit = 12;
    grabYear = 0;}
  for (i = start; i < limit; i ++){
   //month
     String mark = table.getString(i, "mark");
     int mark1 = int(mark);
     int test = mark1 % 12;
     String test1 = months.get(test);
     fill(0);
     text(test1, textX, textY);
     //print(months.get(test) + " ");
    
   //bars
     rectMode(CORNER);
     fill(255, 50, 50);
     int numPass = table.getInt(i, "AirPassengers");
     fill(255, 50, 50);
     rect(textX + 100, textY - 30, numPass, 50);
     rect(400, 820, 50, 50);
     fill(0);
     text(numPass + " Passengers", textX + 110, textY);
     text(" = Number of Passengers", 450, 850);
     
     
    
     textY += 60;
     //if (i == 11){
     //  noLoop();}
 }
     textSize(22);
     String test2 = years.get(grabYear);
     text(test2, 50, 450);
     textSize(16);
}