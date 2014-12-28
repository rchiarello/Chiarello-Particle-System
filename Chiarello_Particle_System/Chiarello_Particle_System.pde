//DEFINING AND INITIALIZING A NEW ARRAY LIST OF...

//PARTICLES
ArrayList<Particle> p= new ArrayList<Particle>();

//CLOUD PARTICLES
ArrayList<CloudParticle> c= new ArrayList<CloudParticle>();

//UMBRELLAS
ArrayList<Umbrella> u= new ArrayList<Umbrella>();

void setup() {
  size(800, 500);

  //ADDING A SET NUMBER OF CLOUD PARTICLES TO THE ARRAY LIST
  for (int i=0; i<60; i++) {
    c.add(new CloudParticle(random(width), random(height*.1), random(80, 100)));
  }
}


void draw() {

  //ADDING A SET NUMBER OF PARTICLES TO THE ARRAY LIST
  for (int i=0; i<5; i++) {
    p.add(new Particle(random(width), 40, random(205, 235), 60));
  }

  //SETTING THE BACKGROUND
  background(230, 100, 15);

  //GOING THROUGH FOR EACH PARTICLE IN THE ARRAY LIST
  for (int i=p.size ()-1; i>0; i--) {

    //SETTING UP A PLACEHOLDER TO WORK WITH THE METHODS
    Particle a=p.get(i);

    //CALLING METHODS FOR PARTICLES
    a.display();
    a.move();
    a.colors();
    if (a.isDead()) {
      p.remove(i);
    }

    //MAKING THE UMBRELLA TAKE AWAY THE RAIN PARTICLE
    for (int j=0; j<u.size (); j++) {

      //CREATING PLACEHOLDER G TO WORK WITH UMBRELLA U
      Umbrella g= u.get(j);
      if (i!=j) {

        //SPECIFYING THAT UMBRELLA G IS KILLING PARTICLE A
        if (g.isKilling(a)) {

          //IF IT IS, REMOVE THE PARTICULAR PARTICLE THAT WAS KILLED
          p.remove(i);
        }
      }
    }
  }

  //GOING THROUGH EACH CLOUD PARTICLE IN THE ARRAY LIST
  for (int i=c.size ()-1; i>0; i--) {

    //SETTING UP A PLACEHOLDER TO WORK WITH THE METHODS
    CloudParticle b=c.get(i);

    //CALLING METHODS
    b.display();
    b.move();
    b.colors();
    b.teleport(b);
  }

  //GOING THROUGH EACH ITEM IN THE UMBRELLA ARRAY LIST
  for (int i=0; i<u.size (); i++) {

    //SETTING UP A PLACEHOLDER G TO WORK WITH UMBRELLA U
    Umbrella g= u.get(i);

    //CALLING METHODS
    g.display();
  }
}

void mouseClicked() {
  //ADDING A NEW UMBRELLA EACH TIME THE MOUSE IS CLICKED
  if (u.size()<20) {
    u.add(new Umbrella(mouseX, mouseY, 100));
  }
}

