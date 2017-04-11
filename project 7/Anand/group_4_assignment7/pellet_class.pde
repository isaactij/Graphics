class pellet {

  PShape pelletShape;
  int[][] positions;
  int totPoints;


  pellet() {
    stroke(255);
    pelletShape = createShape(RECT, 0, 0, 4, 4);
    totPoints = 0;
    writePositions();
  }
  
  void display(float pacX, float pacY){
    for(int i = 0; i < 500; i++){
      for(int j = 0; j < 460; j++){ //<>//
        if(positions[j][i] == 1){
          shape(pelletShape, j, i);
          if(pacX < j + 10 && pacX > j - 10 && pacY < i + 10 && pacY > i - 10){
            positions[j][i] = 0;
            totPoints++;
          }
        }
      }
    }
  }
  
  int point(){
    return totPoints;
  }

  void writePositions() {
    positions = new int[460][500];

    int x_modifier = 0;
    int y_modifier = 0;

    for (int i = 1; i < 12; i++) {
      positions[14 + i*17 ][21 ] = 1;
    }
    //x vector 1R
    for (int i = 1; i < 12; i++) {
      positions[235 + i*17 ][21 ] = 1;
    }
    //y vector left
    for (int i = 1; i < 23; i++) {
      positions[116 ][21 + i*18 ] = 1;
    }
    //y vector right
    for (int i = 1; i < 23; i++) {
      positions[337 ][21 + i*18 ] = 1;
    }
    //x vector 2
    for (int i = 1; i < 25; i++) {
      if (i == 6 || i == 19) {
        continue;
      }
      positions[14 + i*17 ][86 ] = 1;
    }
    //x vector 3 
    for (int i = 1; i < 25; i++) {
      if (i == 6|| i == 19 || i == 7 || i == 8 || i == 12|| i == 13 || i == 17 || i == 18) {
        continue;
      }
      positions[14 + i*17 ][135 ] = 1;
    }
    //x vector 4
    for (int i = 1; i < 9; i++) {
      positions[150 + i*17 ][188 ] = 1;
    }
    //x vector 5
    for (int i = 1; i < 27; i++) {
      if (i >10 && i < 17) {
        continue;
      }
      if (i == 7 || i == 20) {
        continue;
      }
      positions[i*17 ][230 ] = 1;
    }       
    //x vector 6
    for (int i = 1; i < 9; i++) {
      positions[150 + i*17 ][270 ] = 1;
    }    

    //x vector 7L
    for (int i = 1; i < 12; i++) {
      if (i == 6) {
        continue;
      }
      positions[14 + i*17 ][325 ] = 1;
    }
    //x vector 7R
    for (int i = 1; i < 12; i++) {
      if (i == 6) {
        continue;
      }         
      positions[235 + i*17 ][325 ] = 1;
    }

    //x vector 8
    for (int i = 1; i < 25; i++) {
      if (i == 4 || i == 5 || i == 6 || i == 12 || i == 19 || i == 20 || i == 21) {
        continue;
      }
      positions[14 + i*17 ][368 ] = 1;
    }

    //x vector 9
    for (int i = 1; i < 25; i++) {
      if ( i == 7 || i == 8 || i == 12|| i == 13 || i == 17 || i == 18) {
        continue;
      }
      positions[14 + i*17 ][418 ] = 1;
    }    

    //x vector 9
    for (int i = 1; i < 25; i++) {
      positions[14 + i*17 ][464 ] = 1;
    }

    positions[14+17+x_modifier][21+17+y_modifier] =1;
    positions[14+17+x_modifier][21+34+y_modifier] = 1;
    positions[14+17+x_modifier][21+51+y_modifier] = 1;

    positions[14+187+x_modifier][21+17+y_modifier] = 1;
    positions[14+187+x_modifier][21+34+y_modifier] = 1;
    positions[14+187+x_modifier][21+51+y_modifier] = 1; 

    positions[14+238+x_modifier][21+17+y_modifier] = 1;
    positions[14+238+x_modifier][21+34+y_modifier] = 1;
    positions[14+238+x_modifier][21+51+y_modifier] = 1; 


    positions[14+408+x_modifier][21+17+y_modifier] = 1;
    positions[14+408+x_modifier][21+34+y_modifier] = 1;
    positions[14+408+x_modifier][21+51+y_modifier] = 1; 


    positions[14+17+x_modifier][21+17+y_modifier] = 1;
    positions[14+17+x_modifier][21+34+y_modifier] = 1;
    positions[14+17+x_modifier][21+51+y_modifier] = 1;

    //far left fill
    positions[31+x_modifier][21+85+y_modifier] = 1;
    positions[31+x_modifier][21+102+y_modifier] = 1;

    //middle left fill
    positions[167+x_modifier][21+85+y_modifier] = 1;
    positions[167+x_modifier][21+102+y_modifier] = 1;

    //middle righht fill
    positions[286+x_modifier][21+85+y_modifier] = 1;
    positions[286+x_modifier][21+102+y_modifier] = 1;

    //far right fill
    positions[422+x_modifier][21+85+y_modifier] = 1;
    positions[422+x_modifier][21+102+y_modifier] = 1;

    //very middle fill
    positions[201 ][174+y_modifier] = 1;
    positions[252 ][174+y_modifier] = 1;
    positions[201 ][157+y_modifier] = 1;
    positions[252 ][157+y_modifier] = 1;

    //middle left fill
    positions[167+x_modifier][206+y_modifier] = 1;
    positions[167+x_modifier][220+y_modifier] = 1;
    positions[167+x_modifier][245+y_modifier] = 1;
    positions[167+x_modifier][255+y_modifier] = 1;
    positions[167+x_modifier][305+y_modifier] = 1;
    positions[167+x_modifier][290+y_modifier] = 1;

    //middle right fill
    positions[286+x_modifier][206+y_modifier] = 1;
    positions[286+x_modifier][220+y_modifier] = 1;
    positions[286+x_modifier][245+y_modifier] = 1;
    positions[286+x_modifier][255+y_modifier] = 1;
    positions[286+x_modifier][305+y_modifier] = 1;
    positions[286+x_modifier][290+y_modifier] = 1;

    positions[31 ][340 ] = 1;
    positions[31 ][355 ] = 1;

    positions[201 ][340 ] = 1;
    positions[201 ][355 ] = 1;

    positions[252 ][340 ] = 1;
    positions[252 ][355 ] = 1;

    positions[422 ][340 ] = 1;
    positions[422 ][355 ] = 1;    

    positions[65 ][385+y_modifier] = 1;
    positions[65 ][400+y_modifier] = 1;

    positions[167 ][385+y_modifier] = 1;
    positions[167 ][400+y_modifier] = 1;

    positions[286 ][385+y_modifier] = 1;
    positions[286 ][400+y_modifier] = 1;

    positions[388 ][385+y_modifier] = 1;
    positions[388 ][400+y_modifier] = 1;     

    positions[31 ][432+y_modifier] = 1;
    positions[31 ][448+y_modifier] = 1;

    positions[201 ][432+y_modifier] = 1;
    positions[201 ][448+y_modifier] = 1;

    positions[252 ][432+y_modifier] = 1;
    positions[252 ][448+y_modifier] = 1;

    positions[422 ][432+y_modifier] = 1;
    positions[422 ][448+y_modifier] = 1;
  }
}