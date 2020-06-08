package beans;

public class BasicEgg {

	public BasicEgg(String color, int quality) {
		this.color = color;
		this.quality = quality;
	}

	public BasicEgg() {
	}

	private String color = "";
	private int quality = 0;
	private String message = "";

	public String getMessage() {
		return message;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public int getQuality() {
		return quality;
	}

	public void setQuality(int quality) {
		this.quality = quality;
	}

	public boolean validate() {
		
		if(color.length() == 0) {
			message = "Please enter a valid color";
			return false;
		}

		if (color.equals("orange")) {
			message = "Eggs cannot be orange";
			return false;
		} 
		
		if (quality > 10 || quality < 0) {
			message = "Quality is between 0 -> 10";
			return false;
		} 

		return true;
	}
	
	public String getInfo() {
		return "I AM AN EGG";
	}

}
