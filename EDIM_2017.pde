// G4P
import g4p_controls.*;
import java.awt.Font;

// Scrittura sul disco
import java.io.FileWriter;
import java.io.Writer;
import java.io.BufferedWriter;
import java.io.FileReader;

// Raspberry GPIO:
import processing.io.*;

// Collections
import java.util.Collections;
import java.util.ArrayList;
import java.util.List;

// Immagine logo univaq e R13
PImage logoUnivaq, logoR13;

// Inizializzazione variabili ed oggetti globali
Serbatoio serbatoio1, serbatoio2;
color c1 = color(100, 255, 255);  // colore del serbatoio1 (celeste)
color c2 = color(255, 30, 30);    // colore del serbatoio2 (rosso)

String serbatoioError = "", clientiError = "";
float diluizione = 1;

// SETUP:
void setup()
{
  size(800, 480);
  frameRate(30);
  
  // Inizializzo GPIO:
  GPIO.pinMode(4, GPIO.OUTPUT);
  GPIO.pinMode(5, GPIO.OUTPUT);
  
  // Creo GUI:
  createGUI();
  
  // Cari1o i parametri dai file txt:
  caricaParametri();
  
  // Creo gli altri oggetti della GUI:
  logoUnivaq = loadImage("univaq.gif");
  logoR13    = loadImage("R13.png");
}

// DRAW
void draw()
{
  // Display
  background(0); // Metto lo sfondo nero
  
  aggiornaInterfaccia();
}

// chiamato alla chiusura
@Override
void exit()
{
    //Creo o aggiorno il file "configSerbatoi.csv" per la prossima apertura:
    PrintWriter output;
    output = createWriter(dataPath("configSerbatoi.csv"));
    output.println("name,maxVolume,currentVolume");
    output.println(  serbatoio1.getName()      + "," +
                     serbatoio1.getMaxVolume() + "," + 
                     serbatoio1.getCurrentVolume()     );
    output.println(  serbatoio2.getName()      + "," +
                     serbatoio2.getMaxVolume() + "," + 
                     serbatoio2.getCurrentVolume()     );
    output.flush();
    output.close();
    
    //ordino il file listaClienti.csv in ordine alfabetico:
    sortFile("listaClienti.csv", "listaClienti.csv");
    
    super.exit();
}