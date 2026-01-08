package calculations;
 
public class PropertyTax {
	private int id;
	private int area;
	private double price;
	private int age;
	private char inCity;
	private double tax;
	
 
	public PropertyTax(int id, int area, double price, int age, Character inCity, double tax) {
		super();
		this.id = id;
		this.area = area;
		this.price = price;
		this.age = age;
		this.inCity = inCity;
		this.tax = tax;
	}
	
	public PropertyTax(int id) {
		this.id = id;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getArea() {
		return area;
	}
	public void setArea(int area) {
		this.area = area;
	}
	public double getPrice() {
		return price;
	}
	 public void setPrice(double price) {
	        if (price <= 0) throw new IllegalArgumentException("Base value must be positive.");
	        this.price = price;
	    }
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
        if (age <= 0) throw new IllegalArgumentException("Age must be positive.");
        this.age = age;
    }
	public char getInCity() {
		return inCity;
	}
	public void setInCity(char inCity) {
        char normalized = Character.toUpperCase(inCity);
        if (normalized != 'Y' && normalized != 'N') {
            throw new IllegalArgumentException("Location must be Y or N.");
        }
        this.inCity = normalized;
    }
	public double getTax() {
		return tax;
	}
	public void setTax(double tax) {
        this.tax = Math.round(tax * 100.0) / 100.0; 
    }
	
}