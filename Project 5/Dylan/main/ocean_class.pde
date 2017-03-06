class ocean{

  
    void display(int t ){
      

        fill(49,198,247);
        stroke(24,159,204);
        rotate(.15);
        //background(255);  
        translate(250,500 + t,0);
        translate(-200,-1,0);
        box(300);
        translate(200,1,0);
        box(300);
        rotate(-.3);
        translate(50,0,0);
        box(300);

        translate(250,35,0);
        rotate(.3);
        box(300);
        rotate(-.3);
        translate(50,0,0);
        box(300);
  
        translate(250,40,0);
        rotate(.3);
        box(300);
        rotate(-.3);
        translate(200,10,0);
        box(300);
        
        translate(-900, -650 - t , 0);
        rotate(.15);
        noFill();
 
    }
}