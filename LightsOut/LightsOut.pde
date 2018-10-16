// object for background image
PImage bg;

// added challenger 4
MainMenu m = new MainMenu();

//global variables
Player player;
Enemy e1;

int state = 1;  //  Current scene

void setup() {
  frameRate(60); //60 fps
  size(640,480); // size
  bg = loadImage("assets/sprites/background.jpg");
  player = new Player(); // initialize class
  player.texture = loadImage("assets/sprites/player_right.png");
  e1 = new Enemy(200, 325, 1);
}

void draw() {
  // draw 60 frames
  updateMainMenu();
  switch (state) { 
    case 1:
      scene1();
      break;
    case 2:
      scene2();
      break;  
  } 
}

void scene1() {
  // draw 60 frames
  updateMainMenu();
  
}

void scene2() {
  updateGame();
  updateDraw();
}


void updateGame() {
  // update game mechanics here
  player.collision();
  player.collisionMove();
  player.display();
  player.movement();
  player.border();
  player.counter();
  e1.update();
  e1.checkCollision();
}

void updateDraw() {
  // drawing background
  background(bg);
  // update draw here
  player.display();
  e1.draw();
  
  e1.drawButtons();
  player.drawButtons();
}

void keyPressed() {
    //checking if pressed key is true
    if(key == 'a' || key == 'A') {
      player.aPressed = true;
      player.texture = loadImage("assets/sprites/player_left.png");
    }
    else if(key == 'd' || key == 'D'){
      player.dPressed = true;
      player.texture = loadImage("assets/sprites/player_right.png");
    }
    else if (key == CODED) {
      if (keyCode == UP) {
        player.upPressed = true;
        player.playerInput.add("UP");
        player.playerInputButtons.add(player.upArrow);
        player.comboCounter = 0;
      }
      else if (keyCode == DOWN) {
        player.downPressed = true;
        player.playerInput.add("DOWN");
        player.playerInputButtons.add(player.downArrow);
        player.comboCounter = 0;
      }
      else if (keyCode == LEFT) {
        player.leftPressed = true;
        player.playerInput.add("LEFT");
        player.playerInputButtons.add(player.leftArrow);
        player.comboCounter = 0;
      }
      else if (keyCode == RIGHT) {
        player.rightPressed = true;
        player.playerInput.add("RIGHT");
        player.playerInputButtons.add(player.rightArrow);
        player.comboCounter = 0;
      }
    }
    if(key == '1') {
     state = 2; 
    }
    if(key == 'b' && key == 'B'){
     state = 1; 
    }
}

void keyReleased(){
    //checking if pressed key is false
    if(key == 'a'){
      player.aPressed = false;
    }
    else if(key == 'd'){
      player.dPressed = false;
    }
    else if (key == CODED) {
      if (keyCode == UP) {
        player.upPressed = false;
      }
      else if (keyCode == DOWN) {
        player.downPressed = false;
      }
      else if (keyCode == LEFT) {
        player.leftPressed = false;
      }
      else if (keyCode == RIGHT) {
        player.rightPressed = false;
      }
    }

}

void updateMainMenu(){
  m.draw();
  m.keyPressed();
 
}
