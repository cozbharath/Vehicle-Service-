# Vehicle Service Management System

A Java-based application for managing vehicle services, maintenance schedules, and service records using JDBC and Servlets.

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Technologies](#technologies)
- [Installation](#installation)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Database](#database)
- [Running the Application](#running-the-application)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## 🎯 Overview

The Vehicle Service Management System is a Java web application designed to streamline vehicle maintenance operations. It helps track vehicle services, manage schedules, record maintenance history, and generate reports for service centers and vehicle owners. Built with JDBC for database operations and Servlets for web request handling.

## ✨ Features

- **Vehicle Management**: Register and manage vehicle details
- **Service Scheduling**: Schedule regular maintenance and services
- **Service Records**: Maintain comprehensive service history
- **Cost Tracking**: Monitor service costs and expenses
- **Reports Generation**: Generate service history and maintenance reports
- **Customer Management**: Track vehicle owners and service preferences
- **User Authentication**: Basic login system for service personnel

## 🛠️ Technologies

- **Language**: Java
- **Web Framework**: Servlets & JSP
- **Database**: JDBC with MySQL/PostgreSQL
- **Server**: Apache Tomcat
- **Version Control**: Git

## 📦 Installation

### Prerequisites

- Java 8 or higher
- Apache Tomcat 8.0+
- MySQL or PostgreSQL
- Git

### Steps

1. **Clone the Repository**
```bash
git clone https://github.com/cozbharath/Vehicle-Service-.git
cd Vehicle-Service-
```

2. **Setup Database**
- Create a new database:
```sql
CREATE DATABASE vehicle_service;
```
- Import the schema from `database/schema.sql`:
```bash
mysql -u root -p vehicle_service < database/schema.sql
```

3. **Configure Database Connection**
- Update `src/DBConfig.java` with your database credentials:
```java
public class DBConfig {
    public static final String DB_URL = "jdbc:mysql://localhost:3306/vehicle_service";
    public static final String DB_USER = "root";
    public static final String DB_PASSWORD = "your_password";
    public static final String DB_DRIVER = "com.mysql.cj.jdbc.Driver";
}
```

4. **Compile Java Files**
```bash
# Compile all Java files
javac -d bin src/**/*.java

# Ensure MySQL JDBC driver is in classpath
```

5. **Deploy to Tomcat**
- Copy compiled files to Tomcat webapp directory:
```bash
cp -r bin/com <TOMCAT_HOME>/webapps/vehicleservice/WEB-INF/classes/
cp -r web/* <TOMCAT_HOME>/webapps/vehicleservice/
```

6. **Start Tomcat**
```bash
<TOMCAT_HOME>/bin/startup.sh
```

7. **Access the Application**
```
http://localhost:8080/vehicleservice
```

## 🚀 Usage

### Basic Workflow

1. Login to the application with service personnel credentials
2. Register new vehicles with owner information
3. Schedule maintenance based on service intervals
4. Record completed services with details and costs
5. View service history and generate reports
6. Manage customer information

### Key Pages

- **Login Page**: `login.jsp` - User authentication
- **Dashboard**: `dashboard.jsp` - Main interface
- **Vehicle List**: `vehicles.jsp` - View all vehicles
- **Add Vehicle**: `add-vehicle.jsp` - Register new vehicle
- **Service Records**: `services.jsp` - View service history
- **Reports**: `reports.jsp` - Generate reports

## 📂 Project Structure

```
Vehicle-Service-/
├── src/
│   ├── DBConfig.java              # Database configuration
│   ├── servlets/
│   │   ├── LoginServlet.java
│   │   ├── VehicleServlet.java
│   │   ├── ServiceServlet.java
│   │   ├── ReportServlet.java
│   │   └── LogoutServlet.java
│   ├── models/
│   │   ├── Vehicle.java
│   │   ├── Owner.java
│   │   ├── Service.java
│   │   └── User.java
│   ├── dao/
│   │   ├── VehicleDAO.java
│   │   ├── ServiceDAO.java
│   │   ├── OwnerDAO.java
│   │   └── UserDAO.java
│   └── util/
│       └── ConnectionPool.java
├── web/
│   ├── WEB-INF/
│   │   └── web.xml
│   ├── login.jsp
│   ├── dashboard.jsp
│   ├── vehicles.jsp
│   ├── add-vehicle.jsp
│   ├── services.jsp
│   ├── reports.jsp
│   ├── css/
│   │   └── style.css
│   └── js/
│       └── script.js
├── database/
│   └── schema.sql
├── lib/
│   └── mysql-connector-java-8.0.jar  # MySQL JDBC Driver
└── README.md
```

## 🗄️ Database

### Schema Overview

**Tables**:
- **users**: Login credentials for service personnel
- **vehicles**: Vehicle information
- **owners**: Customer/owner details
- **services**: Service records and history
- **service_types**: Types of services offered
- **costs**: Service cost tracking

### Initialize Database

```bash
mysql -u root -p vehicle_service < database/schema.sql
```

### Sample Schema

```sql
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    role VARCHAR(20)
);

CREATE TABLE vehicles (
    vehicle_id INT PRIMARY KEY AUTO_INCREMENT,
    owner_id INT NOT NULL,
    make VARCHAR(50),
    model VARCHAR(50),
    year INT,
    license_plate VARCHAR(20),
    FOREIGN KEY (owner_id) REFERENCES owners(owner_id)
);

CREATE TABLE services (
    service_id INT PRIMARY KEY AUTO_INCREMENT,
    vehicle_id INT NOT NULL,
    service_date DATETIME,
    service_type VARCHAR(100),
    cost DECIMAL(10, 2),
    description TEXT,
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id)
);
```

## 🔧 Running the Application

### Method 1: Using Tomcat Server
```bash
# Start Tomcat
<TOMCAT_HOME>/bin/startup.sh

# Stop Tomcat
<TOMCAT_HOME>/bin/shutdown.sh
```

### Method 2: Using IDE (Eclipse/IntelliJ)
1. Import project as Dynamic Web Project
2. Configure Tomcat runtime
3. Add project to Tomcat server
4. Run on server

### Access Points
- **Home**: http://localhost:8080/vehicleservice
- **Login**: http://localhost:8080/vehicleservice/login.jsp

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 📞 Contact

**Author**: Navabharath Podila  
**GitHub**: [@cozbharath](https://github.com/cozbharath)  
**Repository**: [Vehicle-Service-](https://github.com/cozbharath/Vehicle-Service-)

For questions, issues, or suggestions, please open an issue on the GitHub repository.

---

**Last Updated**: June 2026  
**Version**: 1.0.0
