package calculations;
 
public class VehicleTax {
	private int regNo;
	private String brand;
	private int maxVelocity;
	private int seats;
	private String type;
	private double cost;
	private double vtax;
	
	
	
	public VehicleTax(int regNo, String brand, int maxVelocity, int seats, String type, double cost, double vtax) {
		super();
		this.regNo = regNo;
		this.brand = brand;
		this.maxVelocity = maxVelocity;
		this.seats = seats;
		this.type = type;
		this.cost = cost;
		this.vtax = vtax;
	}
	
	
	public long getRegNo() {
		return regNo;
	}
	public void setRegNo(int regNo) {
		if(regNo>0000 && regNo<=9999) {
			this.regNo = regNo;
		}
		else {
			throw new IllegalArgumentException("Registration number can not be "+regNo +"It should be between 0001 to 9999");
		}
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public int getMaxVelocity() {
		return maxVelocity;
	}
	public void setMaxVelocity(int maxVelocity) {
		this.maxVelocity = maxVelocity;
	}
	public int getSeats() {
		return seats;
	}
	public void setSeats(int seats) {
		this.seats = seats;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public double getCost() {
		return cost;
	}
	public void setCost(double cost) {
		this.cost = cost;
	}
	public double getVtax() {
		return vtax;
	}
	public void setVtax(double vtax) {
		this.vtax = vtax;
	}
	
	
}
