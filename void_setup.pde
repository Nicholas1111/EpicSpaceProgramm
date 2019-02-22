void setup() {
  //fullScreen();
  background(0);
  textSize(100);
  fill(255);
  stroke(255);
  frameRate(50);

  shuttle = loadImage("shuttle.png");
  meteor = loadImage("meteor.png");
  healpack = loadImage("healpack.png");
  bullet = loadImage("bullet.png");

  int starCounter = 0;

  while (starCounter < MAXstars) {
    starX[starCounter] = random(0, width);
    starY[starCounter] = random(0, height);
    starS[starCounter] = random(0.1, 0.5);
    starSize[starCounter] = random(1.0, 3.0);
    starCounter += 1;
  }

  int planetCounter = 0;

  while (planetCounter < MAXplanets) {
    planetC[planetCounter] = (int)random(30, 80);
    planetX[planetCounter] = random(0, width);
    planetY[planetCounter] = random(0, height);
    planetS[planetCounter] = random(0.5, 2.0);
    planetSize[planetCounter] = random(300, 500);
    planetCounter += 1;
  }

  int meteorCounter = 0;

  while (meteorCounter < MAXmeteors) {
    meteorX[meteorCounter] = width;
    meteorY[meteorCounter] = random(0, height);
    meteorS[meteorCounter] = random(1, 5);
    meteorSize[meteorCounter] = random(30, 100);
    meteorCounter += 1;
  }

  packX = width;
  packY = random(0, height);
  packSize = 100;
  packS = 3;

  bulletX = mouseX;
  bulletY = mouseY;
  bulletS = 5;
  bulletSize = 50;
}
