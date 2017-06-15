void caricaParametri()
{
  String riga = "";
  String[] parametri;
  BufferedReader reader;
  
  /////////////////////////////////////////////////////
  // Carico i parametri Base dal file configSerbatoi //
  /////////////////////////////////////////////////////
  try
  {
    reader = createReader(dataPath("configSerbatoi.csv"));
    
    //leggo la riga dell'intestazione e NON la uso.. "name,maxVolume,currentVolume"
    try {riga = reader.readLine();} catch (IOException e) {e.printStackTrace();}
  
    //carico la riga con i parametri per il serbatoio 1:
    try {riga = reader.readLine();} catch (IOException e) {e.printStackTrace();}
    parametri = split(riga, ',');  //(name[0],maxVolume[1],currentVolume[2])
    serbatoio1 = new Serbatoio(parametri[0], float(parametri[1]), 120, 160, c1);
    serbatoio1.setVolume(float(parametri[2]));
    
    //carico la riga con i parametri per il serbatoio 2:
    try {riga = reader.readLine();} catch (IOException e) {e.printStackTrace();}
    parametri = split(riga, ',');  //(name[0],maxVolume[1],currentVolume[2])
    serbatoio2 = new Serbatoio(parametri[0], float(parametri[1]), 120, 160, c2);
    serbatoio2.setVolume(float(parametri[2]));
  }
  catch (Exception e)
  {
    //segnalo l'errore e carico i parametri di default:
    e.printStackTrace();
    println("file configSerbatoi.csv inaccessibile. Parametri caricati di default");
    serbatoio1 = new Serbatoio("S1", 100, 120, 160, c1); // nome, volume, Width, Height, colore
    serbatoio2 = new Serbatoio("S2", 100, 120, 160, c2);
    
    //creo il file per la prossima volta:
    PrintWriter output;
    output = createWriter(dataPath("configSerbatoi.csv"));
    output.println("name,maxVolume,currentVolume");
    output.println("S1,100,100");
    output.println("S2,100,100");
    output.flush();
    output.close();
  }
}