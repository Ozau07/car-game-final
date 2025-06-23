void gameover() {
  image(gif[f], 0, 0, width, height);
  f++;
  if (f == numberofframes) {
    f = 0;
  }
  textSize(50);
  fill(255);
  textSize(30);
  text("Click To Play Again", width/2, 600);
  textSize(100);
  text(winner + " Won", width/2, 300);
}
