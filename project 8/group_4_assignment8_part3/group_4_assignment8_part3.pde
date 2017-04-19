XML xml; //<>// //<>//
XML[] children;
String[] titles;
String[] descriptions;
String[] links;
String[] timePublished;
hover[] linkArea;
int linkCount;
button up;
button down;
button page1;
button page2;
button page3;
button page4;
button page5;
int overAllY;
int greatestY;
boolean page1Dis = true;
boolean page2Dis = false;
boolean page3Dis = false;
boolean page4Dis = false;
boolean page5Dis = false;

void setup() {
  size(1000, 500);
  background(255);
  overAllY = 0;
  if (page1Dis) {
    xml = loadXML("http://feeds.bbci.co.uk/news/video_and_audio/science_and_environment/rss.xml");
  } else {
    if (page2Dis) {
      xml = loadXML("http://feeds.bbci.co.uk/news/video_and_audio/technology/rss.xml");
    } else {
      if (page3Dis) {
        xml = loadXML("http://feeds.bbci.co.uk/news/video_and_audio/entertainment_and_arts/rss.xml");
      } else {
        if (page4Dis) {
          xml = loadXML("http://feeds.bbci.co.uk/news/business/rss.xml?edition=uk");
        } else {
          if (page5Dis) {
            xml = loadXML("http://feeds.bbci.co.uk/news/politics/rss.xml?edition=uk");
          }
        }
      }
    }
  }
  children = xml.getChildren("channel");
  children = children[0].getChildren();
  titles = new String[children.length];
  descriptions = new String[children.length];
  links = new String[children.length];
  timePublished = new String[children.length];  
  XML[] info = new XML[20];
  for (int i = 19; i < children.length; i += 2) {
    info = children[i].getChildren();
    titles[i] = info[1].getContent();
    descriptions[i] = info[3].getContent();
    links[i] = info[5].getContent();
    timePublished[i] = info[9].getContent();
  }
  down = new button(950, 450, 20, color(229, 161, 32));
  up = new button(950, 475, 20, color(229, 161, 32));
  page1 = new button(950, 50, 20, color(255, 255, 0));
  page2 = new button(950, 75, 20, color(255, 0, 0));
  page3 = new button(950, 100, 20, color(255));
  page4 = new button(950, 125, 20, color(0, 255, 255));
  page5 = new button(950, 150, 20, color(255, 0, 255));
  linkArea = new hover[300];
  linkCount = 0;
  greatestY = 0;
}

void draw() {
  background(0);
  up.display("up");
  down.display("down");
  page1.display("Page 1");
  page2.display("Page 2");
  page3.display("Page 3");
  page4.display("Page 4");
  page5.display("Page 5");
  if (page1Dis) {
    fill(255, 255, 0);
  } else {
    if (page2Dis) {
      fill(255, 0, 0);
    } else {
      if (page3Dis) {
        fill(255);
      } else {
        if (page4Dis) {
          fill(0, 255, 255);
        } else {
          if (page5Dis) {
            fill(255, 0, 255);
          }
        }
      }
    }
  }
  text(children[1].getContent(), 0, 15);
  text(children[11].getContent(), textWidth(children[1].getContent()) + 10, 15);
  for (int i = 0; i < titles.length; i++) {
    if (titles[i] != null && i >= 19) {
      int y = 45 + (20 * (i - 19 )) + overAllY;
      float len = textWidth(titles[i]);
      if ((mouseX <= len && mouseX >= 0 - len) && (mouseY <= y + 16 && mouseY >= y - 16)) {
        fill(0, 250, 0);
        String[] words = split(descriptions[i], ' ');
        int wordX = 500;
        int wordY = 10;
        for (int j = 0; j < words.length; j++) {
          text(words[j], wordX, wordY);
          wordX += textWidth(words[j]);
          if (j != words.length - 1) {
            float test = textWidth(words[j + 1]);
            if (wordX + test >= 1000) {
              wordX = 500;
              wordY += 20;
            }
          }
        }
        //text(descriptios[i], 500, 10);
      } else {
        if (page1Dis) {
          fill(255, 255, 0);
        } else {
          if (page2Dis) {
            fill(255, 0, 0);
          } else {
            if (page3Dis) {
              fill(255);
            } else {
              if (page4Dis) {
                fill(0, 255, 255);
              } else {
                if (page5Dis) {
                  fill(255, 0, 255);
                }
              }
            }
          }
        }
      }
      text(titles[i], 0, y);
      //if (linkCount == 0) {      
      linkArea[i] = new hover(0, y - 16, len, 16);
      if (y > greatestY) {
        greatestY = y;
      }
      //}
    }
  }
  //linkCount++;
}

void mousePressed() {
  if (down.inArea(mouseX, mouseY) && overAllY < 0) {
    overAllY += 16;
  } else {
    if (up.inArea(mouseX, mouseY) && greatestY >= overAllY) {
      overAllY -= 16;
    } else {
      if (page1.inArea(mouseX, mouseY)) {
        page1Dis = true;
        page2Dis = false;
        page3Dis = false;
        setup();
      } else {
        if (page2.inArea(mouseX, mouseY)) {
          page1Dis = false;
          page2Dis = true;
          page3Dis = false;
          setup();
        } else {
          if (page3.inArea(mouseX, mouseY)) {
            page1Dis = false;
            page2Dis = false;
            page3Dis = true;
            setup();
          } else {
            if (page4.inArea(mouseX, mouseY)) {
              page1Dis = false;
              page2Dis = false;
              page3Dis = false;
              page4Dis = true;
              setup();
            } else {
              if (page5.inArea(mouseX, mouseY)) {
                page1Dis = false;
                page2Dis = false;
                page3Dis = false;
                page4Dis = false;
                page5Dis = true;
                setup();
              }
            }
          }
        }
      }
    }
  }

  for (int i = 0; i < linkArea.length; i++) {
    if (linkArea[i] != null && i >= 19) {
      if (linkArea[i].inArea(mouseX, mouseY)) {
        link(links[i]);
        break;
      }
    }
  }
}