Table table;
HashMap<String, Integer> state_profit = new HashMap<String, Integer>();
HashMap<String, Integer> state_marketing = new HashMap<String, Integer>();
ArrayList<String> states = new ArrayList<String>();

void setup(){  
  size(1200, 600);
  table = loadTable("coffee.csv", "header");   
}

void draw(){
  
  make_dicts();
  
  //print(state_profit);
  //print(state_marketing);
  //print(states);
  
  int divider = 1200/20;
  
  for(int i = 0; i < 256; i++){
    stroke(0,i,0);
    rect(650+i*2,100,1,20);
    
  }
  
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
  print(states);  
  noLoop();

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