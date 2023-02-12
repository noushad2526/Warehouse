# Warehouse
Spring MVC crud operations

WAREHOUSE

INTRODUCTION
Warehouse is a CRUD (Create, Read, Update, and Delete) application that demonstrates the use of
Core Java, Spring MVC, Hibernate, MySQL, JSPS, HTML, CSS, JavaScript, JQuery, and AJAX technologies.
This project focuses on implementing one-to-one and many-to-one mapping relationships between tables in the database.

The application allows users to add, update, and delete stores and their products, search and filter
products registered in the system, and perform all CRUD operations.

TECHNOLOGIES USED

  •	Core Java
  •	Spring MVC
  •	Hibernate
  •	MySQL
  •	Apache Tomcat
  •	HTML
  •	CSS
  •	JavaScript
  •	JSPs
  •	jQuery
  •	AJAX
  
FEATURES

  •	Registering a store and its products.
  •	Searching for registered products on the home page.
  •	Updating registered products.
  •	Deleting products if necessary.
  •	One-to-one and many-to-many mapping
  •	Spring MVC structure
  
ADDITIONAL DETAILS

The project covers essential features for building a running website, including search techniques, data
filtering without reload, validation checking with AJAX, and more. The code is written professionally
with attention to coding standards, including clear comments and descriptive variable names.

The project is structured with the following layers:
View Layer: Contains all the JSP pages, HTML, CSS, JavaScript, JQuery, and AJAX used for the front-end.
Controller Layer: Handles the incoming requests from the view layer and passes it to the service layer.
Service Layer: Contains all the business logic and communicates with the DAO layer to perform CRUD operations.
ServiceImpl Layer: Implements the service layer and performs the necessary operations.
DAO Layer: Contains the data access objects and communicates with the database to perform CRUD operations.

PREREQUISITES

•	Java (1.8 or higher)
•	Apache Tomcat (9.0 or higher)
•	MySQL (5.7 or higher)
•	Hibernate (5.4.12 or higher)
•	Spring MVC (5.1.9 or higher)
•	Maven (3.0 or higher)

INSTALLATION
1.	Clone the repository
    https://github.com/noushad2526/Warehouse.git
    
2.	Import the project in an IDE (e.g. Eclipse, IntelliJ)

3.	Set up the MySQL database:
    •	Create a new database named warehouse
    
4.	Update the database configuration in the 
    src/main/webapp/WEB-INF/views/spring-servlet.xml:
      <property name="driverClassName" value="com.mysql.jdbc.Driver" />
      <property name="url" value="jdbc:mysql://localhost:3306/warehouse" />
      <property name="username" value="your_mysql_username" />
      <property name="password" value="your_mysql_password" />
      
5.	Build the project using Maven:
    •	mvn clean install
    
6.	Deploy the generated .war file to Apache Tomcat

7.	Access the application in a web browser at http://localhost:8080/warehouse

CONTRIBUTION
Contributions are welcome! Please fork the repository, make your changes, and submit a pull request.

FEEDBACK
If you find this project helpful, please feel free to share your feedback in the comments section.
The developer appreciate any feedback and suggestions to improve the application.

Name: Noushad Alam
Contact Me: (+91) 9611262521
Email Id: noushad2526@gmail.com
