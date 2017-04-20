Table table;
HashMap<String, Integer> state_profit = new HashMap<String, Integer>();
HashMap<String, Integer> state_marketing = new HashMap<String, Integer>();
ArrayList<String> states = new ArrayList<String>();
int changer = 1;

void setup(){  
  size(1200, 600);
  table = loadTable("coffee.csv", "header");   
  background(0);
  make_dicts();

}

void draw(){
  
  //print(state_profit);
  //print(state_marketing);
  //print(states);
  
  int divider = 1200/20;
  
  for(int i = 0; i < 256; i++){
    stroke(0,i,0);
    rect(650+i*2,100,1,20);    
  }
  
  textSize(15);
  fill(255,0,0);
  text("$0",650,140);
  text("$16062",1130,140);  
  text("Marketing Budget",840,140);
  textSize(10);
  
  for(int i = 0; i < 20; i++){
     stroke(0);
     fill(0,state_marketing.get(states.get(i))/67.745,0);
     rect(i*divider, 600-state_profit.get(states.get(i))/52.975, divider, state_profit.get(states.get(i))/52.975);
     fill(0);
     text(states.get(i),i*divider+2,597);
     if (i == 0 || i == 1){
       text(states.get(i),i*divider+2,568);
     }
  
  }
  
  textSize(30);
  fill(255,255,255);
  rect(0,570,120,30);
  fill(0);
  text("STATES",10,595);
  fill(255,255,255);
  textSize(12);
  text("click to display marketing budget in dollars at tops of bars, click again to display profit", 650,30);
  textSize(24);
  fill(255,255,255);
  rect(0,428,30,130);
  fill(0);
 
  text("P",0,448);
  text("R",0,468);
  text("O",0,488);
  text("F",0,508);
  text("I",2,528);
  text("T",0,548);



  
  


  }  


void mouseClicked() {
  
  
  int divider = 1200/20;
   changer++;
   if(changer % 2 == 0){
   for(int i = 0; i < 20; i++){
     textSize(10);
     fill(255,255,255);
     rect(i*divider,590-state_profit.get(states.get(i))/52.975,60,13);
     fill(0);
     text(state_profit.get(states.get(i)),i*divider+2,599-state_profit.get(states.get(i))/52.975);
    }
           fill(0);
    rect(650,260,300,100);
   textSize(20);
   fill(255,0,0);
   text("Profit Listed", 650, 300);
   }
    else{for(int i = 0; i < 20; i++){
     textSize(10); 
     fill(255,255,255);
     rect(i*divider,590-state_profit.get(states.get(i))/52.975,60,13);
     fill(0);
     text(state_marketing.get(states.get(i)),i*divider+2,599-state_profit.get(states.get(i))/52.975);
    }
        fill(0);
    rect(650,260,200,100);
    fill(255,0,0);
    textSize(20);
    text("Marketing Budget Listed", 650, 300);
      
    }
  

}



void make_dicts(){
  
    for(int i = 0; i < table.getRowCount(); i++){
    
    String state = table.getString(i,6);
    Integer marketing = table.getInt(i,16);
    Integer profit = table.getInt(i,19);
    
    if(states.contains(state) == false){
       states.add(state); 
    }
    
    Integer prior_marketing = state_marketing.get(state);
    if(prior_marketing == null){
      prior_marketing = 0;
    }
    
    Integer prior_profit = state_profit.get(state);
    if(prior_profit == null){
      prior_profit = 0; 
    }
    
    state_marketing.put(state, prior_marketing += marketing);
    state_profit.put(state, prior_profit += profit);
    
  }
  
  
}