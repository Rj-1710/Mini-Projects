package executions;

import inputs.Read;
import operations.Vehicle;

public class VehicleExe {
	public void exection() {
		
		int ch;
		do {
			System.out.println("1. ADD VEHICLE DETAILS");
			System.out.println("2. CALCULATE VEHICLE TAX");
			System.out.println("3. DISPLAY ALL VEHICLES");
			System.out.println("4. BACK TO MAIN MENU");
			Vehicle v = new Vehicle();
			ch = Read.input.nextInt();
			switch(ch) {
			case 1:
				v.add();
				break;
			case 2:
				v.display();
				System.out.print("ENTER THE VEHCILE REGISTRATION NUMBER - ");
				int regNo = Read.input.nextInt();
				double result = v.calculateVTax(regNo);
				System.out.println("VEHICLE TAX FOR REGISTRATION NUMBER - "+regNo+" IS "+result);
				break;
			case 3:
				v.display();
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
