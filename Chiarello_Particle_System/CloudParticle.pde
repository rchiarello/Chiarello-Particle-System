//SETTING UP THE CLOUD CLASS
class CloudParticle {

  //DEFINING NECESSARY VARIABLES FOR EACH PARTICLE
  PVector loc, vel, acc;
  float sz;
  float h, s, b, a;

  //SETTING UP USE CONSTRUCTOR FOR THE PARTICLES
  CloudParticle(float tempX, float tempY, float tempsz) {

    //INITIALIZING VARIABLES
    loc=new PVector(tempX, tempY);
    vel=new PVector(random(.5, 1.5), 0);
    acc=new PVector(0, 0);
    sz= tempsz;
    h=0;
    s=0;
    b=50;
    a=95;
  }

  //DEFINING METHODS FOR THE CLASS
  void display() {
    //SET THE COLOR OF THE STROKE OF THE CLOUD
    stroke(0, 5);

    //DISPLAYS THE CLOUD PARTICLE ON THE SCREEN
    ellipse(loc.x, loc.y, sz*2, sz);
  }

  void move() {
    //MOVES THE CLOUD PARTICLE ACROSS/ DOWN THE SCREEN
    vel.add(acc);
    loc.add(vel);
  }

  void colors() {
    //TELLS WHAT COLORS TO MAKE THE CLOUD
    colorMode(HSB, 360, 100, 100, 100);
    fill(h, s, b, a);
  }

  boolean isDead() {
    //DETERMINING IF THE CLOUD PARTICLE SHOULD DIE
    if (loc.x>width+sz/2) {

      //CLOUD PARTICLE SHOULD DIE IF IT GOES TO THE RIGHT OF THE SCREEN
      return true;
    } else {

      //CLOUD PARTICLE SHOULD NOT DIE IF IT IS STILL ON THE SCREEN
      return false;
    }
  }

  void teleport(CloudParticle someOtherCloud) {
    //WHEN THE CLOUD DIES, TRANSPORT IT TO THE LEFT OF THE SCREEN
    if (someOtherCloud.isDead()) {
      someOtherCloud.loc.x=-sz;
    }
  }
}
