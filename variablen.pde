// ===== Screen ===== \\

// ===== ===== ===== ===== \\


// ===== Stars ===== \\

int MAXstars = 200;
float starX[] = new float[MAXstars];
float starY[] = new float[MAXstars];
float starS[] = new float[MAXstars];
float starSize[] = new float[MAXstars];

// ===== ===== ===== ===== \\


// ===== Planets ===== \\

int MAXplanets = 4;
float planetX[] = new float[MAXplanets];
float planetY[] = new float[MAXplanets];
float planetS[] = new float[MAXplanets];
float planetSize[] = new float[MAXplanets];
int planetC[] = new int[MAXplanets];

// ===== ===== ===== ===== \\


// ===== SpaceShuttle ===== 

float shuttleX;
float shuttleY;
float shuttleSize = 100;
PImage shuttle;

// ===== ===== ===== ===== \\


// ===== Meteors ===== \\

int MAXmeteors = 10;
float meteorX[] = new float[MAXmeteors];
float meteorY[] = new float[MAXmeteors];
float meteorS[] = new float[MAXmeteors];
float meteorSize[] = new float[MAXmeteors];
PImage meteor;

// ===== ===== ===== ===== \\


// ===== Level - Score - Health ===== \\

int score;
int lvl = 1;
int lvlTimer;
int health = 10;

// ===== ===== ===== ===== \\


// =====  is Projectile colliding with Object? ===== \\

boolean isColliding(float objectSize, float objectPosX, float objectPosY, float projectileSize, float projectilePosX, float projectilePosY) {
  boolean returnValue = false;   

    //  
  if ( projectilePosX - projectileSize/2 < objectPosX + objectSize/2) {
    if ( projectilePosX + projectileSize/2 > objectPosX - objectSize/2) {
      if ( projectilePosY + projectileSize/2 > objectPosY - objectSize/2) {
        if ( projectilePosY - projectileSize/2 < objectPosY + objectSize/2) {
          returnValue = true;
        }
      }
    }
  }
  return returnValue;
}
