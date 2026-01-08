package operations;
 
import java.util.*;
import calculations.PropertyTax;
import inputs.Read;
import inputs.Template;
 
 
public class Property extends Template{
	private static int totalProperties = 0;
    private static double grandTotalPropertyTax = 0.00;

	static HashMap<Integer, PropertyTax> p = new HashMap<Integer, PropertyTax>(
			Map.of(
					1, new PropertyTax(1, 200, 15000.00, 3, 'N', 1800000.00),
					2, new PropertyTax(2, 80, 18000.00, 1, 'Y', 0.00),
					3, new PropertyTax(3, 150, 5000.00, 2, 'Y', 60000.00)	
					));
	static {
		totalProperties = p.size();
	}
	public void add() {
		System.out.println("ENTER PROPERTY DETAILS -");
		 System.out.print("ENTER PROPERTY ID - ");
		    int id = Read.input.nextInt();
		    if (p.containsKey(id)) {
		        System.out.println("ERROR: Property with ID " + id + " already exists!");
		        return;
		    }
		    else if(id<=0) {
		    	System.out.println("ID can't be "+id);
		    	return;
		    }

		    System.out.print("ENTER BASE VALUE OF LAND - ");
		    double price = Read.input.nextDouble();
		    if (price <= 0) {
		        System.out.println("ERROR: Base value of land must be a positive!\n");
		        return;
		    }

		    System.out.print("ENTER BUILD-UP AREA OF LAND - ");
		    int area = Read.input.nextInt();
		    if (area <= 0) {
		        System.out.println("ERROR: Area must be a positive!\n");
		        return;
		    }

		    System.out.print("ENTER AGE OF LAND IN YEARS - ");
		    int age = Read.input.nextInt();
		    if (age <= 0) {
		        System.out.println("ERROR: Age of construction must be a positive\n");
		        return;
		    }

		    System.out.print("IS LAND LOCATED IN CITY?(Y: YES, N: NO) - ");
		    char inCity = Character.toUpperCase(Read.input.next().charAt(0));
		    while (inCity != 'Y' && inCity != 'N') {
		        System.out.println("ERROR: Location must be 'Y' or 'N'\n");
		        return;
		    }

		    PropertyTax property = new PropertyTax(id, area, price, age, inCity, 0.00);
		    p.put(id, property);
		    totalProperties++;

		    System.out.println("New Property added successfully!");
	}

	public double calculatePTax(int id) {
	    PropertyTax pt = p.get(id);
	    double tax = 0.00;
	    if (pt != null) {
	        if (pt.getInCity() == 'Y'|| pt.getInCity() == 'y') {
	            tax = (pt.getArea() * pt.getAge() * pt.getPrice()) + (0.5 * pt.getArea());
	        }
	        else {
	            tax = pt.getArea() * pt.getAge() * pt.getPrice();
	        }
	        pt.setTax(tax);
	        grandTotalPropertyTax += tax;
	    }
	    else {
	        System.out.println("Property with ID " + id + " not found!");
	    }
	    return tax;
	}
 
	public void display() {
		if (p.isEmpty()) {
            System.out.println("NO PROPERTIES FOUND!!");
            return;
        }
		else {
			for (int id : p.keySet()) {
	            calculatePTax(id);
	        }
			header();
            for (int id : p.keySet()) {
                PropertyTax data = p.get(id);
                String row = """
                        %-5d %-15d %-15.2f %-12d %-10c %-15.2f
                        """.formatted(
                            data.getId(),
                            data.getArea(),
                            data.getPrice(),
                            data.getAge(),
                            data.getInCity(),
                            data.getTax()
                        );
           System.out.print(row);
            }
            footer();
        }
	}
	public static int getTotalProperties() {
        for (int id : p.keySet()) {
            if (p.get(id).getTax() == 0.00) {
                new Property().calculatePTax(id); 
            }
        }
        return totalProperties;
    }
	public static double getGrandTotalPropertyTax() {
        for (int id : p.keySet()) {
            if (p.get(id).getTax() == 0.00) {
                new Property().calculatePTax(id);
            }
        }
        return grandTotalPropertyTax;
    }

	@Override
	public void header() {
		String h1 ="""
				%s
				%-5s %-15s %-15s %-12s %-10s %-15s	
				%s
				""";
		System.out.print(h1.formatted("=".repeat(75),"ID","BUILD-UP AREA","BASE PRICE","AGE(YEARS)","IN CITY","PROPERTY TAX","=".repeat(75)));
	}
	@Override
	public void footer() {
		String f1 ="""
				%s
				""";
		System.out.print(f1.formatted("=".repeat(75)));
	}
}