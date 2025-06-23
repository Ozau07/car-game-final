void car() {
  background(#567D46);

  mode=GAME;
  fill(#8B0000);
  ellipse(width/2, height/2, 510, 510);
  fill(100);
  ellipse(width/2, height/2, 500, 500);
  fill(#8B0000);

  ellipse(width/2, height/2, 300, 300);

  fill(#567D46);
  ellipse(width/2, height/2, 290, 290);


  stroke(255);
  strokeWeight(4);
  line(width/2, height/2-150, width/2, height/2 -250);
  noStroke();

  if (!gameOver) {

    if (w) car1Speed += 0.1;
    if (s) car1Speed -= 0.1;
    car1Speed *= 0.98;
    if (a) car1Angle -= 3;
    if (d) car1Angle += 3;
    car1X += cos(radians(car1Angle)) * car1Speed;
    car1Y += sin(radians(car1Angle)) * car1Speed;
    float dist1 = dist(car1X, car1Y, width/2, height/2);
    if (dist1 > 250 || dist1 < 150) car1Speed = 0;


    if (up) car2Speed += 0.1;
    if (down) car2Speed -= 0.1;
    car2Speed *= 0.98;
    if (left) car2Angle -= 3;
    if (right) car2Angle += 3;
    car2X += cos(radians(car2Angle)) * car2Speed;
    car2Y += sin(radians(car2Angle)) * car2Speed;
    float dist2 = dist(car2X, car2Y, width/2, height/2);
    if (dist2 > 250 || dist2 < 150) car2Speed = 0;



    if (car1X > width/2 -5  && car1X < width/2 +100) { // Near the white line X position
      if (car1Y <= height/2 +100 && !car1CrossedLine) {
        car1Laps++;
        car1CrossedLine = true;
      } else if (car1Y > height/2 ) {

        car1CrossedLine = false;
      }
    }

    // For Car 2:
    if (car2X > width/2 - 5 && car2X < width/2 + 100) {
      if (car2Y <= height/2 +100 && !car2CrossedLine) {
        car2Laps++;
        car2CrossedLine = true;
      } else if (car2Y > height/2 ) {
        car2CrossedLine = false;
      }
    }


    if (car1Laps > 3) {
      winner = "Red Car";
      mode = GAMEOVER;
    } else if (car2Laps > 3) {
      winner = "Blue Car";
      mode = GAMEOVER;
    }
  }


  float collisionDist = dist(car1X, car1Y, car2X, car2Y);
  if (collisionDist < 25) {
    float angleBetween = atan2(car2Y - car1Y, car2X - car1X);
    car1Speed = -0.5;
    car2Speed = -0.5;
    car1X += cos(angleBetween + PI) * 5;
    car1Y += sin(angleBetween + PI) * 5;
    car2X += cos(angleBetween) * 5;
    car2Y += sin(angleBetween) * 5;
  }



  drawCar(car1X, car1Y, car1Angle, color(255, 0, 0));
  drawCar(car2X, car2Y, car2Angle, color(0, 0, 255));


  fill(255);
  textSize(20);
  text("Car 1 Laps: " + car1Laps, 60, 30);
  text("Car 2 Laps: " + car2Laps, 60, 60);

  if (gameOver) {
    textSize(32);
    text(winner, width/2 - 100, height/2);
  }

  pushMatrix();
  translate(width-75, 75);
  if (dist(mouseX, mouseY, width-75, 75) < 30) {
    fill(255);
    circle(0, 0, 60);
  } else {
    fill(100);
    circle(0, 0, 60);
  }
  fill(0);
  rect(-10, 0, 10, 30);
  rect(10, 0, 10, 30);
  popMatrix();
}


void drawCar(float x, float y, float angle, color c) {
  pushMatrix();
  translate(x, y);
  rotate(radians(angle));
  fill(c);
  rectMode(CENTER);
  scale(0.4);
  carDrawFunction(0, 0, c);
  popMatrix();
}

void keyPressed() {
  if (key == 'w' || key == 'W') w = true;
  if (key == 's' || key == 'S') s = true;
  if (key == 'a' || key == 'A') a = true;
  if (key == 'd' || key == 'D') d = true;

  if (keyCode == UP) up = true;
  if (keyCode == DOWN) down = true;
  if (keyCode == LEFT) left = true;
  if (keyCode == RIGHT) right = true;
}

void keyReleased() {
  if (key == 'w' || key == 'W') w = false;
  if (key == 's' || key == 'S') s = false;
  if (key == 'a' || key == 'A') a = false;
  if (key == 'd' || key == 'D') d = false;

  if (keyCode == UP) up = false;
  if (keyCode == DOWN) down = false;
  if (keyCode == LEFT) left = false;
  if (keyCode == RIGHT) right = false;
}

void mousePressed() {
  if (mode == INTRO) {
    resetGame();
    mode=COUNTDOWN;
  } else if (mode == GAME) {
    if (dist(mouseX, mouseY, width-75, 75) < 30) {
      mode=PAUSE;
    }
  } else if (mode == PAUSE) {
    mode = GAME;
  } else if (mode == GAMEOVER) {
    mode=INTRO;
  }
}
