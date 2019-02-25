 //<>//
// ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \\
// ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \\

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
  score += 1;
  textAlign(RIGHT);
  fill(255);
  textSize(displayHeight/20);
  text(score, displayWidth/6*4, displayHeight/20);
}

// ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \\
// ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \\

void drawLevel() {
  lvlTimer += 1;
  if (lvlTimer > 250) {
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

    if (isColliding(meteorSize[meteorCounter], meteorX[meteorCounter], meteorY[meteorCounter], bulletSize, bulletX, bulletY)) {
      meteorS[meteorCounter] = random(1, 5);
      meteorX[meteorCounter] = width;
      meteorY[meteorCounter] = random(0, height);
      meteorSize[meteorCounter] = random(30, 100);

      bulletInAir = false;
      bulletX = -100;
      bulletY = -100;
    }


    if (isColliding(shuttleSize, mouseX, mouseY, meteorSize[meteorCounter], meteorX[meteorCounter], meteorY[meteorCounter])) {
      health -=1;
      meteorS[meteorCounter] = random(1, 5);
      meteorX[meteorCounter] = width;
      meteorY[meteorCounter] = random(0, height);
      meteorSize[meteorCounter] = random(30, 100);
    }

    if (meteorX[meteorCounter] < 0) {
      meteorS[meteorCounter] = random(1, 5);
      meteorX[meteorCounter] = width;
      meteorY[meteorCounter] = random(0, height);
      meteorSize[meteorCounter] = random(30, 100);
    }
    meteorCounter += 1;
  }
}

// ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \\
// ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \\

void drawEndscreen() {
  if (keyPressed) {
    if (key == ' ') {
      drawHighscoreScreen();
    }
    if (key == ENTER) {
      inGame = true;
      health = 10;
      score = 0;
      lvl = 0;
      packTimer = 0;
      lvlTimer = 0;
    }
  } else {
    background(0);
    textAlign(CENTER);
    textSize(width / 10);
    fill(150, 0, 0);
    text("Game Over", width /2, height /2);

    fill(255);
    textSize(width/20);
    text("Dein Score: " + score, width /2, height /2 + 100);

    text("Dein Level: " + lvl, width /2, height /2 + 200);

    textSize(width/30);
    fill(100);
    text("Drücke die Leertaste, um die Highscores zu sehen.", width/2, height/2 + 300);
    text("Drücke Enter, um ein weiteres Spiel zu starten.", width/2, height/2 + 350);
  }
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

// ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \\
// ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \\

void drawMaxHealth() {
  if (health > 10) {
    health = 10;
  }
  if (health < 1) {
    health = 0;
    inGame = false;
    Nickname();
  }
}

// ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \\
// ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \\

void drawPack() {
  packTimer += random(1, 3);

  if (packTimer > 1000) {
    image(healpack, packX - (packSize/2), packY - (packSize/2), packSize, packSize);
    packX -= packS;
    if (isColliding(shuttleSize, mouseX, mouseY, packSize, packX, packY)) {
      health += 2;
      packTimer = 0;
      packX = width;
      packY = random(0, height);
      packSize = 100;
      packS = 3;
    }

    if (packX < 0) {
      packTimer = 0;
      packX = width;
      packY = random(0, height);
      packSize = 100;
      packS = 3;
    }
  }
}

// ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \\
// ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \\

void drawBullet() {

  if (mousePressed == true && bulletInAir == false) {
    bulletInAir = true;
    bulletX = mouseX;
    bulletY = mouseY;
  }
  if (bulletInAir == true) {
    if (bulletX < width) {
      image(bullet, bulletX - bulletSize/2, bulletY - bulletSize/2, bulletSize, bulletSize);
      bulletX += bulletS;
    } else {
      bulletInAir = false;
    }
  }
}

// ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \\
// ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \\

void Nickname() {

  final String id = showInputDialog("Bitte lege einen Namen fest.");

  if (id == null)   exit();

  else if ("".equals(id)) {
    showMessageDialog(null, "Bitte etwas eingeben!", 
      "Alert", ERROR_MESSAGE);
    Nickname();
  } else if (ids.hasValue(id)) {
    showMessageDialog(null, "ID \"" + id + "\" Dieser Name ist schon vergeben!", 
      "Alert", ERROR_MESSAGE);
    Nickname();
  } else {
    showMessageDialog(null, "Dein Name: " + id + " wurde mit dem Score: " + score + " zur Liste hinzugefügt.", 
      "Info", INFORMATION_MESSAGE);

    ids.append(id);
  }
  Player newplayer = new Player();
  newplayer.Name = id;
  newplayer.Score = score;
  highscore.add(newplayer);
}

// ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \\
// ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \\

void drawHighscoreScreen() {
  background(0);
  textSize(width/20);
  textAlign(CENTER);
  fill(255);

  Collections.sort(highscore);

  if (highscore.size() > 0) {
    text("1. " + highscore.get(0).print(), width/2, 150);
  }

  if (highscore.size() > 1) {
    text("2. " + highscore.get(1).print(), width/2, 250);
  }

  if (highscore.size() > 2) {
    text("3. " + highscore.get(2).print(), width/2, 350);
  }

  if (highscore.size() > 3) {
    text("4. " + highscore.get(3).print(), width/2, 450);
  }

  if (highscore.size() > 4) {
    text("5. " + highscore.get(4).print(), width/2, 550);
  }

  fill(100);
  textSize(width/30);
  text("Lasse Leertaste los, dein Spielergebnis zu sehen.", width/2, height/2 + 300);
  text("Drücke Enter, um ein weiteres Spiel zu starten.", width/2, height/2 + 350);
}
