class{

    float x, y, w, h;

    tube(){
        x = 50;
        y = 50;
        w = 100;
        h = 150;      
    }

    tube(int givenX){
        x = givenX;
        w = 100;
        h = 150;
    }

    void display(int px){
        rect(x);
    }

}