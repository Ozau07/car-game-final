void intro() {
  image(gif[f], 0, 0, width, height);
  f++;
  if (f == numberofframes) {
    f = 0;
  }
  textSize(50);

  text("Click Anywhere To Start", width/2, 600);
}
