//  Hier wird die variable für den Sccore definiert
int Score;

float[] meteorX = new float[100];
float[] meteorY = new float[100];
float[] meteorSpeed = new float[100];
float[] mU = new float[100];
float[] mC = new float[100];

//  Hier werden Variablen für die Position (x,y) und Geschwindigkeit der Sterne definiert.
float[] starX = new float[100];                  
float[] starY = new float[100];                  
float[] starSpeed = new float[100];  

int lvltimer = 0;

//  Hier werden die Level definiert.
int lvl = 1;

//  Hier wird die Variable für die Y-Position definiert, und die Leben festgelegt.
float shipY;
float health = 100;

//  Hier werden die Bild-Namen für Meteor und Raumschiff definiert.
PImage SpaceShip;
PImage Meteor;
PImage HPImg;

//  Healpack
float HPY;
float HPX = width;
float HPHitbox;
float HPSpawn = 0;

// Hier wird die Hitbox des Raumschiffs definiert.
float sU;


boolean isColliding(float xPos, float uPos) {
  boolean returnValue = false;   
  if (xPos < 140) {
    if (uPos < shipY) {
      if (uPos > shipY + 110) {
        returnValue = true;
      }
    }
  }

  if (xPos < 140) {
    if (uPos < shipY + 110) {
      if (uPos > shipY) {
        returnValue = true;
      }
    }
  }

  return returnValue;
}


// Hier werden Größe, Framerate, Farbe und Stern-Größe festgelegt.
void setup() {
  size(1100, 800);
  frameRate(200);
  background(0);
  stroke(255);
  strokeWeight(4);

  //  Hier werden Position und Hitbox des Raumschiffes festgelegt.
  shipY = 400; 
  sU = shipY + 100;

  //  Hier wird eine Variable für die Anzahl der Sterne festgelegt.
  int i = 0;

  //  Hier wird die Position und Bewegung der Sterne festgelegt.
  while (i < 100) {
    starX[i] = random(0, width);
    starY[i] = random(0, height);
    starSpeed[i] = random(1, 4);
    i += 1;
  }

  //  Hier wird eine Variable für die Anzahl der Meteoriten festgelegt.
  int l = 0;

  //  Hier wird die Position und Bewegung der Meteoriten festgelegt.
  while (l < 10) {
    createMeteor(l);
    l +=1;
  }

  //  Hier werden die Bild-Datein für Meteor und Raumschiff festgelegt.
  SpaceShip = loadImage("SpaceShip.png");
  Meteor = loadImage("Meteor.png");
  HPImg = loadImage("Healpack.png");
}

void createMeteor(int number) {
  meteorX[number] = random(0, width);
  meteorY[number] = random(0, height);
  meteorSpeed[number] = random(1, 2);
  mU[number] = meteorY[number] + 40;
  mC[number] = meteorX[number] + 40;
}

//  Hier wird getestet, ob die Taste UP gedrückt wird, um das Schiff hoch zu bewegen,
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      if (shipY > 0) {
        shipY -= 10;
      }
    }

    //  Hier wird getestet, ob die Taste DOWN gedrückt wird, um das Schiff runter zu bewegen,
    if (keyCode == DOWN) {
      if (shipY < 700) {
        shipY += 10;
      }
    }
  }
  sU = shipY + 100;
}

void draw() {

  //  Hier wird getestet, wie viel Leben der Spieler hat.
  if (health > 1) {

    //  Hier wird die Farbe für den Hintergrund und die Sterne fetsgelegt.
    background(0);
    stroke(255);
    fill(255);

    if (health > 100) {
      health = 100;
    }

    //  Hier wird die Variable für die Anzahl der Sterne festgelegt.
    int i = 0;

    //  Hier werden die Sterne bewegt.
    while (i < 100) {
      strokeWeight(4);
      point(starX[i], starY[i]);  
      starX[i] = starX[i] - starSpeed[i];

      //  Hier werden die Sterne, wenn sie links ankommen, wieder nach rechts gesetzt.
      if (starX[i] < 0) {
        starX[i] = width;
      }
      i += 1;
    }

    //  Hier wird das Raumschiff platziert.
    image(SpaceShip, 40, shipY, 120, 75);

    //  Hier wird eine Variable für die Anzahl festgelegt
    int l = 0;
    int maxMeteors = lvl + 3;

    //level hochzählen
    createMeteor(maxMeteors);

    //  Hier wird die Textur für den Meteoriten festgelegt.
    while (l < maxMeteors) {
      image(Meteor, meteorX[l], meteorY[l], 40, 40);

      if (isColliding(meteorX[l], mU[l])) {
        health -= 10;
        meteorX[l] = width;
      }

      //  Hier wird der Meteorit bewegt, und getestet ob er links ankommt, um ihn wieder nach rechts zu setzen.
      meteorX[l] = meteorX[l] - meteorSpeed[l];
      if (meteorX[l] < 0) {
        meteorX[l] = width;
        meteorY[l] = random(0, height);
        mU[l] = meteorY[l] + 40;
        mC[l] = meteorX[l] + 40;
      }

      l += 1;
    }


    HPSpawn += 1;
    if (HPSpawn > 2000) {
      HPHitbox = HPY + 30;
      image(HPImg, HPX, HPY, 50, 50);

      if (isColliding(HPX, HPHitbox)) {  
        health += 20;
        HPX = width;
        HPSpawn = 0;
      } else {
        HPX -= 1;
      }
      if (HPX <0 ) {
        HPSpawn = 0;
        HPX = width;
        HPY = random(0, height);
      }
    }


    // Hier wird die Lebensanzeige erstellt.  
    strokeWeight(30);
    stroke(255);
    fill(200);
    line(50, 750, 1050, 750);

    strokeWeight(30);
    stroke(200, 0, 0);
    fill(200, 0, 0);
    line(50, 750, health * 10 + 50, 750);

    //  Hier wird der Score gezählt.
    Score = millis();
    textAlign(RIGHT);
    fill(255);
    textSize(30);
    text(Score, 1100, 50);

    lvltimer += 1;
    if (lvltimer > 2000) {
      lvl += 1;
      lvltimer = 0;
    }



    //  Hier wird der GameOver-Screen erstellt.
  } else {
    textAlign(LEFT);
    //  Git Änderung
    fill(100, 0, 0);
    background(0);
    textSize(150);
    text("Game Over", 100, 350); 
    fill(200);
    textSize(50);
    text("Deine Punktzahl ist: " + Score, 100, 500);
  }
}
