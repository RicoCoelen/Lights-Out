// object for background image
PImage bg;

// added challenger 4
MainMenu m = new MainMenu();

//global variables
Player player;
SmallEnemy e1;

int state = 1;  //  Current scenexxx

void setup() {
  frameRate(60); //60 fps
  size(640,480); // size
  bg = loadImage("assets/sprites/background.png");
  player = new Player(); // initialize class
  player.texture = loadImage("assets/sprites/player_right.jpg");;
  e1 = new SmallEnemy();

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
  player.display();
  player.movement();
  player.border();
  e1.update();
  
}

void updateDraw() {
  // drawing background
  background(bg);
  // update draw here
  player.display();
  e1.draw();
}

void keyPressed() {
    //checking if pressed key is true
    if(key == 'a') {
      player.aPressed = true;
    }
    else if(key == 'd'){
      player.dPressed = true;
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

}

void updateMainMenu(){
  m.draw();
  m.keyPressed();
 
}
