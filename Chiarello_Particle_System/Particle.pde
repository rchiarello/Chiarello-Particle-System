//SETTING UP THE PARTICLE CLASS
class Particle {
  //DEFINING NECESSARY VARIABLES FOR EACH PARTICLE
  PVector loc, vel, acc;
  float sz;
  float h, s, b, a;

  //SETTING UP USE CONSTRUCTOR FOR THE PARTICLES
  Particle(float tempX, float tempY, float tempH, float tempA) {

    //INITIALIZING VARIABLES
    loc=new PVector(tempX, tempY);
    vel=new PVector(0, random(1, 3));
    acc=new PVector(0, .05);
    sz= 20;
    h=tempH;
    s=80;
    b=100;
    a=tempA;
  }

  //DEFINING METHODS FOR THE CLASS
  void display() {
    noStroke();
    //DISPLAYS THE PARTICLE ON THE SCREEN
    ellipse(loc.x, loc.y, sz/2, sz);
  }

  void move() {
    //MOVES THE PARTICLE ACROSS/ DOWN THE SCREEN
    vel.add(acc);
    loc.add(vel);
  }

  void colors() {
    //TELLS WHAT COLORS TO MAKE THE OBJECT
    colorMode(HSB, 360, 100, 100, 100);
    fill(h, s, b, a);
  }

  boolean isDead() {
    //DETERMINING IF THE PARTICLE SHOULD DIE
    if (loc.y-sz>height) {

      //PARTICLE SHOULD DIE IF IT GOES BELOW THE BOTTOM OF THE SCREEN
      return true;
    } else {

      //PARTICLE SHOULD NOT DIE IF IT IS STILL ON THE SCREEN
      return false;
    }
  }
}
