void aggiornaInterfaccia()
{
  //Testo DILUIZIONE:
  textSize(18);
  text("Diluizione:", 30, 180);
  
  //Testo Log Macchina                            W    H
  PGraphics finestraLogMacchina = createGraphics(500, 200);
  finestraLogMacchina.beginDraw();
    finestraLogMacchina.textSize(16);
    finestraLogMacchina.background(g.backgroundColor);
    finestraLogMacchina.text("Quantità da miscelare ml:", 10, 15);
    finestraLogMacchina.text("Diluizione: 1:" + nf(diluizione, 0, 0), 10, 40);
    finestraLogMacchina.text(serbatoioError, 10, 65);
    finestraLogMacchina.text(clientiError, 10, 90);
  finestraLogMacchina.endDraw();
  image(finestraLogMacchina, 270, 30);
  
  //Dati utente, salvataggio e richiamo          W    H
  PGraphics finestraDatiUtente = createGraphics(500, 200);
  finestraDatiUtente.beginDraw();
    finestraDatiUtente.textSize(16);
    finestraDatiUtente.background(g.backgroundColor);
    finestraDatiUtente.text("Cliente:", 10, 15);
    finestraDatiUtente.text("Nome:", 10, 40);
    finestraDatiUtente.text("Cognome:", 10, 65);
    finestraDatiUtente.text("Cellulare:", 10, 90);
    finestraDatiUtente.endDraw();
  image(finestraDatiUtente, 270, 280);
  
  //Coloro la diluizione selezionata:
  if (diluizione == 1)
  {
    button1_1.setLocalColorScheme(GCScheme.GREEN_SCHEME);
    button1_15.setLocalColorScheme(GCScheme.BLUE_SCHEME);
    button1_2.setLocalColorScheme(GCScheme.BLUE_SCHEME);
    button1_3.setLocalColorScheme(GCScheme.BLUE_SCHEME);
  }
  else if (diluizione == 1.5)
  {
    button1_1.setLocalColorScheme(GCScheme.BLUE_SCHEME);
    button1_15.setLocalColorScheme(GCScheme.GREEN_SCHEME);
    button1_2.setLocalColorScheme(GCScheme.BLUE_SCHEME);
    button1_3.setLocalColorScheme(GCScheme.BLUE_SCHEME);
  }
  else if (diluizione == 2)
  {
    button1_1.setLocalColorScheme(GCScheme.BLUE_SCHEME);
    button1_15.setLocalColorScheme(GCScheme.BLUE_SCHEME);
    button1_2.setLocalColorScheme(GCScheme.GREEN_SCHEME);
    button1_3.setLocalColorScheme(GCScheme.BLUE_SCHEME);
  }
  else if (diluizione == 3)
  {
    button1_1.setLocalColorScheme(GCScheme.BLUE_SCHEME);
    button1_15.setLocalColorScheme(GCScheme.BLUE_SCHEME);
    button1_2.setLocalColorScheme(GCScheme.BLUE_SCHEME);
    button1_3.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  }
  
  
  image(logoUnivaq, 610, 30, width/12, height/6);
  image(logoR13, 700, 30, width/12, height/6);
  
  //Serbatoi:
  image(serbatoio1.drawVolume(), 30,  260);
  image(serbatoio2.drawVolume(), 150, 260);
  
  if (serbatoio1.getPercentage() < 20 && serbatoio1.getPercentage() > serbatoio1.getToll_perc())
  {
    //Segnalo serbatoio1 quasi esaurito tramite accensione led
    GPIO.digitalWrite(4, GPIO.HIGH);
    //serbatoioError = "Serbatoio " + serbatoio1.getName() + " quasi esaurito";
  }
  else if (serbatoio2.getPercentage() < 20 && serbatoio2.getPercentage() > serbatoio2.getToll_perc())
  {
    //Segnalo serbatoio2 quasi esaurito tramite accensione led
    GPIO.digitalWrite(5, GPIO.HIGH);
    //serbatoioError = "Serbatoio " + serbatoio2.getName() + " quasi esaurito";
  }
  else 
  {
    GPIO.digitalWrite(4, GPIO.LOW);
    GPIO.digitalWrite(5, GPIO.LOW);
    //serbatoioError = "";
  }
}