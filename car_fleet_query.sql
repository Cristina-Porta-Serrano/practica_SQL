SELECT models.name_model, 
	brands.name_brand, 
	cg.name_group, 
	cg.country_group, 
	cars.purchase_date,
	cars.num_plate, 
	cars.color, 
	cars.num_kms, 
	ic.name_company, 
	p.id_policy, 
	p.coverage 
FROM car_fleet.cars cars 
INNER JOIN car_fleet.models models
	ON cars.id_model = models.id_model
INNER JOIN car_fleet.brands brands
	ON cars.id_brand = brands.id_brand
INNER JOIN car_fleet.corporate_group cg 
	ON cg.id_group = brands.id_group 
INNER JOIN car_fleet.car_policy cp 
	ON cp.id_car = cars.id_car 
INNER JOIN car_fleet.policy_ p 
	ON p.id_policy = cp.id_policy 
INNER JOIN car_fleet.insurance_company ic 
	ON ic.id_insurance_company = p.id_insurance_company
