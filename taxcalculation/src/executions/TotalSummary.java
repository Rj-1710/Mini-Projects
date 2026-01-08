package executions;

import operations.Property;
import operations.Vehicle;

public class TotalSummary {
	public void display() {
		
		int propCount = Property.getTotalProperties();
        double propTax = Property.getGrandTotalPropertyTax();
        
        int vehicleCount = Vehicle.getTotalVehicles();
        double vehicleTax = Vehicle.getGrandTotalTax();
        
        String horizontalLine = "-----------------------------------------------------------------------";
        
        System.out.println("+" + horizontalLine + "+");
        String header = String.format("| %-10s  %-20s  %-20s  %-14s|",
                                     "SR. NO.", "PARTICULAR", "QUANTITY", "TAX");
        System.out.println(header);
        System.out.println("+" + horizontalLine + "+");
        
        int totalQuantity = propCount + vehicleCount;
        double totalTax = propTax + vehicleTax;
        
        String propRow = String.format("| %-10d  %-20s  %-20d  %-14.2f|",
                1, "PROPERTIES", propCount, propTax);
        System.out.println(propRow);
 
        String vehicleRow = String.format("| %-10d  %-20s  %-20d  %-14.2f|",
                   2, "VEHICLES", vehicleCount, vehicleTax);
        System.out.println(vehicleRow);
        
        System.out.println("+" + horizontalLine + "+");
        
        String totalRow = String.format("| %-10s  %-20s  %-20d  %-14.2f|",
                "TOTAL", "----------", totalQuantity, totalTax);
        System.out.println(totalRow);
        
        System.out.println("+" + horizontalLine + "+");
	}
}
