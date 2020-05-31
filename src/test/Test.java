package test;

import beans.BasicEgg;

public class Test {
	
	public static void main(String[] args) {
		BasicEgg eggo = new BasicEgg("orange", 4);
		
		if(eggo.validate()) {
			System.out.println("Egg is valid!");
		} else {
			System.out.println(eggo.getMessage());
		}
		
	}

}
