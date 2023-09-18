package cajero;

public class Cajero {
	
	   int saldoEnCuenta = 0;
	   String clave = "123";
	  
	  
	  public Cajero() {  
		}
			
	    
	    
		public Cajero(int saldoEnCuenta, String clave) { 
		this.saldoEnCuenta = saldoEnCuenta;
		this.clave = clave;
                }
		
		
		public int getSaldoEnCuenta() {
			return saldoEnCuenta;
		}
		public void setSaldoEnCuenta(int saldoEnCuenta) {
			this.saldoEnCuenta = saldoEnCuenta;
		}
		public String getClave() {
			return clave;
		}
		public void setClave(String clave) {
			this.clave = clave;
		}
	 
	    
	    
	    
	    
	    

}
