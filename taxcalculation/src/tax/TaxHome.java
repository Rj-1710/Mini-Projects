package tax;
 
import executions.*;
import inputs.*;


public class TaxHome {
	
	public static void main(String args[]) throws Exception {
		System.out.println("+----------------------------------+");
		System.out.println("|  WELCOME TO TAX CALCULATION APP  |");
		System.out.println("+----------------------------------+");
		System.out.println("PLEASE LOGIN TO CONTINUE - ");
		System.out.print("USERNAME - ");
		String user = Read.input.next();
		System.out.print("PASSWORD - ");
		String pass = Read.input.next();
		System.out.println();
		if(user.equals("admin") && pass.equals("admin123")) {
			int choice =4;
			do {
				System.out.println("1. PROPERTY TAX");
				System.out.println("2. VEHICLE TAX");
				System.out.println("3. TOTAL");
				System.out.println("4. EXIT");
				choice = Read.input.nextInt();
				switch(choice) {
				case 1:
					PropertyExe pe = new PropertyExe();
					pe.exection();
					break;
				case 2:
					VehicleExe ve = new VehicleExe();
					ve.exection();
					break;
				case 3:
					TotalSummary ts = new TotalSummary();
					ts.display();
					break;
				case 4:
					System.out.println("THANKS VISIT AGAIN.");
					break;
				default:
					System.out.println("Enter Correct Choice");
					break;
				}
			}while(choice!=4);
		}
		else {
			throw new Exception("Invalid Credentials");
		}
	}
}
 