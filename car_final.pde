float car1X, car1Y;
float car1Angle = 0;
float car1Speed = 0;
int car1Laps = 0;
boolean car1CrossedLine = false;
int mode;
final int INTRO =1;
final int GAME =2;
final int GAMEOVER=3;
final int PAUSE=4;
final int COUNTDOWN=5;
int tempx, tempy;
float car2X, car2Y;
float car2Angle = 0;
float car2Speed = 0;
int car2Laps = 0;
boolean car2CrossedLine = false;
PImage[] gif;
int numberofframes;
boolean w, s, a, d;
boolean up, down, left, right;
int f;
int n;
int[] x;
int[] y;
boolean gameOver = false;
String winner = "";
int count;


boolean clickedOnRect(int x, int y, int w, int h) {
  return (mouseX>=x&&mouseX<=x+w&&mouseY>=y&&mouseY<=y+h);
}


void setup() {
    textAlign(CENTER, CENTER);
  size(800, 800, P2D);
  tempx= tempy =100;
  mode =INTRO;
  car1X = width / 2 - 50;
  car1Y = height / 2 - 220;
  car2X = width / 2 - 80;
  car2Y = height / 2 - 180;
  mode=INTRO;
  f = 0;

  numberofframes = 23;
  gif = new PImage[numberofframes];

  for (int i = 0; i < numberofframes; i++) {
    gif[i] = loadImage("pic(" + i + ").gif");
  }
}

void resetGame() {
  car1X = width / 2 - 50;
  car1Y = height / 2 - 220;
  car2X = width / 2 - 80;
  car2Y = height / 2 - 180;
  car1Angle = 0;
  car2Angle = 0;
  car1Speed = 0;
  car2Speed = 0;
  car1Laps = 0;
  car2Laps = 0;
  car1CrossedLine = false;
  car2CrossedLine = false;
  winner = "";
  
  count = 420;
}

void draw() {
  if (mode==INTRO) {
    intro();
  } else if (mode==COUNTDOWN) {
    countdown();
  } else if (mode==GAME) {
    car();
  } else if (mode==PAUSE){
    pause();
  } else if (mode==GAMEOVER) {
    gameover();
  } else {
    println("Mode error:" + mode);
  }
}

void carDrawFunction(float x, float y, color c) {
  fill(c);
  rect(x, y, 120, 60, 15);

  fill(100, 149, 237);
  rect(x, y, 70, 40, 10);

  fill(173, 216, 230);
  rect(x, y - 14, 60, 12, 5);
  rect(x, y + 14, 60, 12, 5);

  fill(0);
  ellipse(x - 55, y - 20, 15, 15);
  ellipse(x - 55, y + 20, 15, 15);
  ellipse(x + 55, y - 20, 15, 15);
  ellipse(x + 55, y + 20, 15, 15);

  fill(0);
  ellipse(x - 60, y - 25, 5, 10);
  ellipse(x + 60, y - 25, 5, 10);
}
