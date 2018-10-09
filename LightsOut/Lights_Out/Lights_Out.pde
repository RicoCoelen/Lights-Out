// object for background image
PImage bg;
//global variables
Player player;
SmallEnemy e1;

void setup(){
  frameRate(60); //60 fps
  size(640,480); // size
  bg = loadImage("assets/background.jpg");
  player = new Player(); // initialize class
  e1 = new SmallEnemy(); 
}

void draw(){
  // draw 60 frames
  updateGame();
  updateDraw();
}

void updateGame() {
  // update game mechanics here
  player.display();
  player.movement();
  player.collision();
  player.border();
  e1.update();
}

void updateDraw() {
  // drawing background
  background(255 );
  // update draw here
  player.display();
  e1.draw();
}

void keyPressed(){
    //checking if pressed key is true
    if(key == 'a'){
      player.aPressed = true;
    }
    else if(key == 'd'){
      player.dPressed = true;
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