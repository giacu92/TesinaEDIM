// G4P
import g4p_controls.*;
import java.awt.Font;

// Scrittura sul disco
import java.io.FileWriter;

int WinSize_X = 800;
int WinSize_Y = 480;

Serbatoio serbatoio1, serbatoio2;
color c1 = color(100, 255, 255);  // colore del serbatoio1 (celeste)
color c2 = color(255, 30, 30);    // colore del serbatoio2 (rosso)

String serbatoioError = "";
float diluizione = 1;

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

// chiamato alla chiusura
@Override
void exit()
{
    //creo il file configSerbatoi.csv per la prossima volta:
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
    
    super.exit();
}