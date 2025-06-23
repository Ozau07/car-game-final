void pause() {
  image(gif[f], 0, 0, width, height);
  f++;
  if (f == numberofframes) {
    f = 0;
  }
  textSize(50);
  fill(255);
  textSize(30);
  text("Click To Continue", width/2, 600);
  textSize(100);
  text("Paused", width/2, 300);
}
