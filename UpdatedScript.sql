/*id primary key? in all tables*/
CREATE TABLE `facility` (
  `Facility_Id` int(10) NOT NULL AUTO_INCREMENT,
  `Facility_Identification_Number` varchar(10) DEFAULT NULL,
  `Facility_Name` varchar(30) DEFAULT NULL,
  `Facility_Phone` varchar(15) DEFAULT NULL,
  `Facility_Emergency_Phone` varchar(15) DEFAULT NULL,
  `Facility_On_Call_Number` varchar(15) DEFAULT NULL,
  `Facility_Form_Details` varchar(10) DEFAULT NULL,
  `Facility_Start_Date` date DEFAULT NULL, 
  `Facility_End_Date` date DEFAULT NULL,
  `Facility_Expiry_Date` date DEFAULT NULL,/* date or datetime*/
  `Facility_Street` varchar(25) DEFAULT NULL,
  `Facility_City` varchar(10) DEFAULT NULL,
  `Facility_State` varchar(10) DEFAULT NULL,
  `Facility_Zip` varchar(20) DEFAULT NULL,
  `Facility_Mailing_Address` varchar(30) DEFAULT NULL,
  `Facility_Latitude` varchar(10) DEFAULT NULL,
  `Facility_Longitude` varchar(10) DEFAULT NULL,
  `Facility_24_7` boolean DEFAULT 0,
  `Facility_Capacity` int DEFAULT NULL,
  `Facility_Email` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Facility_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `services` (
  `Service_Id` int(10) NOT NULL AUTO_INCREMENT,
  `Service_Name` varchar(30) DEFAULT NULL,
  `Service_Category` varchar(30) DEFAULT NULL,
  `Service_Description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Service_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `facility_dynamic_attributes` (
  `Tag_Id` int(10) DEFAULT NULL, /*not a PK?*/
  `Tag_Name` varchar(30) DEFAULT NULL,
  `Tag_Description` varchar(50) DEFAULT NULL,
  `Facility_Id` int(10) DEFAULT NULL,
  KEY `Facility_Id` (`Facility_Id`),
  CONSTRAINT `facility_dynamic_attributes_ibfk_1` FOREIGN KEY (`Facility_Id`) REFERENCES `facility` (`Facility_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `facility_services` (
  `Facility_Service_Id` int(10) NOT NULL AUTO_INCREMENT,
  `Service_Start_Date` date DEFAULT NULL,
  `Service_End_Date` date DEFAULT NULL,
  `Service_Bed_Availability` int DEFAULT NULL,
  `Service_Seat_Availability` int DEFAULT NULL,
  `Service_Room_Availability` int DEFAULT NULL,
  `Facility_Id` int(10) DEFAULT NULL,
  `Services_Id` int(10) DEFAULT NULL,
  PRIMARY KEY (`Facility_Service_Id`),
  KEY `Facility_Id` (`Facility_Id`),
  KEY `Services_Id` (`Services_Id`),
  CONSTRAINT `facility_services_ibfk_1` FOREIGN KEY (`Facility_Id`) REFERENCES `facility` (`Facility_Id`),
  CONSTRAINT `facility_services_ibfk_2` FOREIGN KEY (`Services_Id`) REFERENCES `services` (`Service_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `facility_forms` ( /*need to make some filds not null*/
  `Form_Id` int(10) NOT NULL AUTO_INCREMENT,
  `Form_Name` varchar(30) DEFAULT NULL,
  `Form_Description` varchar(50) DEFAULT NULL,
  `Form_Path` varchar(50) DEFAULT NULL,
  `Facility_Id` int(10) DEFAULT NULL,
  `Facility_Service_Id` int(10) DEFAULT NULL,
  PRIMARY KEY (`Form_Id`),
  KEY `Facility_Id` (`Facility_Id`),
  KEY `Facility_Service_Id` (`Facility_Service_Id`),
  CONSTRAINT `facility_forms_ibfk_1` FOREIGN KEY (`Facility_Id`) REFERENCES `facility` (`Facility_Id`),
  CONSTRAINT `facility_forms_ibfk_2` FOREIGN KEY (`Facility_Service_Id`) REFERENCES `facility_services` (`Facility_Service_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `facility_key_providers` (
  `Provider_Id` int(10) NOT NULL AUTO_INCREMENT,
  `Provider_First_Name` varchar(30) DEFAULT NULL,
  `Provider_Middle_Name` varchar(30) DEFAULT NULL,
  `Provider_Last_Name` varchar(30) DEFAULT NULL,
  `Provider_Specialization` varchar(30) DEFAULT NULL,
  `Provider_Working_Hours` time DEFAULT NULL,/*time? or int*/
  `Provider_Type` char(10) DEFAULT NULL,
  `Provider_Phone_Number` varchar(15) DEFAULT NULL,
  `Facility_Id` int(10) DEFAULT NULL,
  `Facility_Service_Id` int(10) DEFAULT NULL,
  PRIMARY KEY (`Provider_Id`),
  KEY `Facility_Id` (`Facility_Id`),
  KEY `Facility_Service_Id` (`Facility_Service_Id`),
  CONSTRAINT `facility_key_providers_ibfk_1` FOREIGN KEY (`Facility_Id`) REFERENCES `facility` (`Facility_Id`),
  CONSTRAINT `facility_key_providers_ibfk_2` FOREIGN KEY (`Facility_Service_Id`) REFERENCES `facility_services` (`Facility_Service_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `facility_opening_hours` (
  `Day` char(10) DEFAULT NULL,
  `Opening_Time` time DEFAULT NULL,
  `Closing_Time` time DEFAULT NULL,
  `Facility_Id` int(10) DEFAULT NULL,
  KEY `Facility_Id` (`Facility_Id`),
  CONSTRAINT `facility_opening_hours_ibfk_1` FOREIGN KEY (`Facility_Id`) REFERENCES `facility` (`Facility_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `facility_restrictions` (
  `Restriction_Id` int(10) DEFAULT NULL, /*not a PK?*/
  `Restriction_Name` varchar(30) DEFAULT NULL,
  `Restriction_Description` varchar(50) DEFAULT NULL,
  `Facility_Id` int(10) DEFAULT NULL,
  KEY `Facility_Id` (`Facility_Id`),
  CONSTRAINT `facility_restrictions_ibfk_1` FOREIGN KEY (`Facility_Id`) REFERENCES `facility` (`Facility_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



