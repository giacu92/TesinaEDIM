// G4P
import g4p_controls.*;
import java.awt.Font;

int WinSize_X = 800;
int WinSize_Y = 480;

Serbatoio serbatoio1, serbatoio2;
color c1 = color(100, 255, 255);  // colore del serbatoio1 (celeste)
color c2 = color(255, 30, 30);    // colore del serbatoio2 (rosso)

String serbatoioError = "";

void setup()
{
  size(800, 480);
  frameRate(10);
  
  // Creo GUI:
  createGUI();
  
  // Carico i parametri dai file txt:
  caricaParametri();
  
  // Creo gli altri oggetti della GUI:
  
}

void draw()
{
  // Display
  background(0); // Metto lo sfondo nero
  
  aggiornaInterfaccia();
}