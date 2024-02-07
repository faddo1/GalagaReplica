/*************
 **  PA3_Galaga_fAddo.pde 
 **  Freeman Addo 
 **  10/18/2023
 **  faddo1@umbc.edu
 **  Description: Galaga like-game is created where a spaceship has to defeat all of the enemies before the enemies defeat it.
 ** it includes a point system for each enemy defeated, a win and lose screen, and bullet projectiles.
 */
 
//variables
float playerX;
float playerY;
int [] enemiesX = {250, 200, 150};
int [] enemiesY = {10, 10, 10};
float xDelta = 280;
float yDelta = 64;
float xAlpha = 1.5;
float yAlpha = 50;
float xAlpha2 = 1.5;
float yAlpha2= 50;
float xAlpha3 = 1.5;
float yAlpha3 = 50;
float xBullet;
float yBullet;
boolean bulletshoot = false;
float bulletSpeed = 5;
boolean playerdies = false;
int points = 0;
boolean YouWin = false;


/*
* setup - prepares envirnment size and color
*/
void setup() {
  //set canvas size and color
  size(576, 576);
  
  playerX = 50;
  playerY = height-100;
}

/*
* draw - draw player and move based on user input
*/


void draw() {
  background(0);
  points();
 
  if(!playerdies && !YouWin){ //If the player is not dead and you haven't won, the following will run)
  drawPlayer();
  playerMovement();
  restrictPlayer();
  makePlayerWrap();
  drawEnemies();
  moveEnemies();
  bullet();
  playerdead();
}
else if (playerdies){ //If the player dies then it will display "Try Again" under Game Over
  GameOver();
  points();
}
else if (YouWin){ //If the player dies then it will display "You Win!" under Game Over
  GameOver();
  points();
}
}
/*
* Responsible for moving the player up, down, left, and right using WASD
*/void playerMovement() {
  if (keyPressed) { // If any of the following keys are pressed, the ship will go in the specified direction
    if (key == 'w') {
      playerY -= 10;
    } else if (key == 's') {
      playerY += 10;
    } else if (key == 'a') {
      playerX -= 10;
    } else if (key == 'd') {
      playerX += 10;
    } 
    
    if (key == ' ' && !bulletshoot) { //If spacebar is pressed and bulletshoot is not false it becomes true and sets it's position to the ship.
      xBullet = playerX + 276; 
      yBullet = playerY - 10;
      bulletshoot = true;
  }
}
}
 // If any of the follwing keys are pressed then they are set to move in a direction
 // the x and y-axis continually 
  
/*
* drawPlayer - draws at the given x, y
*/
void drawPlayer() {

  rect(playerX+246, playerY+12, 8, 50);
  fill(#34C7FF);
  rect(playerX+254, playerY+25, 8, 28);
  rect(playerX+262, playerY+22, 8, 28);
  fill(255);
  rect(playerX+270, playerY+20, 16, 32);
  
  rect(playerX+272, playerY+10, 12, 10);

  rect(playerX+274, playerY, 8, 10);
fill(#34C7FF);
  rect(playerX+286, playerY+22, 8, 28);

  rect(playerX+294, playerY+25, 8, 28);
  fill(#FF34C6);
  rect(playerX+302, playerY+12, 8, 50);

}

/*
* restrictPlayer - do not advance when hitting top/bottom
*/
void restrictPlayer() {
  playerY = constrain(playerY, yDelta / 4, height - yDelta*1.2);
  // Stops player from going over y-axis on top and bottom
}

/*
* makePlayerWrap - put player on left when it reaches right, 
* right when left
*/
void makePlayerWrap() {
  if (playerX < -xDelta  ) {
    playerX = width + xDelta -500 ;
  } // Enables player to go left and wrap around from the right
  
  else if (playerX > width + xDelta -500 ) {
    playerX = -xDelta;
  } // Enables player to go right and wrap around from the left
}

/* drawEnemies - draws different enemies along the x, y axis
*/
void drawEnemies(){ 
  fill(#003FF5);
  rect(enemiesX[0], enemiesY[0], 32, 32);
  rect(enemiesX[0], enemiesY[0], 16, 16);
  //Creation for Enemy 1
   
   fill(#71F500);
    rect(enemiesX[1], enemiesY[1], 32, 32);
    rect(enemiesX[1], enemiesY[1], 16, 16);
  //Creation for Enemy 2
   
   fill(#FC6F03);
    rect(enemiesX[2], enemiesY[2], 32, 32);
    rect(enemiesX[2], enemiesY[2], 16, 16);
} //Creation for Enemy 3
/* moveEnemies allows for the enemies to bounce back and forth while gradually going
down the y-axis*/

void moveEnemies(){
  enemiesX[0] += xAlpha; 
  if (enemiesX[0] >= width-30 || enemiesX[0] <= 0){
    enemiesY[0] += yAlpha; //Makes enemy  go down after wall bounce
  xAlpha = -xAlpha; //Makes enemy bounce from wall to wall
  }
  
   enemiesX[1] += xAlpha2;
  if (enemiesX[1] >= width-30 || enemiesX[1] <= 0){
    enemiesY[1] += yAlpha2;
  xAlpha2 = -xAlpha2;
  } // Does the same for Enemy 2
  
   enemiesX[2] += xAlpha3;
  if (enemiesX[2] >= width-30 || enemiesX[2] <= 0){
    enemiesY[2] += yAlpha3;
  xAlpha3 = -xAlpha3;
  } // Does the same for Enemy 3
  
  
}

void bullet(){
   if (bulletshoot) {//If the bullet is shot the follwing conditions are met:
    yBullet -= bulletSpeed; //Moves the bullet up the y-axis
    fill(#FC6F03); //Sets color of bullet
    ellipse(xBullet, yBullet, 10, 20); //Creates the bullet
    
for(int i=0; i < enemiesX.length; i++){ //Lists out all of the enemies in the array
    float dist = sqrt((xBullet - enemiesX[i])*(xBullet - enemiesX[i]) + (yBullet - enemiesY[i])*(yBullet - enemiesY[i])); //Sets up the hit hitbox for the enemies/When bullet touches enemy
    if(dist <= 32){
    enemiesX[i] = -100; //Enemy disappears into thin air
    enemiesY[i] = -100;
    bulletshoot = false; //Bullet returns to ship after an enemy hit
    points = points + 100; //When each enemy is hit, point value goes up by 100
  }
  if (points == 300){ //If you get 300 points you win
    YouWin = true;
  }
}

    if (yBullet <= 0) { //if bullet goes past y-axis, it resets back to ship
      bulletshoot = false;
    }
  }
}

void playerdead(){
  for(int i=0; i < enemiesX.length; i++){ //Lists out all of the enemies.
  float dist2 = sqrt((playerX - enemiesX[i])*(playerX - enemiesX[i]) + (playerY - enemiesY[i])*(playerY - enemiesY[i])); //Sets up Player hitbox/When enemy touches player
  if (dist2 <= 64){// If conditions are met, you get -500 points and you die
    playerdies = true;
    points = points-500;
}
}
}

void GameOver(){
  if(playerdies){ //if the player dies it displays Try Again.
    background(255,0,0);
    fill(255,255,255);
    textSize(80);
    text("Try Again.", 130, 250);
}

if(YouWin){ //if all the enemies are shot you win.
  background(0,255,0);
    fill(255,255,255);
    textSize(80);
    text("You Win!", 130, 250);
}
}

void points(){ //Responsible for positioning and design of points
  fill(255,255,255);
    textSize(22);
    text("Points: " + points, 20, 30);
}
