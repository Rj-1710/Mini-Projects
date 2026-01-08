package executions;
 
import inputs.Read;
import operations.Property;
 
public class PropertyExe {
	public void exection() {
	
		int ch;
		do {
			System.out.println("1. ADD PROPERTY DETAILS");
			System.out.println("2. CALCULATE PROPERTY TAX");
			System.out.println("3. DISPLAY ALL PROPERTIES");
			System.out.println("4. BACK TO MAIN MENU");
			Property p = new Property();
			ch = Read.input.nextInt();
			switch(ch) {
			case 1:
				p.add();
				break;
			case 2:
				p.display();
				System.out.print("ENTER THE PROPERTY ID TO CALCULATE TAX - ");
				int id = Read.input.nextInt();
				double result = p.calculatePTax(id);
				System.out.println("PROPERTY TAX FOR PROPERTY ID - "+id+" IS "+result);
				break;
			case 3:
				p.display();
				break;
			case 4:
				System.out.println("Returning to Main Menu-");
				break;
			default:
				System.err.println("Invalid Choice!");
			}
		}while(ch!=4);
	}
}