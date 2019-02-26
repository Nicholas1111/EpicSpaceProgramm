
void draw() {
  if (inGame == true) {
    highscoreSaved = false;
    background(0);
    stroke(255);
    drawStars();
    drawPlanets();
    drawBullet();
    drawShuttle();
    drawMeteors();
    drawHealthBar();
    drawScore();
    drawLevel();
    drawPack();
    drawMaxHealth();
  }
  if (inGame == false) {
    saveHighscore();
    drawEndscreen();
  }
}
