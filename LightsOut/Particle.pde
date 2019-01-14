//Particle class

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
   acceleration = new PVector(0, 0.0001);
    velocity = new PVector(random(-2,2), random(-2,2));
    position = l.copy();
    lifespan = 80.0;
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 4;
  }

  // Method to display
  void display() {
    stroke(255,0,0, lifespan);
    fill(255,0,0, lifespan);
    ellipse(position.x, position.y, 8, 8);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
