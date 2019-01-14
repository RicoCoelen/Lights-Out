//class
class ParticleSystem1 {
  ArrayList<Particle> particles;
  PVector origin;
  float counter;
  float time;  // duration of pop-up in seconds

  ParticleSystem1(PVector position) {
    origin = position.copy();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }
  
  void delete(float time){
    counter += (float) 1/60;
    if (counter >= time) {
      player.particleList.remove(player.particleList.indexOf(this));  //  Gets current index of object in array and removes itop();
    } 
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}
