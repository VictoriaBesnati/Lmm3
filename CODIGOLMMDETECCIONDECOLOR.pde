import netP5.*;
import oscP5.*;
import spout.*;
import gab.opencv.*;
import processing.video.*;
import processing.serial.*;
import java.awt.Rectangle;

Spout spout;
Capture video;
OpenCV opencv;
Serial miPuerto;
OscP5 osc;
NetAddress locacionRemota;
boolean mandoVideo;
int valorResistencia;
int contador;
PImage src, colorFilteredImage;
ArrayList<Contour> contours;
int rangeLow = 110; //SETEO LOS RANGOS DE COLOR EN ESTE CASO EL AZUL ESTA ENTRE ESOS RANGOS
int rangeHigh = 115;
boolean pasarEst;
boolean pasarEst2;

int segundos;
int segundosLira;
int tiempoRealLira;
int tiempoLira;
int horas;
int tiempoReal;
int tiempo;
int minutos;

int vel = 0;

boolean avanza = false;
int estamirando;
String estado = "inicio";

void setup() {

  osc = new OscP5(this, 12000);
  locacionRemota =  new NetAddress("127.0.0.1", 7000);
  mandoVideo=true;
  video = new Capture(this, "pipeline:autovideosrc");
  video.start();
  spout= new Spout(this);
  opencv = new OpenCV(this, video.width, video.height);
  contours = new ArrayList<Contour>();

  size(640, 480, P2D);

  String portName = Serial.list()[0];
  miPuerto = new Serial(this, portName, 9600);
  background(255);

  tiempo=millis();
}

void draw() {
  tiempoReal= millis()-tiempo;
  segundos=tiempoReal/1000;
  tiempoRealLira= millis()-tiempoLira;
  segundosLira=tiempoRealLira/1000;
  OscMessage cambiarlayer = new OscMessage("/composition/layers/4/clips/2/connect");
  OscMessage cambiarlayer0 = new OscMessage("/composition/layers/5/clips/2/connect");

  OscMessage cambiarlayer1 = new OscMessage("/composition/layers/4/clips/3/connect");
  OscMessage cambiarlayer2 = new OscMessage("/composition/layers/5/clips/3/connect");

  OscMessage cambiarlayer3 = new OscMessage("/composition/layers/4/clips/4/connect");
  OscMessage cambiarlayer4 = new OscMessage("/composition/layers/5/clips/4/connect");

  OscMessage cambiarlayer5 = new OscMessage("/composition/layers/3/clips/5/connect");

  OscMessage cambiarlayer6 = new OscMessage("/composition/layers/4/clips/6/connect");
  OscMessage cambiarlayer7 = new OscMessage("/composition/layers/5/clips/6/connect");

  OscMessage cambiarlayer8 = new OscMessage("/composition/layers/3/clips/7/connect");

  OscMessage cambiarlayer9 = new OscMessage("/composition/layers/2/clips/8/connect");

  OscMessage cambiarlayer10 = new OscMessage("/composition/layers/2/clips/9/connect");
  OscMessage cambiarlayer11 = new OscMessage("/composition/layers/2/clips/10/connect");
  OscMessage cambiarlayer12 = new OscMessage("/composition/layers/2/clips/11/connect");

  OscMessage reproducirvideo = new OscMessage("/composition/selectedclip/transport/position/behaviour/playdirection");

  if (estado == "inicio") {



    cambiarlayer.add(1);
    cambiarlayer0.add(1);
    cambiarlayer1.add(1);
    cambiarlayer2.add(1);
    cambiarlayer3.add(1);
    cambiarlayer4.add(1);
    cambiarlayer5.add(1);
    cambiarlayer6.add(1);
    cambiarlayer7.add(1);
    cambiarlayer8.add(1);
    cambiarlayer9.add(1);
    cambiarlayer10.add(1);
    cambiarlayer11.add(1);
    cambiarlayer12.add(1);

    reproducirvideo.add(1);


    if (mandoVideo==true) {
      osc.send(cambiarlayer, locacionRemota);
      osc.send(cambiarlayer0, locacionRemota);
      mandoVideo=false;
    }
    //osc.send(reproducirvideo, locacionRemota);
    if (segundos==15) {
      segundos=0;
      println("paso");
      tiempo=millis();


      estado = "estado1";
    }
  }
  if (estado=="estado1") {
    osc.send(cambiarlayer1, locacionRemota);
    osc.send(reproducirvideo, locacionRemota);
    if (segundos == 1) {
      osc.send(cambiarlayer2, locacionRemota);
      osc.send(reproducirvideo, locacionRemota);
    }

    if (segundos==15 && estado=="estado1" && avanza ==true) {
      segundos=0;
      println("paso");
      tiempo=millis();



      estado = "estado2";
    }
  }
  if (estado=="estado2") {
    osc.send(cambiarlayer3, locacionRemota);
    osc.send(reproducirvideo, locacionRemota);
    osc.send(cambiarlayer4, locacionRemota);
    osc.send(reproducirvideo, locacionRemota);
    if (segundos==15 && estado=="estado2" && avanza ==true) {
      segundos=0;
      println("paso");
      tiempo=millis();



      estado = "estado3";
    }
  }
  if (estado=="estado3") {

    osc.send(cambiarlayer5, locacionRemota);
    osc.send(reproducirvideo, locacionRemota);

    if (segundos==15 && estado=="estado3" && avanza ==true) {
      segundos=0;
      println("paso");
      tiempo=millis();



      estado = "estado4";
    }
  }
  if (estado=="estado4") {
    osc.send(cambiarlayer6, locacionRemota);
    osc.send(reproducirvideo, locacionRemota);
    osc.send(cambiarlayer7, locacionRemota);
    osc.send(reproducirvideo, locacionRemota);
    if (segundos==15 && estado=="estado4" && avanza ==true) {
      segundos=0;
      println("paso");
      tiempo=millis();



      estado = "estado5";
    }
  }
  if (estado=="estado5") {
    osc.send(cambiarlayer8, locacionRemota);
    osc.send(reproducirvideo, locacionRemota);

    if (segundos==15 && estado=="estado5" && avanza ==true) {
      segundos=0;
      println("paso");
      tiempo=millis();



      estado = "estado6";
    }
  }
  if (estado=="estado6") {
    osc.send(cambiarlayer9, locacionRemota);
    osc.send(reproducirvideo, locacionRemota);

    if (segundos>=15 && estado=="estado6" && avanza ==true) {
      segundos=0;
      println("paso");
      tiempo=millis();



      estado = "estado7";
    }
  }
  if (estado=="estado7") {
    osc.send(cambiarlayer10, locacionRemota);
    osc.send(reproducirvideo, locacionRemota);

    if (segundos==15 && estado=="estado7" && avanza ==true) {
      segundos=0;
      println("paso");
      tiempo=millis();



      estado = "estado8";
    }
  }
  if (estado=="estado8") {
    osc.send(cambiarlayer11, locacionRemota);
    osc.send(reproducirvideo, locacionRemota);

    if (segundos==15 && estado=="estado8" && avanza ==true) {
      segundos=0;
      println("paso");
      tiempo=millis();



      estado = "estado9";
    }
  }
  if (estado=="estado9") {
    osc.send(cambiarlayer12, locacionRemota);
    osc.send(reproducirvideo, locacionRemota);

    if (segundos==15 && estado=="estado9" && avanza ==true) {
      segundos=0;
      println("paso");
      tiempo=millis();

      estado = "estado10";
    }
  }

  if (valorResistencia == 0) {

    tiempoRealLira = millis()-tiempo;
    if (segundos>2) {
      vel = 0;
    }
    if (segundos>3) {
      tiempoLira=millis();
      avanza = false;
      vel = -1;
    }
    segundosLira=tiempoRealLira/1000;
  } else if (valorResistencia>0) {
    avanza = true;
    tiempoLira=millis();
    segundosLira = 0;
    vel = 1;
  }

  println(horas +":", minutos+":", segundos);
  println(avanza, estado);

  if ( miPuerto.available() > 0) {  // If data is available,
    valorResistencia = miPuerto.read();         // read it and store it in val
  }

  println(valorResistencia);

  if (video.available()) { //Si hay camara disponible la lee
    video.read();
  }

  opencv.loadImage(video); // OpenCV carga la camara

  opencv.useColor();
  src = opencv.getSnapshot();
  opencv.useColor(HSB); //LE DIGO A OPENCV QUE CAPTURE COLOR EN HSB ES MAS FACIL POR LOS RANGOS

  opencv.setGray(opencv.getH().clone()); //NO SE QUE HACE PERO SI LO BORRO SE ROMPE

  opencv.inRange(rangeLow, rangeHigh); //FILTRA EL COLOR EN BASE A LOS RANGOS DADOS

  contours = opencv.findContours(true, true); //NO SE QUE HACE PERO SI LO PONGO EN FALSE SE MUERE

  image(video, 0, 0); //MUESTRO LA IMAGEN

  if (contours.size() > 0) { //SE FIJA SI HAY ALGUN COLOR
    Contour biggestContour = contours.get(0); //SI HAY LOS BUSCA
    Rectangle r = biggestContour.getBoundingBox(); //SE QUEDA CON EL MAS GRANDE
    noFill(); //COSAS DE INTERFAZ
    strokeWeight(2);
    stroke(255, 0, 0);
    rect(r.x, r.y, r.width, r.height);
    if (r.width<100 && r.height<100) { //SI EL RECT DEL CONTORNO ES MENOR A ESE VALOR(AJUSTARLO DEPENDIENDO LAS NECESIDADES) EL USUARIO NO ESTA MIRANDO
      println("MIRO PAL COSTAO");
      estamirando = 3;
      //osc.send(mirando, locacionRemota);
    } else { //SI ES MAYOR ESTA MIRANDO AL FRENTE
      println("Mirando al frente");
      estamirando = 4;
      // osc.send(mirando, locacionRemota);
    }
  }
}
