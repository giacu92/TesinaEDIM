/////////
// GUI //
/////////

// Events:

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
  println("Volume Increase clicked");
}

/**  Diminuisce volume totale:
*  Diminuisce di una unità la quantità di crema totale richiesta.
*/
public void buttonVolDec_click(GButton source, GEvent event)
{
  println("Volume Decrease clicked");
}

/**  Inizia la procedura di miscelazione:
*  Diminuisce di una unità la quantità di crema totale richiesta.
*/
public void buttonStart_click(GButton source, GEvent event)
{
  println("Start clicked");
  
  //calcolo i volumi da miscelare ed erogo.
  if(serbatoio1.pour(1))
  {
    if(serbatoio2.pour(20))
    {
      // erogazione da entrambi i serbatoi...
      
    }
    else
    {
      serbatoioError = "Quantità di " + serbatoio2.getName() + " non sufficiente";
      serbatoio1.refill(1);
    }
  }
  else  serbatoioError = "Quantità di " + serbatoio1.getName() + " non sufficiente";
}

// Variable declatations
GButton buttonTara;    //serve a fissare il peso del contenitore con la tara.
GButton buttonVolInc;  //serve ad aumentare il volume totale della crema
GButton buttonVolDec;  //serve a  diminuire il volume totale della crema
GButton button1_1, button1_15, button1_2, button1_3;
GButton buttonStart;   //avvia l'erogazione

// Create all the GUI controls.
public void createGUI()
{
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Tesina EDIM 2017 - Giacomo Mammarella");
  
  //Buttons                        X    Y    W    H
  buttonTara   = new GButton(this, 30,  30,  100, 100);
  buttonVolInc = new GButton(this, 140, 30,  80,  45 );
  buttonVolDec = new GButton(this, 140, 85,  80,  45 );
  button1_1    = new GButton(this, 30,  150, 140, 50 );
  button1_15   = new GButton(this, 230, 150, 140, 50 );
  button1_2    = new GButton(this, 430, 150, 140, 50 );
  button1_3    = new GButton(this, 630, 150, 140, 50 );
  buttonStart  = new GButton(this, 430, 230, 340, 80);
  
  
  buttonTara.setFont  (new Font("Helvetica-Bold", Font.BOLD, 18));
  buttonVolInc.setFont(new Font("Helvetica-Bold", Font.PLAIN, 22));
  buttonVolDec.setFont(new Font("Helvetica-Bold", Font.PLAIN, 22));
  button1_1.setFont   (new Font("Helvetica-Bold", Font.PLAIN, 22));
  button1_15.setFont  (new Font("Helvetica-Bold", Font.PLAIN, 22));
  button1_2.setFont   (new Font("Helvetica-Bold", Font.PLAIN, 22));
  button1_3.setFont   (new Font("Helvetica-Bold", Font.PLAIN, 22));
  buttonStart.setFont (new Font("Helvetica-Bold", Font.PLAIN, 22));
  
  buttonTara.setTextBold();
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
  
  buttonTara.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  buttonVolInc.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  buttonVolDec.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  buttonStart.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  
  buttonTara.addEventHandler  (this, "buttonTara_click");
  buttonVolInc.addEventHandler(this, "buttonVolInc_click");
  buttonVolDec.addEventHandler(this, "buttonVolInc_click");
  buttonStart.addEventHandler (this, "buttonStart_click");
}