class Cliente
{
  // Attributi:
  String name;
  String surname;
  String cellphone;
  float  quantity;
  float  diluition;
  
  // Costruttore:
  /**
  *  Inizializza un cliente.
  *  @param _name      il nome del cliente.
  *  @param _surname   il cognome del cliente.
  *  @param _cellphone il numero di cellulare.
  *  @param _quantity  quantità impostata per il cliente.
  *  @param _diluition diluizione impostata per il cliente.
  */
  Cliente(String _name, String _surname, String _cellphone, float _quantity, float _diluition)
  {
    this.name      = _name;
    this.surname   = _surname;
    this.cellphone = _cellphone;
    this.quantity  = _quantity;
    this.diluition = _diluition;
  }
  
  String toString()
  {
    return(  name + "," + surname + "," + cellphone + "," + 
      str(quantity) + "," + str(diluition));
  }
}