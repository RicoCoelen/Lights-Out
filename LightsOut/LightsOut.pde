// imports
import ddf.minim.*;
import java.util.*;

// global loaded images
PImage bg;
PImage bgDeath;
PImage bgMountains;
PImage bgCity;

// global loaded fonts
PFont font;

//global objects
Player player;
MainScene scene;
Highscore highscore;
Minim minim;
AudioController background;
LightsOut lightsOut = this;

// global vars
int state = 0;  
int dashCoolDown = 0;
int dashCoolTime = 90;
int dashDistance = 50;
int score;
int displayScore;
int wave;

//  Sets ground height
float groundHeight = 410;

//  Amount of enemies in wave
int enemyAmount;  
ArrayList<Enemy> enemyList = new ArrayList<Enemy>();

void setup() {
  // set standard settings
  size(640,480);
  frameRate(60);
  
  // init objects
  highscore = new Highscore();
  player = new Player();
  scene = new MainScene();
  
  // load all images here
  player.texture = loadImage("data/sprites/player_right.png");
  bg = loadImage("data/sprites/background.jpg");
  bgDeath = loadImage("data/sprites/deathbackground.jpg");
  bgMountains = loadImage("data/sprites/mountainbackground.png");
  bgCity = loadImage("data/sprites/citybackground.jpg");
  
  // load fonts here
  font = loadFont("m5x7.vlw");
  textFont(font);
  
}

void draw() {
  // draw / update / setup scenes
  scene.update();
}

void reset() {
  player.health = 100;
  player.playerInput.clear();
  player.playerInputButtons.clear();
  enemyList.clear();
  wave = 0;
  score = 0;
  displayScore = 0;
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
        player.checkCombo();
      break;
      case DOWN:
        player.downPressed = true;
        player.playerInput.add("DOWN");
        player.playerInputButtons.add(player.downArrow);
        player.comboCounter = 0;
        player.checkCombo();
      break;
      case LEFT:
        player.leftPressed = true;
        player.playerInput.add("LEFT");
        player.playerInputButtons.add(player.leftArrow);
        player.comboCounter = 0;
        player.checkCombo();
      break;
      case RIGHT:
        player.rightPressed = true;
        player.playerInput.add("RIGHT");
        player.playerInputButtons.add(player.rightArrow);
        player.comboCounter = 0;
        player.checkCombo();
      break;
    }
  }
  else {
    // check non coded key
    switch(key) {
      case 'a':
      case 'A':
        player.aPressed = true;
        player.playerFacingLeft = true;
      break;
      case 'd':
      case 'D':
        player.dPressed = true;
        player.playerFacingLeft = false;
      break;
      case 'q':
      case 'Q':
        player.qPressed = true;
        if (dashCoolDown + dashCoolTime < frameCount) {
        player.velocityX = player.velocityX - dashDistance; 
        dashCoolDown = frameCount;
        }
      break;
      case 'e':
      case 'E':
        player.ePressed = true;
        if(dashCoolDown + dashCoolTime  < frameCount){
        player.velocityX = player.velocityX + dashDistance;
        dashCoolDown = frameCount;
        }
      break;
      case 'w':
      case 'W':
         player.wPressed = true;
      break;
      case 's':
      case 'S':
         player.sPressed = true;
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
      case '3':
        state = 3; 
      break;
      case '7':
        state = 7; 
      break;
      case '8':
        state = 8; 
      break;
      case '9':
        state = 9; 
      break;
      case '+':
        wave++;
        enemyList.clear();
        scene.scene1.waveSwitcher();
      break;
      case '-':
        wave++;
        enemyList.clear();
        scene.scene2.waveSwitcher();
      break;
      case '*':
        wave++;
        enemyList.clear();
        scene.scene3.waveSwitcher();
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
      case 'w':
      case 'W':
         player.wPressed = false;
      break;
      case 's':
      case 'S':
         player.sPressed = false;
      break;
    }
  }  
}
