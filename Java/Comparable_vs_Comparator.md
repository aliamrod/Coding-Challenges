## Using Comparable Interface
A comparable object is capable of comparing itself with another object. The class itself must implement the `java.lang.Comparable` interface to compare its instances. 
Consider a Movie class that has members like, rating, name, year. Suppose we wish to sort a list of Movies based on year of release. We can implement the Comparable interface with the Movie
class, and we override [1] the method compareTo() of Comparable interface. 




```java
test

```

// A Java program to demonstrate use of Comparable
import java.io.*;
import java.util.*;

// A class 'Movie' that implements Comparable
class Movie implements Comparable<Movie>
{
	private double rating;
	private String name;
	private int year;

	// Used to sort movies by year
	public int compareTo(Movie m)
	{
		return this.year - m.year;
	}

	// Constructor
	public Movie(String nm, double rt, int yr)
	{
		this.name = nm;
		this.rating = rt;
		this.year = yr;
	}

	// Getter methods for accessing private data
	public double getRating() { return rating; }
	public String getName() { return name; }
	public int getYear()	 { return year; }
}

// Driver class
class Main
{
	public static void main(String[] args)
	{
		ArrayList<Movie> list = new ArrayList<Movie>();
		list.add(new Movie("Force Awakens", 8.3, 2015));
		list.add(new Movie("Star Wars", 8.7, 1977));
		list.add(new Movie("Empire Strikes Back", 8.8, 1980));
		list.add(new Movie("Return of the Jedi", 8.4, 1983));

		Collections.sort(list);

		System.out.println("Movies after sorting : ");
		for (Movie movie: list)
		{
			System.out.println(movie.getName() + " " +
							movie.getRating() + " " +
							movie.getYear());
		}
	}
}



[1] **Overriding = feature that allows a subclass or child class to provide a specific implementation of a method that is already proided by one of its super-classes or parent classes. When a method in a subclass has the same name, the same parameters or signature, and the same return type (or sub-type) as a method in its super-class, then the method in the subclass is said to _override_ the method in the super-class. 

![image](https://github.com/aliamrod/Coding-Challenges/assets/62684338/dbd7774c-1d4f-4297-ba7b-6114a9fefb51)

Method overriding is one of the ways by which Java achieves Run Time Polymorphism [2]. The version of a method that is executed will be determined by the object that is used to invoke it. If an object of a parent class is used to invoke the method, then the version in the parent class will be executed, but if an object of the subclass is used to invoke the method, then the version in the child class will be executed. In other words, it is the type of the object being referred to (not the type of the reference varaible) that determines which version of an overriden method will be executed. 

Example of Method Overriding in Java:
```java
//Java program to demonstrate method overriding in Java
//Base Class
class Parent {
	void show() { System.out.println("Parent's show()"); }
}

//Inherited Class
class Child extends Parent {
	// This method overrides show() of Parent
	@Override void show()
	{
		System.out.println("Child's show()");
	}
}


//Driver class
class Main {
	public static void main(String[] args)
	{
		// If a Parent type reference refers to a Parent object, then Parent's show is called
		Parent obj1 = new Parent();
		obj1.show();

		// If a Parent type reference refers to a Child object Child's show() is called. This is called RUN TIME POLYMORPHISM
		Parent obj2 = new Child();
		obj2.show();
	}
}
```
