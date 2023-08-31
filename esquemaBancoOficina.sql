create database repairShop;
use database repairShop

CREATE TABLE employee  (
   idEmployee INT  AUTO_INCREMENT,
  employeeName VARCHAR(40),
  employeeFunction VARCHAR(45),
  PRIMARY KEY (idEmployee)
);

CREATE TABLE vehicle (
  idVehicle INT AUTO_INCREMENT,
  licensePlateVehicle CHAR(7) NOT NULL,
  brandVehicle VARCHAR(15),
  ModelVehicle VARCHAR(15),
  YearVehicle INT,
  EngineModelVehicle VARCHAR(20),
  ColorVehicle VARCHAR(12),
  MilesVehicle FLOAT NULL,
  OwerVehicle VARCHAR(45),
  ResponsablePhone CHAR(11),
  PRIMARY KEY (idVehicle)
);

CREATE TABLE budget (
   idBudget INT AUTO_INCREMENT,
   idEmployee_fk INT NOT NULL,
   idVehicle_fk INT NOT NULL,
   Description VARCHAR(100),
   initialDate DATE,
   finalDate DATE,
   Value FLOAT,
   Approve ENUM('S', 'N') NOT NULL DEFAULT NULL,
   paymentMethod` ENUM('PIX', 'Credito') NULL,
   PRIMARY KEY (idBudget, idEmployee_fk, idVehicle_fk),
   CONSTRAINT fk_employee    
   FOREIGN KEY (idResponsable_fk)
   REFERENCES repairShop, employee (idEmployee)
   CONSTRAINT fk_vehicle
   FOREIGN KEY (idVehicle_fk)
   REFERENCES repairShop.vehicle (idVehicle)
);
   


CREATE TABLE product (
  idProduct INT AUTO_INCREMENT,
  ProductName VARCHAR(45),
  ProductCost FLOAT,
  PRIMARY KEY (idProduct)
);

CREATE TABLE Service (
  idService INT AUTO_INCREMENT,
  descriptionService VARCHAR(65),
  costServiceCost FLOAT,
  hoursService INT,
  categoryService ENUM('Mecanica', 'Funilaria', 'Eletrica', 'Rodas', 'Freios', 'Suspensao') NOT NULL,
  PRIMARY KEY (idService)
);

CREATE TABLE parts (
  idPart INT AUTO_INCREMENT,
  namePart VARCHAR(45),
  costPart FLOAT,
  PRIMARY KEY (idPart)
);

CREATE TABLE orderService  
   idOrderService INT AUTO_INCREMENT,
   idBudget_fk INT NOT NULL,
   idResponsableOrderService_fk INT NOT NULL,
   idService_fk INT NOT NULL,
   idPart_fk INT NULL,
   idProduct_fk  INT NULL,
   Cost FLOAT NULL,
  PRIMARY KEY (idOrderService, idBudget_fk, idResponsableOrderService_fk, idService_fk
)
 
