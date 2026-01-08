package operations;
 
import java.util.*;
import calculations.VehicleTax;
import inputs.Read;
import inputs.Template;
 
public class Vehicle extends Template {
	
	private static int totalVehicles = 0;
	private static double grandTotalVehicleTax = 0.00;
	
	static Map<Integer, VehicleTax> v = new HashMap<>(
		    Map.of(
		        1710, new VehicleTax(1710,"Tesla",250,4,"Diesel",1500000.00,0.00),
		        1901, new VehicleTax(1901,"Suzuki",130,4,"Petrol",600000.00,0.00),
		        2322, new VehicleTax(2322, "Tata Nexon", 175, 5, "Petrol", 9500000.00,0.00)
		    ));
	static {
		totalVehicles = v.size();
	}
	public void add() {
		
		System.out.print("ENTER THE VEHICLE REGISTRATION NUMBER - ");
	    String regNoS = Read.input.next();
	    
	    if (!regNoS.matches("^(?!0000)\\d{4}$")) {
	        System.out.println("ERROR: Invalid Registration Number.\n");
	        return;
	    }
	    int regNo = Integer.parseInt(regNoS);
	    
	    if (v.containsKey(regNo)) {
	        System.out.println("ERROR: Vehicle with registration number " + regNo + " already exists!\n");
	        return;
	    }

	    System.out.print("ENTER BRAND OF THE VEHICLE - ");
	    String brand = Read.input.next();

	    if (brand == null || brand.trim().isEmpty() || brand.matches("\\d+")) {
	        System.out.println("ERROR: Brand must be a valid text.\n");
	        return;
	    }

	    System.out.print("ENTER THE MAXIMUM VELOCITY OF THE VEHICLE(KMPH) - ");
	    int maxVelocity = Read.input.nextInt();

	    if (maxVelocity < 120 || maxVelocity > 300) {
	        System.out.println("ERROR: Maximum velocity must be between 120 and 300 kmph.\n");
	        return;
	    }

	    System.out.print("ENTER CAPACITY (NUMBER OF SEATS OF THE VEHICLE) - ");
	    int seats = Read.input.nextInt();

	    if (seats < 2 || seats > 50) {
	        System.out.println("ERROR: Capacity must be between 2 and 50 seats.\n");
	        return;
	    }

	    System.out.println("CHOOSE THE TYPE OF THE VEHICLE - ");
	    System.out.println("1. PETROL DRIVEN");
	    System.out.println("2. DIESEL DRIVEN");
	    System.out.println("3. CNG/LPG DRIVEN");
	    int choice = Read.input.nextInt();
	    String type;
	    if (choice == 1) {
	        type = "PETROL";
	    } 
	    else if (choice == 2) {
	        type = "DIESEL";
	    } 
	    else if (choice == 3) {
	        type = "CNG/LPG";
	    } 
	    else {
	        System.out.println("ERROR: Invalid choice. Must be 1 or 2 or 3.\n");
	        return;
	    }

	    System.out.print("ENTER THE PURCHASE COST OF THE VEHICLE - ");
	    double cost = Read.input.nextDouble();

	    if (cost < 50000 || cost > 1000000) {
	        System.out.println("ERROR: Purchase cost must be between INR 50,000 and INR 1,000,000.\n");
	        return;
	    }
		
		VehicleTax vt = new VehicleTax(regNo,brand,maxVelocity,seats,type,cost,0.00);
		v.put(regNo, vt);
		totalVehicles++;
		
		System.out.println("NEW VEHICLE INSERTED");
	}
	
	public double calculateVTax(int regNo) {
	    VehicleTax vt = v.get(regNo);
	    double tax = 0.00;
 
	    if (vt != null) {
	    	
	    	if (vt.getVtax() > 0.00) {
	            return vt.getVtax();
	        }
	    	
	        if(vt.getType().equalsIgnoreCase("Petrol")){
	        	 tax = vt.getMaxVelocity() + vt.getSeats() + (0.10 * vt.getCost());
	        }
	        else if(vt.getType().equalsIgnoreCase("Diesel")){
	        	 tax = vt.getMaxVelocity() + vt.getSeats() + (0.11 * vt.getCost());
	        }
	        else  if(vt.getType().equalsIgnoreCase("CNG/LPG")){
	        	 tax = vt.getMaxVelocity() + vt.getSeats() + (0.12 * vt.getCost());
	        }
//	        else {
//	        	System.out.println("Type is UNKNOWN, Tax can't be calculated for "+regNo);
//	        }
	    }
	    else {
	        System.out.println("Vehicle with Registration Number " + regNo + " not found!");
	    }
	    return tax;
	}
	
	public void display() {
		if (v.isEmpty()) {
            System.out.println("NO VEHICLES FOUND!!");
            return;
        }
		else {
			for (int id : v.keySet()) {
	            calculateVTax(id);
	        }
 
			header();
            for (int id : v.keySet()) {
                VehicleTax data = v.get(id);
                String row = """
                        %-20s %-15s %-15d %-15d %-15s %-15.2f %-15.2f
                        """.formatted(
                            String.format("%04d", data.getRegNo()),
                            data.getBrand(),
                            data.getMaxVelocity(),
                            data.getSeats(),
                            data.getType(),
                            data.getCost(),
                            data.getVtax()
                        );
 
           System.out.print(row);
        		
            }
            footer();
        }
	}
	
	public static int getTotalVehicles() {
        for (int id : v.keySet()) {
            if (v.get(id).getVtax() == 0.00) {
                new Vehicle().calculateVTax(id);
            }
        }
        return totalVehicles;
    }
	
	public static double getGrandTotalTax() {
        // Ensure initial tax is calculated before returning total
        for (int id : v.keySet()) {
            if (v.get(id).getVtax() == 0.00) {
                new Vehicle().calculateVTax(id);
            }
        }
        return grandTotalVehicleTax;
    }	
 
	@Override
	public void header() {
		String h1 ="""
				%s
				%-20s %-10s %-15s %-15s %-15s %-15s %-15s
				%s
				""";
		System.out.print(h1.formatted("=".repeat(110),"REGISTRATION NO.","BRAND","MAX. VELOCITY","NO. OF SEATS","VEHICLE TYPE","PURCHASE COST","VEHICLE TAX","=".repeat(110)));
		
	}
 
	@Override
	public void footer() {
		String f1 ="""
				%s
				""";
		System.out.print(f1.formatted("=".repeat(110)));
		
	}
 
}