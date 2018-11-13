// global loaded images
PImage bg;

//global objects
Player player;
MainMenu m;
Scene s;

// global vars
int state = 0;  
int dashCoolDown = 0;
int dashCoolTime = 90;
int dashDistance = 50;
int score;

//  Amount of enemies in wave
int enemyAmount;  
ArrayList<Enemy> enemyList = new ArrayList<Enemy>();

void setup() {
  // set standard settings
  size(640,480);
  
  // init objects
  m = new MainMenu();
  s = new Scene();
  player = new Player();
  
  // load all images here
  player.texture = loadImage("assets/sprites/player_right.png");
  bg = loadImage("assets/sprites/background.jpg");
}

void draw() {
  // draw / update / setup scenes
  s.draw();
}

/*
========= user input ===========
*/

void keyPressed() {
  if(key == CODED) {
    // check coded key
    switch(keyCode) {
      case UP:
        player.upPressed = true;
        player.playerInput.add("UP");
        player.playerInputButtons.add(player.upArrow);
        player.comboCounter = 0;
        // menu to update select
        if (state == 0) {
          m.buttonUp();
        }
      break;
      case DOWN:
        player.downPressed = true;
        player.playerInput.add("DOWN");
        player.playerInputButtons.add(player.downArrow);
        player.comboCounter = 0;
        // menu to update select
        if (state == 0) {
          m.buttonDown();
        }
      break;
      case LEFT:
        player.leftPressed = true;
        player.playerInput.add("LEFT");
        player.playerInputButtons.add(player.leftArrow);
        player.comboCounter = 0;
      break;
      case RIGHT:
        player.rightPressed = true;
        player.playerInput.add("RIGHT");
        player.playerInputButtons.add(player.rightArrow);
        player.comboCounter = 0;
      break;
    }
  }
  else {
    // check non coded key
    switch(key) {
      case 'a':
      case 'A':
        player.aPressed = true;
        player.texture = loadImage("assets/sprites/player_left.png");
      break;
      case 'd':
      case 'D':
        player.dPressed = true;
        player.texture = loadImage("assets/sprites/player_right.png");
      break;
      case 'q':
      case 'Q':
        if (dashCoolDown + dashCoolTime < frameCount) {
        player.velocityX = player.velocityX - dashDistance; 
        dashCoolDown = frameCount;
        }
      break;
      case 'e':
      case 'E':
        if(dashCoolDown + dashCoolTime  < frameCount){
        player.velocityX = player.velocityX + dashDistance;
        dashCoolDown = frameCount;
        }
      break;    
      case '0':
        state = 0; 
      break;
      case '1':
        state = 1; 
      break;
      case '2':
        state = 2; 
      break;
      case '9':
        state = 9; 
      break;
    }
  }
}

void keyReleased(){
  // check non coded key
  if(key == CODED) {
    // check coded key
    switch(keyCode) 
    {
      case UP:
        player.upPressed = false;
      break;
      case DOWN:
        player.downPressed = false;
      break;
      case LEFT:
        player.leftPressed = false;
      break;
      case RIGHT:
        player.rightPressed = false;
      break;
    }
  }
  else {
    // check non coded key
    switch(key) 
    {
      case 'a':
      case 'A':
        player.aPressed = false;
      break;
      case 'd':
      case 'D':
        player.dPressed = false;
      break;
      case 'q':
      case 'Q':
        player.qPressed = false;
      break;
      case 'e':
      case 'E':
        player.ePressed = false;
      break;    
    }
  }  
}
