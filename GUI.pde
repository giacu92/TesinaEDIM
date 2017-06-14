/////////
// GUI //
/////////

// Events:
public void buttonTara_click(GButton source, GEvent event)
{
  //println("Tara clicked");
  println(nf(serbatoio1.pour(3), 1, 2));
  println(nf(serbatoio2.pour(5), 1, 2));
}
public void buttonVolInc_click(GButton source, GEvent event)
{
  println("Volume Increase clicked");
}
public void buttonVolDec_click(GButton source, GEvent event)
{
  println("Volume Decrease clicked");
}

// Variable declatations
GButton buttonTara;    //serve a fissare il peso del contenitore con la tara.
GButton buttonVolInc;  //serve ad aumentare il volume totale della crema
GButton buttonVolDec;  //serve a  diminuire il volume totale della crema


// Create all the GUI controls.
public void createGUI()
{
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Tesina EDIM 2017 - Giacomo Mammarella");
  
  //                               X    Y    W    H
  buttonTara   = new GButton(this, 30,  30,  80,  80 );
  buttonVolInc = new GButton(this, 120, 25,  80,  40 );
  buttonVolDec = new GButton(this, 120, 75,  80,  40 );
  
  buttonTara.setFont  (new Font("Comic Sans MS", Font.PLAIN, 14));
  buttonVolInc.setFont(new Font("Comic Sans MS", Font.PLAIN, 23));
  buttonVolDec.setFont(new Font("Comic Sans MS", Font.PLAIN, 23));
  buttonTara.setTextBold();
  //buttonVolInc.setTextBold();
  //buttonVolDec.setTextBold();
  
  buttonTara.setText("TARA");
  buttonVolInc.setText("+");
  buttonVolDec.setText("-");
  
  buttonTara.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  buttonVolInc.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  buttonVolDec.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  
  buttonTara.addEventHandler  (this, "buttonTara_click");
  buttonVolInc.addEventHandler(this, "buttonVolInc_click");
  buttonVolDec.addEventHandler(this, "buttonVolInc_click");
}