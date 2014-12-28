//SETTING UP THE UMBRELLA CLASS
class Umbrella {

  //DEFINE VARIABLES FOR EACH UMBRELLA
  PVector loc;
  float sz;
  PImage umb;

  //CREATING CONSTRUCTOR TO INITIALIZE UMBRELLAS
  Umbrella(float tempX, float tempY, float tempsz) {
    loc= new PVector(tempX, tempY);
    sz=tempsz;
    umb= loadImage("umbrellaBetter.png");
  }

  //DEFINING METHODS
  void display() {
    
    imageMode(CENTER);
    
    //DISPLAYS THE UMBRELLA ON THE SCREEN
    image(umb, loc.x, loc.y, sz, sz);
  }

  boolean isKilling(Particle someOtherParticle) {
    
    //UMBRELLA KILLS THE PARTICLE IF IT COMES IN CONTACT WITH IT
    if (someOtherParticle.loc.dist(loc)<sz/2+someOtherParticle.sz/2) {
      
      //KILL PARTICLE IF IT TOUCHES UMBRELLA
      return true;
    } else {
      
      //DO NOT KILL PARTICLE IF IT DOES NOT TOUCH UMBRELLA
      return false;
    }
  }
}

