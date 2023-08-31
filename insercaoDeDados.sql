use oficina_db;

		insert into employee (employeeName, employeeFunction )
	         values	('Marcelo Maneva','Gerente'),
			('Ayrton Souza Senna','Mecanico'),
                        ('Luis Amilton','Pintor'),
                        ('Pedro Pascal','Funileiro'),
                        ('Roberto De Niro','Mecanico'),
                        ('Antonio Sanita','Eletricista'),
                        ('José Pinto','Auxiliar'),
                        ('Francisco Mendez','Auxiliar'),
                        ('Regina Macedo','Recepcionista'),
                        ('Renato Souza','Supervisor');
                                
		select * from employee;

		insert into Service (descriptionService, costService, hoursService, categoryService)
		 values	('Troca da correia dentada', 850, 3, 'Mecanica'),
			('Troca de óleo do motor', 120, 1, 'Mecanica'),
                        ('Troca do câmbio', 5000, 2,'Mecanica'),
                        ('Troca de pneus', 50, 1, 'Rodas'),
                        ('Balanceamento de pneus', 50, 1, 'Rodas'),
                        ('Alinhamento do veículo', 120, 1, 'Rodas'),
                        ('Pintura', 2800, 30, 'Funilaria'),
                        ('Troca de bateria', 40, 1, 'Eletrica'),
                        ('Troca dos discos de freios', 160, 1,	'Freios'),
                        ('Troca de amortecedores', 250, 3, 'Suspensao'),
                        ('Instalação de Alarme', 100, 2, 'Eletrica'),
                        ('Troca de faról e milha', 120, 1, 'Eletrica'),
                        ('Polimento', 250, 2,'Funilaria'),
                        ('Manutencao do ar condicionado', 200, 1, 'Mecanica');
                            
        select * from Service;

		insert into parts (namePart, CostPart)
		   values ('Correia Dentada', 120),
			  ('Rolamento correia dentada', 80),
			  ('Arruela de vedacao do óleo', 10),
			  ('câmbio', 6000),
			  ('Pneu', 320),
			  ('Tinta de fundo preparador', 120),
			  ('Tinta de acabamento',	250),
			  ('Amortecedor', 140),
			  ('Kit de alarme positron', 360),
			  ('Farol', 800),
			  ('Lanterna dianteira', 220),
			  ('Farol de milha', 310),
			  ('Correia de ar condicionado', 75),
                          ('Bateria', 590),
                          ('Porca para rodas', 20),
                          ('Arruelas para rodas', 10);
                
		select * from parts;
        
		insert into Product (ProductName, ProductCost)
		   values ('Desengripante (spray)',             25),
			  ('Oleo de motor',			45),
			  ('Graxa branca',			85),
			  ('Graxa preta',			65),
			  ('Lixa 5000',				20),
			  ('Lixa 2000',				15),
			  ('Lixa 500',				10),
			  ('Pasta polidora',			80),
			  ('Anti-corrosivo',			50),
			  ('Vaselina pastosa',   		25),
			  ('Oleo de freio',			25),
			  ('Oleo de cambio',			80),
			  ('Gas de arcondicionado',      	200),
			  ('Kit de juntas', 			60),
			  ('Kit de retentores',	        	90);
        
		select * from Product;

		insert into Vehicle ( licensePlateVehicle, brandVehicle, ModelVehicle, YearVehicle, EngineModelVehicle, ColorVehicle, MilesVehicle, OwerVehicle, ResponsablePhone)
			values	('JED8146', 		'Toyota', 		'Corola', 		'2020',			'1.6 FLEX',				'prata',		28467,		'Paulo Fernandes',	'11972587452'),
				('SLO6402', 		'Nissan', 		'Tida', 		'2015',			'1.4 GAS',				'branco',		220670,		'Justino Barbosa',	'11962587431'),
				('LXF0267', 		'Renault', 		'Logan', 		'2011',			'1.6 FLEX',				'preto',		310000,		'Carlos Andrade',	'12952587442'),
				('CVN4608', 		'Hyundai', 		'HB20', 		'2017',			'1.3 FLEX',				'vermelho',		90370,		'Hélio Nunes',		'13942585553'),
				('BNX3079', 		'Chevrolet', 	        'Chevette', 	        '1978',			'1.4 GAS',				'verde',		430710,		'Benedito Silva',	'13932566454'),
				('LWO4031', 		'Volkswagen',	        'Gol',	 		'1992',			'1.8 GAS',				'azul',			303570,		'Hélio Abrantes',	'12938277455');                                

		select * from Vehicle;
        
		insert into budget (idResponsable_fk, idVehicle_fk, Description,                                   initalDate, budgetValue, Approve, finalDate, paymentMethod)
			alues 	   (11,	                         1, 'Instalar pneus novos (4 unidades)',          '2023-08-10',       1800,     'S', '2023-08-10',    Cretdit),
				   (11,				 2, 'Instalar farois novos (2 unidades)',         '2023-08-11',	      1600,	'N',	     NULL,	 NULL),
				   (11,				 3, 'Trocar oleo do motor',		          '2023-08-11',	       180,	'S', '2023-08-11',	'PIX'),
				   (11,				 4, 'Corrigir falhas do cambio automatico',	  '2023-08-12',	       960,	'S', '2023-08-13',    default),
				   (11,				 5, 'Substituir a embreagem',			  '2023-08-12',	       675,	'S', '2023-08-14',    default),
				   (11,				 6, 'Substituir a bateria',			  '2023-08-12',	       680,	'S', '2023-08-14',    default),
				   (11,				 1, 'Polimento geral da pintura',		  '2023-08-15',	       330,	NULL,        NULL,    default),
				   (11,				 5, 'Instalacao do sistema de alarme anti-furto', '2023-08-16',	       485,	'S', '2023-08-17',    default),
				   (11,				 6, 'Substituicao dos amortecedores',		  '2023-08-16',	       595,	'N',	     NULL,       NULL);
                                
		select * from Budget;
        
		insert into orderService (idBudget_fk, idResponsableOrderService_fk, idService_fk,	idPart_fk,	idProduct_fk,	Cost)
				 values	 (	1,				7,					4,				   5,			NULL,			1480),
					 (	1,				8,					5,				  15,			NULL,			200),
                                         (	1,				5,					6,				  16,			NULL,			120),
                                         (	2,				6,					12,				  10,			NULL,			1600),
                                         (	3,				2,					2,				   3,			   2,			180),
                                         (	4,				2,					13,				NULL,		          12,		        960),
                                         (	5,				2,					3,				   4,			   1,		        675),
                                         (	6,				6,					8,				  14,			   9,			680),
                                         (	7,				3,					14,				NULL,		           8,			330),
                                         (	8,				6,					11,				   9,			  10,			485),
                                         (	9,				5,					10,				   8,			   4,			595);
                                
        select * from orderService;
