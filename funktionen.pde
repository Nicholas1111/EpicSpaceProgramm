void drawStars() {

  int starCounter = 0;

  //  Hier werden die Sterne bewegt.
  while (starCounter < MAXstars) {
    stroke(255);
    strokeWeight(starSize[starCounter]);
    point(starX[starCounter], starY[starCounter]); 

    starX[starCounter] = starX[starCounter] - starS[starCounter];

    //  Hier werden die Sterne, wenn sie links ankommen, wieder nach rechts gesetzt.
    if (starX[starCounter] < 0) {
      starX[starCounter] = width;
    }
    starCounter += 1;
  }
}

// ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \\
// ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \\

void drawPlanets() {

  int planetCounter= 0;
  while (planetCounter < MAXplanets) {
    stroke(planetC[planetCounter]);
    strokeWeight(planetSize[planetCounter]);
    point(planetX[planetCounter], planetY[planetCounter]);

    planetX[planetCounter] = planetX[planetCounter] - planetS[planetCounter];
    if (planetX[planetCounter] < -200) {
      planetX[planetCounter] = width + 200;
      planetY[planetCounter] = random(-200, height);
      planetSize[planetCounter] = random(300, 500);
      planetS[planetCounter] = random(0.5, 2.0);
      planetC[planetCounter] = (int)random(30, 80);
    }
    planetCounter += 1;
  }
}

// ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \\
// ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \\

void drawShuttle() {
  
  shuttleX = MouseInfo.getPointerInfo().getLocation().x - shuttle.width/2;
  shuttleY = MouseInfo.getPointerInfo().getLocation().y - 50;
  image(shuttle, shuttleX, shuttleY, 100, 100);
}

// ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \\
// ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \\

void positioningShuttle() {
  
}
