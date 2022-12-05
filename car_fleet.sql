/*
	KeepCoding. Curso de SQL
	
	Nota: Este script genera el modelo de datos necesarios para la práctica de SQL

*/

-- Creamos las tablas y añadimos las PK/FK

--Creamos el esquema
CREATE SCHEMA car_fleet AUTHORIZATION vtiampin;

create table car_fleet.cars
( 
 id_car varchar(10) not null,
 color varchar(10) not null,
 num_plate varchar(10) not null,
 num_kms int null,
 purchase_date date not null,
 id_model varchar(10) not null,
 id_brand varchar(10) not null
);

alter table car_fleet.cars
add constraint cars_PK  primary key (id_car);

create table car_fleet.models
(
 id_model varchar(10)  not null,
 name_model varchar(100) not null
);

alter table car_fleet.models
ADD CONSTRAINT models_PK PRIMARY KEY (id_model);

alter table car_fleet.cars
add constraint cars_FK_id_model FOREIGN KEY (id_model) REFERENCES car_fleet.models (id_model);

create table car_fleet.brands
(
 id_brand varchar(10) not null,
 name_brand varchar(100) not null,
 id_group varchar(10) not null
);

alter table car_fleet.brands
ADD CONSTRAINT brands_PK PRIMARY KEY (id_brand);

alter table car_fleet.cars
add constraint cars_FK_id_brand FOREIGN KEY (id_brand) REFERENCES car_fleet.brands (id_brand);

create table car_fleet.corporate_group
(
 id_group varchar(10) not null,
 name_group varchar(50) not null,
 country_group varchar(50) null
);

alter table car_fleet.corporate_group
ADD CONSTRAINT corporate_group_PK PRIMARY KEY (id_group);

alter table car_fleet.brands
ADD CONSTRAINT brands_FK FOREIGN KEY (id_group) REFERENCES car_fleet.corporate_group (id_group);

create table car_fleet.car_inspections
(
 id_inspection varchar(10) not null,
 id_car varchar(10) not null,
 num_kms_inspection_car int not null
);

alter table car_fleet.car_inspections
ADD CONSTRAINT car_inspections_PK PRIMARY KEY (id_inspection, id_car);


create table car_fleet.inspections
(
 id_inspection varchar(10) not null,
 date_inspection date not null,
 price_inspection float not null,
 id_currency varchar(10) not null
);

alter table car_fleet.inspections
ADD CONSTRAINT inspections_PK PRIMARY KEY (id_inspection);



alter table car_fleet.car_inspections
ADD CONSTRAINT car_inspections_FK FOREIGN KEY (id_inspection) REFERENCES car_fleet.inspections (id_inspection);

alter table car_fleet.car_inspections
ADD CONSTRAINT car_inspections_FK_id_car FOREIGN KEY (id_car) REFERENCES car_fleet.cars (id_car);


create table car_fleet.car_policy
(
 id_car varchar(10) not null,
 id_policy varchar(10) not null
);

alter table car_fleet.car_policy
ADD CONSTRAINT car_policy_PK PRIMARY KEY (id_car, id_policy);



create table car_fleet.policy_
(
 id_policy varchar(10) not null,
 date_start date not null,
 date_end date null,
 coverage varchar(20) not null,
 price_policy float not null,
 id_insurance_company varchar(10) not null,
 id_currency varchar(10) not null
);

alter table car_fleet.policy_
ADD CONSTRAINT policy_PK PRIMARY KEY (id_policy);


alter table car_fleet.car_policy
ADD CONSTRAINT car_policy_FK FOREIGN KEY (id_policy) REFERENCES car_fleet.policy_ (id_policy);

alter table car_fleet.car_policy
ADD CONSTRAINT car_policy_FK_id_car FOREIGN KEY (id_car) REFERENCES car_fleet.cars (id_car);


create table car_fleet.insurance_company
(
 id_insurance_company varchar(10) not null,
 name_company varchar(100) not null,
 address_company varchar(250) not null,
 telephone_num_company varchar(30) not null
);

alter table car_fleet.insurance_company
ADD CONSTRAINT insurance_company_PK PRIMARY KEY (id_insurance_company);

alter table car_fleet.policy_
ADD CONSTRAINT policy_FK FOREIGN KEY (id_insurance_company) REFERENCES car_fleet.insurance_company (id_insurance_company);


create table car_fleet.currency
(
 id_currency varchar(10) not null,
 type_currency varchar(10) default 'euro' not null
 );

alter table car_fleet.currency
ADD CONSTRAINT currency_PK PRIMARY KEY (id_currency);

alter table car_fleet.inspections
ADD CONSTRAINT inspections_FK FOREIGN KEY (id_currency) REFERENCES car_fleet.currency (id_currency);

alter table car_fleet.policy_
ADD CONSTRAINT policy_FK_id_currency FOREIGN KEY (id_currency) REFERENCES car_fleet.currency (id_currency);

-- Cargamos la info de las tablas

INSERT INTO car_fleet.models (id_model, name_model) VALUES ('FI', 'Fiesta');
INSERT INTO car_fleet.models (id_model, name_model) VALUES ('CO', 'Corsa');
INSERT INTO car_fleet.models (id_model, name_model) VALUES ('LE', 'Leaf');

INSERT INTO car_fleet.corporate_group (id_group, name_group, country_group) VALUES('FOMOCO', 'Ford-Motor-Company', 'Netherlands');
INSERT INTO car_fleet.corporate_group (id_group, name_group, country_group) VALUES('RENIMI', 'Renault-Nissan-Mitsubishi', 'Netherlands');
INSERT INTO car_fleet.corporate_group (id_group, name_group, country_group) VALUES('STEL', 'Stellantis', 'Netherlands');

INSERT INTO car_fleet.brands (id_brand, name_brand, id_group) VALUES ('FO', 'Ford', 'FOMOCO');
INSERT INTO car_fleet.brands (id_brand, name_brand, id_group) VALUES ('NI', 'Nissan', 'RENIMI');
INSERT INTO car_fleet.brands (id_brand, name_brand, id_group) VALUES ('OP', 'Opel', 'STEL');

INSERT INTO car_fleet.cars (id_car, color, num_plate, num_kms, purchase_date, id_model, id_brand) VALUES('000001','black','8785LDC',8542,'2019-12-15','FI','FO');
INSERT INTO car_fleet.cars (id_car, color, num_plate, num_kms, purchase_date, id_model, id_brand) VALUES('000002','grey','2553LMC',9810,'2020-01-16','LE','NI');
INSERT INTO car_fleet.cars (id_car, color, num_plate, num_kms, purchase_date, id_model, id_brand) VALUES('000003','white','0238LMP',5624,'2021-02-10','CO','OP');
INSERT INTO car_fleet.cars (id_car, color, num_plate, num_kms, purchase_date, id_model, id_brand) VALUES('000004','grey','0654LMP',9652,'2021-02-11','CO','OP');
INSERT INTO car_fleet.cars (id_car, color, num_plate, num_kms, purchase_date, id_model, id_brand) VALUES('000005','dark blue','5711LMP',10255,'2021-02-22','CO','OP');
INSERT INTO car_fleet.cars (id_car, color, num_plate, num_kms, purchase_date, id_model, id_brand) VALUES('000006','black','4562LSM',6874,'2021-08-18','FI','FO');
INSERT INTO car_fleet.cars (id_car, color, num_plate, num_kms, purchase_date, id_model, id_brand) VALUES('000007','black','7832LSM',8563,'2021-08-24','FI','FO');
INSERT INTO car_fleet.cars (id_car, color, num_plate, num_kms, purchase_date, id_model, id_brand) VALUES('000008','white','6584LST',7841,'2021-09-27','LE','NI');
INSERT INTO car_fleet.cars (id_car, color, num_plate, num_kms, purchase_date, id_model, id_brand) VALUES('000009','dark blue','6679LVR',5326,'2021-12-19','LE','NI');

INSERT INTO car_fleet.currency (id_currency, type_currency) VALUES('c001', 'euro');
INSERT INTO car_fleet.currency (id_currency, type_currency) VALUES('c002', 'USD');
INSERT INTO car_fleet.currency (id_currency, type_currency) VALUES('c003', 'CAD');

INSERT INTO car_fleet.inspections (id_inspection, date_inspection, price_inspection, id_currency) VALUES('insp00001', '2020-09-15', 325, 'c001');
INSERT INTO car_fleet.inspections (id_inspection, date_inspection, price_inspection, id_currency) VALUES('insp00002', '2022-10-11', 450, 'c001');
INSERT INTO car_fleet.inspections (id_inspection, date_inspection, price_inspection, id_currency) VALUES('insp00003', '2020-06-25', 375, 'c002');
INSERT INTO car_fleet.inspections (id_inspection, date_inspection, price_inspection, id_currency) VALUES('insp00004', '2022-02-12', 325, 'c002');
INSERT INTO car_fleet.inspections (id_inspection, date_inspection, price_inspection, id_currency) VALUES('insp00005', '2021-07-18', 325, 'c001');
INSERT INTO car_fleet.inspections (id_inspection, date_inspection, price_inspection, id_currency) VALUES('insp00006', '2021-09-13', 450, 'c002');
INSERT INTO car_fleet.inspections (id_inspection, date_inspection, price_inspection, id_currency) VALUES('insp00007', '2022-06-11', 375, 'c002');
INSERT INTO car_fleet.inspections (id_inspection, date_inspection, price_inspection, id_currency) VALUES('insp00008', '2021-08-24', 500, 'c001');
INSERT INTO car_fleet.inspections (id_inspection, date_inspection, price_inspection, id_currency) VALUES('insp00009', '2022-03-20', 325, 'c001');
INSERT INTO car_fleet.inspections (id_inspection, date_inspection, price_inspection, id_currency) VALUES('insp00010', '2021-08-18', 325, 'c001');
INSERT INTO car_fleet.inspections (id_inspection, date_inspection, price_inspection, id_currency) VALUES('insp00011', '2022-01-26', 450, 'c001');
INSERT INTO car_fleet.inspections (id_inspection, date_inspection, price_inspection, id_currency) VALUES('insp00012', '2022-09-16', 375, 'c001');
INSERT INTO car_fleet.inspections (id_inspection, date_inspection, price_inspection, id_currency) VALUES('insp00013', '2022-02-24', 500, 'c001');
INSERT INTO car_fleet.inspections (id_inspection, date_inspection, price_inspection, id_currency) VALUES('insp00014', '2022-11-19', 325, 'c003');

INSERT INTO car_fleet.car_inspections (id_inspection, id_car, num_kms_inspection_car) VALUES('insp00001', '000001', 4120);
INSERT INTO car_fleet.car_inspections (id_inspection, id_car, num_kms_inspection_car) VALUES('insp00002', '000001', 8250);
INSERT INTO car_fleet.car_inspections (id_inspection, id_car, num_kms_inspection_car) VALUES('insp00003', '000002', 4080);
INSERT INTO car_fleet.car_inspections (id_inspection, id_car, num_kms_inspection_car) VALUES('insp00004', '000002', 8452);
INSERT INTO car_fleet.car_inspections (id_inspection, id_car, num_kms_inspection_car) VALUES('insp00005', '000003', 4163);
INSERT INTO car_fleet.car_inspections (id_inspection, id_car, num_kms_inspection_car) VALUES('insp00006', '000004', 4125);
INSERT INTO car_fleet.car_inspections (id_inspection, id_car, num_kms_inspection_car) VALUES('insp00007', '000004', 8462);
INSERT INTO car_fleet.car_inspections (id_inspection, id_car, num_kms_inspection_car) VALUES('insp00008', '000005', 4230);
INSERT INTO car_fleet.car_inspections (id_inspection, id_car, num_kms_inspection_car) VALUES('insp00009', '000005', 8651);
INSERT INTO car_fleet.car_inspections (id_inspection, id_car, num_kms_inspection_car) VALUES('insp00010', '000006', 4221);
INSERT INTO car_fleet.car_inspections (id_inspection, id_car, num_kms_inspection_car) VALUES('insp00011', '000007', 4115);
INSERT INTO car_fleet.car_inspections (id_inspection, id_car, num_kms_inspection_car) VALUES('insp00012', '000007', 8110);
INSERT INTO car_fleet.car_inspections (id_inspection, id_car, num_kms_inspection_car) VALUES('insp00013', '000008', 4015);
INSERT INTO car_fleet.car_inspections (id_inspection, id_car, num_kms_inspection_car) VALUES('insp00014', '000009', 4158);

INSERT INTO car_fleet.insurance_company (id_insurance_company, name_company, address_company, telephone_num_company) VALUES('AX', 'AXA', 'Emilio Vargas, 6, Edificio AXA, 28043 Madrid', '900909014' );
INSERT INTO car_fleet.insurance_company (id_insurance_company, name_company, address_company, telephone_num_company) VALUES('SF', 'State Farm', 'One State Farm Plaza, Bloomington, IL 61710', '8007325246');
INSERT INTO car_fleet.insurance_company (id_insurance_company, name_company, address_company, telephone_num_company) VALUES('TI', 'ThinkInsure', '11 Allstate Parkway Unit 206, Markham, ON, L3R 9T8, Canada', '18555505515');


INSERT INTO car_fleet.policy_ (id_policy, date_start, date_end, coverage, price_policy, id_insurance_company, id_currency) VALUES('pol0001', '2019-12-17', NULL, 'full', 750.5, 'AX', 'c001' );
INSERT INTO car_fleet.policy_ (id_policy, date_start, date_end, coverage, price_policy, id_insurance_company, id_currency) VALUES('pol0002', '2020-01-19', NULL, 'full', 925.75, 'SF', 'c002');
INSERT INTO car_fleet.policy_ (id_policy, date_start, date_end, coverage, price_policy, id_insurance_company, id_currency) VALUES('pol0003', '2021-02-15', NULL, 'exc1', 428.6, 'AX', 'c001');
INSERT INTO car_fleet.policy_ (id_policy, date_start, date_end, coverage, price_policy, id_insurance_company, id_currency) VALUES('pol0004', '2021-02-12', NULL, 'full', 925.75, 'SF', 'c002');
INSERT INTO car_fleet.policy_ (id_policy, date_start, date_end, coverage, price_policy, id_insurance_company, id_currency) VALUES('pol0005', '2021-02-25', NULL, 'exc1', 428.6, 'AX', 'c001');
INSERT INTO car_fleet.policy_ (id_policy, date_start, date_end, coverage, price_policy, id_insurance_company, id_currency) VALUES('pol0006', '2021-08-24', NULL, 'full', 750.5, 'AX', 'c001');
INSERT INTO car_fleet.policy_ (id_policy, date_start, date_end, coverage, price_policy, id_insurance_company, id_currency) VALUES('pol0007', '2021-08-26', NULL, 'full', 750.5, 'AX', 'c001');
INSERT INTO car_fleet.policy_ (id_policy, date_start, date_end, coverage, price_policy, id_insurance_company, id_currency) VALUES('pol0008', '2021-10-01', NULL, 'full', 750.5, 'AX', 'c001');
INSERT INTO car_fleet.policy_ (id_policy, date_start, date_end, coverage, price_policy, id_insurance_company, id_currency) VALUES('pol0009', '2021-12-23', NULL, 'full', 750.5, 'TI', 'c003');

INSERT INTO car_fleet.car_policy (id_car, id_policy) VALUES('000001', 'pol0001');
INSERT INTO car_fleet.car_policy (id_car, id_policy) VALUES('000002', 'pol0002');
INSERT INTO car_fleet.car_policy (id_car, id_policy) VALUES('000003', 'pol0003');
INSERT INTO car_fleet.car_policy (id_car, id_policy) VALUES('000004', 'pol0004');
INSERT INTO car_fleet.car_policy (id_car, id_policy) VALUES('000005', 'pol0005');
INSERT INTO car_fleet.car_policy (id_car, id_policy) VALUES('000006', 'pol0006');
INSERT INTO car_fleet.car_policy (id_car, id_policy) VALUES('000007', 'pol0007');
INSERT INTO car_fleet.car_policy (id_car, id_policy) VALUES('000008', 'pol0008');
INSERT INTO car_fleet.car_policy (id_car, id_policy) VALUES('000009', 'pol0009');







-- Fin Scripts ---
