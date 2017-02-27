class pellet{
  
  int x_modifier = 0;
  int y_modifier = 0;
  ArrayList<Integer> coords = new ArrayList<Integer>();
  int x_pos = 0;
  int y_pos = 0;
  
  void get_pac_coords(int x, int y){
    
    if(x != x_pos || y != y_pos){
      x_pos = x;
      y_pos = y;
      coords.add(x_pos);
      coords.add(y_pos);


      
    }
    
  }
  
  void display(int x){
    
    
    
     if (x % 64 == 0){
        x_modifier = -1;
        y_modifier = 1;
     }
     else if (x % 32 == 0){
        x_modifier = 1;
        y_modifier = 1;
     }
     else if(x % 16 == 0){
        x_modifier = -1;
        y_modifier = -1;
     }
     else if(x % 8 == 0){
       x_modifier = 1;
       y_modifier = -1;
       
     }
       
       noStroke();
       fill(255,255,255);
       //x vector 1L
       for(int i = 1; i < 12; i++){
         rect(14 + i*17 + x_modifier, 21 + y_modifier, 4, 4);
       }
       //x vector 1R
       for(int i = 1; i < 12; i++){
         rect(235 + i*17 + x_modifier, 21 + y_modifier, 4, 4);
       }
       //y vector left
       for(int i = 1; i < 23; i++){
          rect(116 + x_modifier, 21 + i*18 + y_modifier, 4, 4);
       }
       //y vector right
       for(int i = 1; i < 23; i++){
          rect(337 + x_modifier, 21 + i*18 + y_modifier, 4, 4);
       }
       //x vector 2
       for(int i = 1; i < 25; i++){
         if(i == 6 || i == 19){
           continue;
         }
         rect(14 + i*17 + x_modifier, 86 + y_modifier, 4, 4);
       }
       //x vector 3 
       for(int i = 1; i < 25 ; i++){
         if(i == 6|| i == 19 || i == 7 || i == 8 || i == 12|| i == 13 || i == 17 || i == 18){
           continue;
         }
         rect(14 + i*17 + x_modifier, 135 + y_modifier, 4, 4);
       }
       //x vector 4
       for(int i = 1; i < 9; i++){
         rect(150 + i*17 + x_modifier, 188 + y_modifier, 4, 4);
       }
       //x vector 5
       for(int i = 1; i < 27 ; i++){
         if(i >10 && i < 17){
           continue;
         }
         if(i == 7 || i == 20){
           continue;
         }
         rect(i*17 + x_modifier, 230 + y_modifier, 4, 4);
       }       
       //x vector 6
       for(int i = 1; i < 9; i++){
         rect(150 + i*17 + x_modifier, 270 + y_modifier, 4, 4);
       }    

       //x vector 7L
       for(int i = 1; i < 12; i++){
         if(i == 6){
           continue;
         }
         rect(14 + i*17 + x_modifier, 325 + y_modifier, 4, 4);
       }
       //x vector 7R
       for(int i = 1; i < 12; i++){
         if(i == 6){
           continue;
         }         
         rect(235 + i*17 + x_modifier, 325 + y_modifier, 4, 4);
       }
       
       //x vector 8
       for(int i = 1; i < 25; i++){
         if(i == 4 || i == 5 || i == 6 || i == 12 || i == 19 || i == 20 || i == 21){
           continue;
         }
          rect(14 + i*17 + x_modifier, 368 + y_modifier, 4, 4);
       }
       
       //x vector 9
       for(int i = 1; i < 25; i++){
         if( i == 7 || i == 8 || i == 12|| i == 13 || i == 17 || i == 18){
           continue;
         }
          rect(14 + i*17 + x_modifier, 418 + y_modifier, 4, 4);
       }    
    
      //x vector 9
       for(int i = 1; i < 25; i++){
          rect(14 + i*17 + x_modifier, 464 + y_modifier, 4, 4);
       }
       
       rect(14+17+x_modifier, 21+17+y_modifier, 4, 4);
       rect(14+17+x_modifier, 21+34+y_modifier, 4, 4);
       rect(14+17+x_modifier, 21+51+y_modifier, 4, 4);
       
       rect(14+187+x_modifier, 21+17+y_modifier, 4, 4);
       rect(14+187+x_modifier, 21+34+y_modifier, 4, 4);
       rect(14+187+x_modifier, 21+51+y_modifier, 4, 4); 
       
       rect(14+238+x_modifier, 21+17+y_modifier, 4, 4);
       rect(14+238+x_modifier, 21+34+y_modifier, 4, 4);
       rect(14+238+x_modifier, 21+51+y_modifier, 4, 4); 
       
       
       rect(14+408+x_modifier, 21+17+y_modifier, 4, 4);
       rect(14+408+x_modifier, 21+34+y_modifier, 4, 4);
       rect(14+408+x_modifier, 21+51+y_modifier, 4, 4); 
       
              
       rect(14+17+x_modifier, 21+17+y_modifier, 4, 4);
       rect(14+17+x_modifier, 21+34+y_modifier, 4, 4);
       rect(14+17+x_modifier, 21+51+y_modifier, 4, 4);
       
       //far left fill
       rect(31+x_modifier, 21+85+y_modifier, 4, 4);
       rect(31+x_modifier, 21+102+y_modifier, 4, 4);
       
       //middle left fill
       rect(167+x_modifier, 21+85+y_modifier, 4, 4);
       rect(167+x_modifier, 21+102+y_modifier, 4, 4);
       
       //middle righht fill
       rect(286+x_modifier, 21+85+y_modifier, 4, 4);
       rect(286+x_modifier, 21+102+y_modifier, 4, 4);
       
       //far right fill
       rect(422+x_modifier, 21+85+y_modifier, 4, 4);
       rect(422+x_modifier, 21+102+y_modifier, 4, 4);
       
       //very middle fill
       rect(201 + x_modifier, 174+y_modifier, 4, 4);
       rect(252 + x_modifier, 174+y_modifier, 4, 4);
       rect(201 + x_modifier, 157+y_modifier, 4, 4);
       rect(252 + x_modifier, 157+y_modifier, 4, 4);
       
       //middle left fill
       rect(167+x_modifier, 206+y_modifier, 4, 4);
       rect(167+x_modifier, 220+y_modifier, 4, 4);
       rect(167+x_modifier, 245+y_modifier, 4, 4);
       rect(167+x_modifier, 255+y_modifier, 4, 4);
       rect(167+x_modifier, 305+y_modifier, 4, 4);
       rect(167+x_modifier, 290+y_modifier, 4, 4);
       
       //middle right fill
       rect(286+x_modifier, 206+y_modifier, 4, 4);
       rect(286+x_modifier, 220+y_modifier, 4, 4);
       rect(286+x_modifier, 245+y_modifier, 4, 4);
       rect(286+x_modifier, 255+y_modifier, 4, 4);
       rect(286+x_modifier, 305+y_modifier, 4, 4);
       rect(286+x_modifier, 290+y_modifier, 4, 4);
              
       rect(31 + x_modifier, 340 + y_modifier, 4, 4);
       rect(31 + x_modifier, 355 + y_modifier, 4, 4);

       rect(201 + x_modifier, 340 + y_modifier, 4, 4);
       rect(201 + x_modifier, 355 + y_modifier, 4, 4);
       
       rect(252 + x_modifier, 340 + y_modifier, 4, 4);
       rect(252 + x_modifier, 355 + y_modifier, 4, 4);
      
       rect(422 + x_modifier, 340 + y_modifier, 4, 4);
       rect(422 + x_modifier, 355 + y_modifier, 4, 4);    
       
       rect(65 + x_modifier, 385+y_modifier, 4, 4);
       rect(65 + x_modifier, 400+y_modifier, 4, 4);
       
       rect(167 + x_modifier, 385+y_modifier, 4, 4);
       rect(167 + x_modifier, 400+y_modifier, 4, 4);
      
       rect(286 + x_modifier, 385+y_modifier, 4, 4);
       rect(286 + x_modifier, 400+y_modifier, 4, 4);
      
       rect(388 + x_modifier, 385+y_modifier, 4, 4);
       rect(388 + x_modifier, 400+y_modifier, 4, 4);     
       
       rect(31 + x_modifier, 432+y_modifier, 4, 4);
       rect(31 + x_modifier, 448+y_modifier, 4, 4);
       
       rect(201 + x_modifier, 432+y_modifier, 4, 4);
       rect(201 + x_modifier, 448+y_modifier, 4, 4);

       rect(252 + x_modifier, 432+y_modifier, 4, 4);
       rect(252 + x_modifier, 448+y_modifier, 4, 4);

       rect(422 + x_modifier, 432+y_modifier, 4, 4);
       rect(422 + x_modifier, 448+y_modifier, 4, 4);

      fill(0,0,0);
      
  
        for(int i = 10; i < coords.size()-50; i+=2){
           ellipse(coords.get(i)-1,coords.get(i+1)+1,20,20); 
        }
        
      

  }

  
  
}
