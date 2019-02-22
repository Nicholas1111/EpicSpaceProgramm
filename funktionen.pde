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
  if (MouseInfo.getPointerInfo().getLocation().x < displayWidth / 6) {    
    shuttleX = 0 - 50;
  } else if (MouseInfo.getPointerInfo().getLocation().x > displayWidth / 6 * 5) {
    shuttleX = (displayWidth / 6 * 4) - 50;
  } else {


    shuttleX = MouseInfo.getPointerInfo().getLocation().x - (displayWidth / 6) - 50;
  }

  if (MouseInfo.getPointerInfo().getLocation().y < (displayHeight / 6) + 25) {
    shuttleY = 0 - 25;
  } else if (MouseInfo.getPointerInfo().getLocation().y > (displayHeight / 6 * 5) + 25) {
    shuttleY = (displayHeight / 6 * 4) - 25;
  } else {
    shuttleY = MouseInfo.getPointerInfo().getLocation().y - ((displayHeight / 6)) - 50;
  }

  image(shuttle, shuttleX, shuttleY - 25, shuttleSize, shuttleSize);
}

// ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \\
// ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \\

void drawScore() {
  score = millis();
  textAlign(RIGHT);
  fill(255);
  textSize(displayHeight/20);
  text(score, displayWidth/6*4, displayHeight/20);
}

// ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \\
// ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \\

void drawLevel() {
  lvlTimer += 1;
  if (lvlTimer > 1000) {
    lvl += 1;
    lvlTimer = 0;
  }
  textAlign(LEFT);
  fill(255);
  textSize(displayHeight/20);
  text("Level: " + lvl, 0, displayHeight/20);
}

// ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \\
// ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \\

void drawMeteors() {

  int meteorCounter = 0;
  MAXmeteors = lvl + 3;

  //  Hier werden die Sterne bewegt.
  while (meteorCounter < MAXmeteors) {
    image(meteor, meteorX[meteorCounter] - (meteorSize[meteorCounter]/2), meteorY[meteorCounter] - (meteorSize[meteorCounter]/2), meteorSize[meteorCounter], meteorSize[meteorCounter]); 

    meteorX[meteorCounter] = meteorX[meteorCounter] - (meteorS[meteorCounter] + (lvl / 3));

    if (isColliding(shuttleSize, mouseX, mouseY, meteorSize[meteorCounter], meteorX[meteorCounter], meteorY[meteorCounter])) {
      health -=1;
      meteorS[meteorCounter] = random(1, 5);
      meteorX[meteorCounter] = width;
      meteorY[meteorCounter] = random(0, height);
      meteorSize[meteorCounter] = random(20, 50);
    }

    if (meteorX[meteorCounter] < 0) {
      meteorS[meteorCounter] = random(1, 5);
      meteorX[meteorCounter] = width;
      meteorY[meteorCounter] = random(0, height);
      meteorSize[meteorCounter] = random(20, 50);
    }
    meteorCounter += 1;
  }
}

// ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \\
// ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \\

void drawEndscreen() {
  noLoop();
  background(0);
  textAlign(CENTER);
  textSize(width / 10);
  fill(150, 0, 0);
  text("Game Over", width /2, height /2);

  fill(255);
  textSize(width/20);
  text("Dein Score: " + score, width /2, height /2 + 100);

  text("Dein Level: " + lvl, width /2, height /2 + 200);
}

// ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \\
// ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \\

void drawHealthBar() {
  strokeWeight(30);
  stroke(100);
  fill(100);
  line(300, 35, 1050, 35); 

  strokeWeight(20);
  stroke(255, 0, 0);
  fill(255, 0, 0);
  line(300, 35, 300 + health*75, 35);
}

void drawMaxHealth() {
  if (health > 10) {
    health = 10;
  }
  if (health < 1) {
    drawEndscreen();
    health = 0;
  }
}

// ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \\
// ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \\

//void timerHealpack() { //<>//
//  packTimer += random(1, 3);

//  if (packTimer > 1) {
//    drawPack();
//    packTimer = 0;
//  }
//}

//void drawPack() {
//  packX = width;
//  packY = random(0, height);
//  packSize = 100;
//  packS = 3;
  
//  while (packX > 0) {
//    image(healpack, packX, packY, packSize, packSize); 
//    packX = packX - packS;
//    if (isColliding(shuttleSize, mouseX, mouseY, packSize, packX, packY)) {
//      health +=2;
//    }
//  }
//}
