class bird {

  float x1;
  float y1;
  float x2;
  float y2;
  PShape b;
  float x3;
  float y3;
  float x4;
  float y4;
  float x5;
  float y5;
  float x6;
  float y6;
  boolean backx;
  boolean backy;
  float x;
  float y;
  boolean dead1;
  boolean dead2;
  boolean dead3;
  boolean dead4;
  boolean dead5;
  boolean dead6;
  boolean eaten1;
  boolean eaten2;
  boolean eaten3;
  boolean eaten4;
  boolean eaten5;
  boolean eaten6;
  int eatenCount1;
  int eatenCount2;
  int eatenCount3;
  int eatenCount4;
  int eatenCount5;
  int eatenCount6;
  boolean leader2eaten;
  boolean leader3eaten;
  boolean leader4eaten;
  boolean leader5eaten;
  boolean leader6eaten;
  float leader2X;
  float leader3X;
  float leader4X;
  float leader5X;
  float leader6X;
  float leader2Y;
  float leader3Y;
  float leader4Y;
  float leader5Y;
  float leader6Y;
  float leaderX;
  float leaderY;
  int eatenCountMax;

  float predatorX;
  float predatorY;  
  int predatorCount;
  float predatorLastX;
  float predatorLastY;


  bird() {
    x1 = 50;
    y1 = 50;
    x2 = 155;
    y2 = 50;
    x3 = 60;
    y3 = 50;
    x4 = 65;
    y4 = 50;
    x5 = 70;
    y5 = 50;
    x6 = 75;
    y6 = 50;

    x = mouseX;
    y = mouseY;

    b = createShape();
    b.beginShape();
    b.noFill();
    b.vertex(-5, -5);
    b.vertex(0, 0);
    b.vertex(5, -5);
    b.endShape();

    backx = false;
    backy = false;

    dead1 = false; ////////////////////////////////////////////////////////////////////////////////////////////////
    dead2 = false;
    dead3 = false;
    dead4 = false;
    dead5 = false;
    dead6 = false;
    eaten1 = false;
    eaten2 = false;
    eaten3 = false;
    eaten4 = false;
    eaten5 = false;
    eaten6 = false;
    eatenCount1 = 0;
    eatenCount2 = 0;
    eatenCount3 = 0;
    eatenCount4 = 0;
    eatenCount5 = 0;
    eatenCount6 = 0;

    leader2X = x1;
    leader3X = x2;
    leader4X = x3;
    leader5X = x4;
    leader6X = x5;
    leader2Y = y1;
    leader3Y = y2;
    leader4Y = y3;
    leader5Y = y4;
    leader6Y = y5;
    leaderX = x1;
    leaderY = y1;

    leader2eaten = false;
    leader3eaten = false;
    leader4eaten = false;
    leader5eaten = false;
    leader6eaten = false;

    eatenCountMax = 100;

    predatorX = 200;
    predatorY = 50;
  }

  void drawbirds() {
    if (!eaten1) {
      text("1", x1, y1);
    }
    fill(255, 0, 0);
    //shape(b, x1, y1);
    if (!eaten2) {
      text("2", x2, y2);
    }
    //shape(b, x2, y2);
    if (!eaten3) {
      text("3", x3, y3);
      //shape(b, x3, y3);
    }
    if (!eaten4) {
      text("4", x4, y4);
      //shape(b, x4, y4);
    }
    if (!eaten5) {
      text("5", x5, y5);
      //shape(b, x5, y5);
    }
    if (!eaten6) {
      text("6", x6, y6);
      //shape(b, x6, y6);
    }

    text("P", predatorX, predatorY);
  }

  void movebirds(float predX, float predY) {    
    predatorY = predX;
    predatorX = predY;
    if (leaderX - 100 < predatorX && predatorX < leaderX + 100 && leaderY - 100 < predatorY && predatorY < leaderY +100) {
      if (leaderX > predatorX) {
        backx = false;
      } else {
        backx = true;
      }
      if (leaderY > predatorY) {
        backy = false;
      } else {
        backy = true;
      }
    } 

    if (leaderX == 500) {
      backx = true;
    }
    if (leaderY == 500) {
      backy = true;
    }
    if (leaderX == 0) {
      backx = false;
    }
    if (leaderY == 0) {
      backy = false;
    }
    
    
    if (!backx) {
      leaderX++;
    } else { 
      leaderX--;
    }
    if (!backy) {
      leaderY++;
    } else {
      leaderY--;
    }



    if (!eaten1) {
      movebird1();
    }
    if (!eaten2) {
      movebird2();
    }
    if (!eaten3) {
      movebird3();
    }
    if (!eaten4) {
      movebird4();
    }
    if (!eaten5) {
      movebird5();
    }
    if (!eaten6) {
      movebird6();
    }
  }

  void ifDead(float sx, float sy) {
    int scavengerWidth = 200;
    if (dead1 && x1 + scavengerWidth > sx && sx > x1 - scavengerWidth && y1 + scavengerWidth > sy && sy > y1 - scavengerWidth) {
      eaten1 = true;
    }
    if (dead2 && x2 + scavengerWidth > sx && sx > x2 - scavengerWidth && y2 + scavengerWidth > sy && sy > y2 - scavengerWidth) {
      eaten2 = true;
    } 
    if (dead3 && x3 + scavengerWidth > sx && sx > x3 - scavengerWidth && y3 + scavengerWidth > sy && sy > y3 - scavengerWidth) {
      eaten3 = true;
    } 
    if (dead4 && x4 + scavengerWidth > sx && sx > x4 - scavengerWidth && y4 + scavengerWidth > sy && sy > y4 - scavengerWidth) {
      eaten4 = true;
    } 
    if (dead5 && x5 + scavengerWidth > sx && sx > x5 - scavengerWidth && y5 + scavengerWidth > sy && sy > y5 - scavengerWidth) {
      eaten5 = true;
    } 
    if (dead6 && x6 + scavengerWidth > sx && sx > x6 - scavengerWidth && y6 + scavengerWidth > sy && sy > y6 - scavengerWidth) {
      eaten6 = true;
    }


    if (eaten1) {
      if (eatenCount1 == eatenCountMax) {
        dead1 = false;
        eaten1 = false;
        x1 = 50;
        y1 = 50;
      } else {
        eatenCount1++;
      }
    }


    if (eaten2) {
      if (eatenCount2 == eatenCountMax) {
        dead2 = false;
        eaten2 = false;
        x2 = 50;
        y2 = 50;
      } else {
        eatenCount2++;
      }
    }


    if (eaten3) {
      if (eatenCount3 == eatenCountMax) {
        dead3 = false;
        eaten3 = false;
        x3 = 50;
        y3 = 50;
      } else {
        eatenCount3++;
      }
    }


    if (eaten4) {
      if (eatenCount4 == eatenCountMax) {
        dead4 = false;
        eaten4 = false;
        x4 = 50;
        y4 = 50;
      } else {
        eatenCount4++;
      }
    }


    if (eaten5) {
      if (eatenCount5 == eatenCountMax) {
        dead5 = false;
        eaten5 = false;
        x5 = 50;
        y5 = 50;
      } else {
        eatenCount5++;
      }
    }


    if (eaten6) {
      if (eatenCount6 == eatenCountMax) {
        dead6 = false;
        eaten6 = false;
        x6 = 50;
        y6 = 50;
      } else {
        eatenCount6++;
      }
    }
  }

  void movebird1() {
    if(x1 == predatorX && y1 == predatorY){
      dead1 = true;
    }
    if (!dead1) {
      x1 = leaderX;
      y1 = leaderY;
    } else {
      y1++;
      if (y1 >= height) {
        eaten1 = true;
        x1 = 50;
        y1 = 50;
      }
      return;
    }
  }


  void movebird2() {
    if(x2 == predatorX && y2 == predatorY){
      dead2 = true;
    }
    if (dead2) {
      y2++;
      if (y2 >= height) {
        eaten2 = true;
        x2 = 50;
        y2 = 50;
      }
      return;
    }
    if (!dead1) {
      leader2X = x1;
      leader2Y = y1;
    } else {
      x2 = leaderX;
      y2 = leaderY;
    }
    float distX = x2 - leader2X;
    float distY = y2 - leader2Y;   
    if ((0 <= distX && distX <= 10) && (0 <= distY && distY < 10)) {
      if (distX > distY) {
        x2++;
      } else {
        y2++;
      }
    } else {

      if ((0 <= distX && distX <= 10) && (distY < 0 && distY > -10)) {
        if (Math.abs(distX) > Math.abs(distY)) {
          x2++;
        } else {
          y2++;
        }
      } else {
        if ((distX < 0 && distX > -10) && (distY < 0 && distY > -10)) {
          if (distX < distY) {
            x2++;
          } else {
            y2++;
          }
        } else {
          if ((distX < 0 && distX > -10) && (0 <= distY && distY < 10)) {
            if (Math.abs(distX) < Math.abs(distY)) {
              x2++;
            } else {
              y2++;
            }
          } else {
            if (distX > 10 && distY > 10) {
              x2--;
              y2--;
            } else {
              if (distX > 10 && distY > -10 && distY < 10) {
                x2--;
              } else {
                if (distX > 10 && distY < -10) {
                  x2--;
                  y2++;
                } else {
                  if (distX < 10 && distX > -10 && distY < -10) {
                    y2++;
                  } else { 
                    if (distX < -10 && distY < -10) {
                      x2++;
                      y2++;
                    } else {
                      if (distX < -10 && distY > -10 && distY < 10) {
                        x2++;
                      } else {
                        if (distX < -10 && distY > 10) {
                          x2++;
                          y2--;
                        } else {
                          if (distY > 10 && distX < 10 && distX > -10 ) {
                            y2--;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  void movebird3() {
    if(x3 == predatorX && y3 == predatorY){
      dead3 = true;
    }
    if (dead3) {
      y3++;
      if (y3 >= height) {
        eaten3 = true;
        x3 = 50;
        y3 = 50;
      }
      return;
    }
    if (!dead2) {
      leader3X = x2;
      leader3Y = y2;
    } else {
      if (!dead1) {
        leader3X = x1;
        leader3Y = y1;
      } else {
        x3 = leaderX;
        y3 = leaderY;
      }
    }
    float distX = x3 - leader3X;
    float distY = y3 - leader3Y;
    if ((0 <= distX && distX <= 10) && (0 <= distY && distY < 10)) {
      if (distX > distY) {
        x3++;
      } else {
        y3++;
      }
    } else {

      if ((0 <= distX && distX <= 10) && (distY < 0 && distY > -10)) {
        if (Math.abs(distX) > Math.abs(distY)) {
          x3++;
        } else {
          y3++;
        }
      } else {
        if ((distX < 0 && distX > -10) && (distY < 0 && distY > -10)) {
          if (distX < distY) {
            x3++;
          } else {
            y3++;
          }
        } else {
          if ((distX < 0 && distX > -10) && (0 <= distY && distY < 10)) {
            if (Math.abs(distX) < Math.abs(distY)) {
              x3++;
            } else {
              y3++;
            }
          } else {
            if (distX > 10 && distY > 10) {
              x3--;
              y3--;
            } else {
              if (distX > 10 && distY > -10 && distY < 10) {
                x3--;
              } else {
                if (distX > 10 && distY < -10) {
                  x3--;
                  y3++;
                } else {
                  if (distX < 10 && distX > -10 && distY < -10) {
                    y3++;
                  } else { 
                    if (distX < -10 && distY < -10) {
                      x3++;
                      y3++;
                    } else {
                      if (distX < -10 && distY > -10 && distY < 10) {
                        x3++;
                      } else {
                        if (distX < -10 && distY > 10) {
                          x3++;
                          y3--;
                        } else {
                          if (distY > 10 && distX < 10 && distX > -10 ) {
                            y3--;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  void movebird4() {
    if(x4 == predatorX && y4 == predatorY){
      dead4 = true;
    }
    if (dead4) {
      y4++;
      if (y4 >= height) {
        eaten4 = true;
        x4 = 50;
        y4 = 50;
      }
      return;
    }
    if (!dead3) {
      leader4X = x3;
      leader4Y = y3;
    } else {
      if (!dead2) {
        leader4X = x2;
        leader4Y = y2;
      } else {
        if (!dead1) {
          leader4X = x1;
          leader4Y = y1;
        } else {
          x4 = leaderX;
          y4 = leaderY;
        }
      }
    }
    float distX = x4 - leader4X;
    float distY = y4 - leader4Y;
    if ((0 <= distX && distX <= 10) && (0 <= distY && distY < 10)) {
      if (distX > distY) {
        x4++;
      } else {
        y4++;
      }
    } else {

      if ((0 <= distX && distX <= 10) && (distY < 0 && distY > -10)) {
        if (Math.abs(distX) > Math.abs(distY)) {
          x4++;
        } else {
          y4++;
        }
      } else {
        if ((distX < 0 && distX > -10) && (distY < 0 && distY > -10)) {
          if (distX < distY) {
            x4++;
          } else {
            y4++;
          }
        } else {
          if ((distX < 0 && distX > -10) && (0 <= distY && distY < 10)) {
            if (Math.abs(distX) < Math.abs(distY)) {
              x4++;
            } else {
              y4++;
            }
          } else {
            if (distX > 10 && distY > 10) {
              x4--;
              y4--;
            } else {
              if (distX > 10 && distY > -10 && distY < 10) {
                x4--;
              } else {
                if (distX > 10 && distY < -10) {
                  x4--;
                  y4++;
                } else {
                  if (distX < 10 && distX > -10 && distY < -10) {
                    y4++;
                  } else { 
                    if (distX < -10 && distY < -10) {
                      x4++;
                      y4++;
                    } else {
                      if (distX < -10 && distY > -10 && distY < 10) {
                        x4++;
                      } else {
                        if (distX < -10 && distY > 10) {
                          x4++;
                          y4--;
                        } else {
                          if (distY > 10 && distX < 10 && distX > -10 ) {
                            y4--;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  void movebird5() {
    if(x5 == predatorX && y5 == predatorY){
      dead5 = true;
    }
    if (dead5) {
      y5++;
      if (y5 >= height) {
        eaten5 = true;
        x5 = 50;
        y5 = 50;
      }
      return;
    }
    if (!dead4) {
      leader5X = x4;
      leader5Y = y4;
    } else {
      if (!dead3) {
        leader5X = x3;
        leader5Y = y3;
      } else {
        if (!dead2) {
          leader5X = x2;
          leader5Y = y2;
        } else {
          if (!dead1) {
            leader5X = x1;
            leader5Y = y1;
          }
          x5 = leaderX;
          y5 = leaderY;
        }
      }
    }
    float distX = x5 - leader5X;
    float distY = y5 - leader5Y;   
    if ((0 <= distX && distX <= 10) && (0 <= distY && distY < 10)) {
      if (distX > distY) {
        x5++;
      } else {
        y5++;
      }
    } else {

      if ((0 <= distX && distX <= 10) && (distY < 0 && distY > -10)) {
        if (Math.abs(distX) > Math.abs(distY)) {
          x5++;
        } else {
          y5++;
        }
      } else {
        if ((distX < 0 && distX > -10) && (distY < 0 && distY > -10)) {
          if (distX < distY) {
            x5++;
          } else {
            y5++;
          }
        } else {
          if ((distX < 0 && distX > -10) && (0 <= distY && distY < 10)) {
            if (Math.abs(distX) < Math.abs(distY)) {
              x5++;
            } else {
              y5++;
            }
          } else {
            if (distX > 10 && distY > 10) {
              x5--;
              y5--;
            } else {
              if (distX > 10 && distY > -10 && distY < 10) {
                x5--;
              } else {
                if (distX > 10 && distY < -10) {
                  x5--;
                  y5++;
                } else {
                  if (distX < 10 && distX > -10 && distY < -10) {
                    y5++;
                  } else { 
                    if (distX < -10 && distY < -10) {
                      x5++;
                      y5++;
                    } else {
                      if (distX < -10 && distY > -10 && distY < 10) {
                        x5++;
                      } else {
                        if (distX < -10 && distY > 10) {
                          x5++;
                          y5--;
                        } else {
                          if (distY > 10 && distX < 10 && distX > -10 ) {
                            y5--;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  void movebird6() {
    if(x6 == predatorX && y6 == predatorY){
      dead6 = true;
    }
    if (dead6) {
      y6++;
      if (y6 >= height) {
        eaten6 = true;
        x6 = 50;
        y6 = 50;
      }
      return;
    }
    if (!dead5) {
      leader6X = x5;
      leader6Y = y5;
    } else {
      if (!dead4) {
        leader6X = x4;
        leader6Y = y4;
      } else {
        if (!dead3) {
          leader6X = x3;
          leader6Y = y3;
        } else {
          if (!dead2) {
            leader6X = x2;
            leader6Y = y2;
          } else {
            if (!dead1) {
              leader6X = x1;
              leader6Y = y1;
            } else {
              x6 = leaderX;
              y6 = leaderY;
            }
          }
        }
      }
    }
    float distX = x6 - leader6X;
    float distY = y6 - leader6Y;   
    if ((0 <= distX && distX <= 10) && (0 <= distY && distY < 10)) {
      if (distX > distY) {
        x6++;
      } else {
        y6++;
      }
    } else {

      if ((0 <= distX && distX <= 10) && (distY < 0 && distY > -10)) {
        if (Math.abs(distX) > Math.abs(distY)) {
          x6++;
        } else {
          y6++;
        }
      } else {
        if ((distX < 0 && distX > -10) && (distY < 0 && distY > -10)) {
          if (distX < distY) {
            x6++;
          } else {
            y6++;
          }
        } else {
          if ((distX < 0 && distX > -10) && (0 <= distY && distY < 10)) {
            if (Math.abs(distX) < Math.abs(distY)) {
              x6++;
            } else {
              y6++;
            }
          } else {
            if (distX > 10 && distY > 10) {
              x6--;
              y6--;
            } else {
              if (distX > 10 && distY > -10 && distY < 10) {
                x6--;
              } else {
                if (distX > 10 && distY < -10) {
                  x6--;
                  y6++;
                } else {
                  if (distX < 10 && distX > -10 && distY < -10) {
                    y6++;
                  } else { 
                    if (distX < -10 && distY < -10) {
                      x6++;
                      y6++;
                    } else {
                      if (distX < -10 && distY > -10 && distY < 10) {
                        x6++;
                      } else {
                        if (distX < -10 && distY > 10) {
                          x6++;
                          y6--;
                        } else {
                          if (distY > 10 && distX < 10 && distX > -10 ) {
                            y6--;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }



  float birdX() {
    return x1;
  }

  float birdY() {
    return y1;
  }
  
  float bird2X(){
    return x2;
  }
  
  float bird2Y(){
    return y2;
  }
  
  float bird3X(){
    return x3;
  }
  
  float bird3Y(){
    return y3;
  }
  
  float bird4X(){
    return x4;
  }
  
  float bird4Y(){
    return y4;
  }
  
  float bird5X(){
    return x5;
  }
  
  float bird5Y(){
    return y5;
  }
  
  float bird6X(){
    return x6;
  }
  
  float bird6Y(){
    return y6;
  }
  
  boolean bird1dead(){
    return dead1;
  }
  
  boolean bird2dead(){
    return dead2;
  }
  
  boolean bird3dead(){
    return dead3;
  }
  
  boolean bird4dead(){
    return dead4;
  }
  
  boolean bird5dead(){
    return dead5;
  }
  
  boolean bird6dead(){
    return dead6;
  }
}