/////////
// GUI //
/////////

// Events:

/**  Quando cambia la quantità nella textfield tfQuantity;
*
*/
public void tfQuantity_change(GTextField source, GEvent event)
{
  if(float(tfQuantity.getText()) < 0) tfQuantity.setText("0.0");
  if(float(tfQuantity.getText()) > 999) tfQuantity.setText("999.0");
}

/**  TARA:
*  Pesa la tazza e fissa la tara.
*/
public void buttonTara_click(GButton source, GEvent event)
{
  println("Tara clicked");
}

/**  Aumenta volume totale:
*  Aumenta di una unità la quantità di crema totale richiesta.
*/
public void buttonVolInc_click(GButton source, GEvent event)
{
  float val = Float.valueOf(tfQuantity.getText());
  val += 10;
  if (val > 999)  val = 999.0;
  
  tfQuantity.setText(str(val));
}

/**  Diminuisce volume totale:
*  Diminuisce di una unità la quantità di crema totale richiesta.
*/
public void buttonVolDec_click(GButton source, GEvent event)
{
  println("Volume Decrease clicked");
  float val = Float.valueOf(tfQuantity.getText());
  val -= 10;
  if (val < 0)  val = 0;
  
  tfQuantity.setText(str(val));
}

/**  DILUIZIONE 1:1
*  Fissa la diluizione 1 a 1
*/
public void button1_1_click(GButton source, GEvent event)  {diluizione = 1;}

/**  DILUIZIONE 1:1.5
*  Fissa la diluizione 1 a 1.5
*/
public void button1_15_click(GButton source, GEvent event)  {diluizione = 1.5;}

/**  DILUIZIONE 1:2
*  Fissa la diluizione 1 a 2
*/
public void button1_2_click(GButton source, GEvent event)  {diluizione = 2;}

/**  DILUIZIONE 1:3
*  Fissa la diluizione 1 a 3
*/
public void button1_3_click(GButton source, GEvent event)  {diluizione = 3;}

/**  Inizia la procedura di miscelazione:
*  Diminuisce di una unità la quantità di crema totale richiesta.
*/
public void buttonStart_click(GButton source, GEvent event)
{
  println("Start clicked");
  
  //calcolo i volumi da miscelare ed erogo.
  float vol = Float.valueOf(tfQuantity.getText()) / (diluizione + 1);
  
  if(serbatoio1.pour(vol))
  {
    if(serbatoio2.pour(diluizione*vol))
    {
      serbatoioError = "";
      // erogazione elettrica da entrambi i serbatoi... codice per attivare
      // le pompe ecc
      
    }
    else
    {
      serbatoioError = "Quantità di " + serbatoio2.getName() + " non sufficiente";
      serbatoio1.refill(3);
    }
  }
  else  serbatoioError = "Quantità di " + serbatoio1.getName() + " non sufficiente";
}

/**
*  Riempie il serbatoio 1:
*/
public void buttonRefill_1_click(GButton source, GEvent event)
{
  serbatoio1.refill(9e6);
}

/**
*  Riempie il serbatoio 2:
*/
public void buttonRefill_2_click(GButton source, GEvent event)
{
  serbatoio2.refill(9e6);
}

// Variable declatations
GTextField tfQuantity;

GButton buttonTara;    //serve a fissare il peso del contenitore con la tara.
GButton buttonVolInc;  //serve ad aumentare il volume totale della crema
GButton buttonVolDec;  //serve a  diminuire il volume totale della crema
GButton button1_1, button1_15, button1_2, button1_3;
GButton buttonStart;   //avvia l'erogazione
GButton buttonRefill_1, buttonRefill_2;

// Create all the GUI controls.
public void createGUI()
{
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Tesina EDIM 2017 - Giacomo Mammarella");
  
  //TextFields:                      X    Y    W    H
  tfQuantity = new GTextField(this, 340,  23,  70,  24, G4P.SCROLLBARS_NONE);
  
  tfQuantity.setText("100.0");
  tfQuantity.setOpaque(true);
  tfQuantity.addEventHandler(this, "tfQuantity_change");
  tfQuantity.setFont(new Font("Helvetica", Font.PLAIN, 18));
  
  //Buttons                           X    Y    W    H
  buttonTara     = new GButton(this, 30,  30,  100, 100);
  buttonVolInc   = new GButton(this, 690, 30,  80,  45 );
  buttonVolDec   = new GButton(this, 690, 85,  80,  45 );
  button1_1      = new GButton(this, 30,  150, 140, 50 );
  button1_15     = new GButton(this, 230, 150, 140, 50 );
  button1_2      = new GButton(this, 430, 150, 140, 50 );
  button1_3      = new GButton(this, 630, 150, 140, 50 );
  buttonStart    = new GButton(this, 430, 230, 340, 80 );
  buttonRefill_1 = new GButton(this, 50,  380, 80,  30 );
  buttonRefill_2 = new GButton(this, 170, 380, 80,  30 );
  
  buttonTara.setFont    (new Font("Helvetica-Bold", Font.BOLD,  18));
  buttonVolInc.setFont  (new Font("Helvetica-Bold", Font.PLAIN, 22));
  buttonVolDec.setFont  (new Font("Helvetica-Bold", Font.PLAIN, 22));
  button1_1.setFont     (new Font("Helvetica-Bold", Font.PLAIN, 22));
  button1_15.setFont    (new Font("Helvetica-Bold", Font.PLAIN, 22));
  button1_2.setFont     (new Font("Helvetica-Bold", Font.PLAIN, 22));
  button1_3.setFont     (new Font("Helvetica-Bold", Font.PLAIN, 22));
  buttonStart.setFont   (new Font("Helvetica-Bold", Font.PLAIN, 22));
  buttonRefill_1.setFont(new Font("Helvetica-Bold", Font.PLAIN, 14));
  buttonRefill_2.setFont(new Font("Helvetica-Bold", Font.PLAIN, 14));
  
  //buttonTara.setTextBold();
  //buttonVolInc.setTextBold();
  //buttonVolDec.setTextBold();
  
  buttonTara.setText("Tara");
  buttonVolInc.setText("+");
  buttonVolDec.setText("-");
  button1_1.setText("1 : 1");
  button1_15.setText("1 : 1.5");
  button1_2.setText("1 : 2");
  button1_3.setText("1 : 3");
  buttonStart.setText("Start");
  buttonRefill_1.setText("Refill");
  buttonRefill_2.setText("Refill");
  
  buttonTara.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  buttonVolInc.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  buttonVolDec.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  button1_1.setLocalColorScheme(GCScheme.BLUE_SCHEME);
  button1_15.setLocalColorScheme(GCScheme.BLUE_SCHEME);
  button1_2.setLocalColorScheme(GCScheme.BLUE_SCHEME);
  button1_2.setLocalColorScheme(GCScheme.BLUE_SCHEME);
  buttonStart.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  buttonRefill_1.setLocalColorScheme(GCScheme.RED_SCHEME);
  buttonRefill_2.setLocalColorScheme(GCScheme.RED_SCHEME);
  
  buttonTara.addEventHandler  (this, "buttonTara_click");
  buttonVolInc.addEventHandler(this, "buttonVolInc_click");
  buttonVolDec.addEventHandler(this, "buttonVolDec_click");
  button1_1.addEventHandler(this, "button1_1_click");
  button1_15.addEventHandler(this, "button1_15_click");
  button1_2.addEventHandler(this, "button1_2_click");
  button1_3.addEventHandler(this, "button1_3_click");
  buttonStart.addEventHandler (this, "buttonStart_click");
  buttonRefill_1.addEventHandler(this, "buttonRefill_1_click");
  buttonRefill_2.addEventHandler(this, "buttonRefill_2_click");
}