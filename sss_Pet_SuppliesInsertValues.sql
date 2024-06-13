-- Insert data into USERS table
INSERT INTO USERS (FullName, UserName, Password, PhoneNumber, Email, Address, ReturnCustomer)
VALUES ('Alice Johnson', 'alicej', SHA2('password101', 256), '123-456-7890', 'alice@gmail.com', '123 Maple Street, Bellingham, WA 98225', TRUE),
	('Bob Smith', 'bobsmith', SHA2('password123', 256), '234-567-8901', 'bob@yahoo.com', '456 Oak Avenue, Vashon, WA 98070', FALSE),
	('Carol White', 'carolw', SHA2('password456', 256), '345-678-9012', 'carol@aol.com', '789 Pine Road, Bremerton, WA 98312', TRUE),
	('David Brown', 'davidb', SHA2('password789', 256), '456-789-0123', 'david@icloud.com', '101 Elm Blvd, Seattle, WA 98108', TRUE),
	('Eva Green', 'evag', SHA2('password111', 256), '567-890-1234', 'eva@comcast.com', '202 Birch Lane, BirchBay, WA 98230', FALSE),
	('Frank Black', 'frankb', SHA2('password222', 256), '678-901-2345', 'frank@gmail.com', '303 Cedar Drive, Olympia, WA 98501', TRUE),
	('Grace Lee', 'gracel', SHA2('password333', 256), '789-012-3456', 'grace@comcast.com', '439 Seaview Road, Redmond, WA 98052' , TRUE),
	('Hank Hill', 'hankh', SHA2('password444', 256), '890-123-4567', 'hank@icloud.com', '505 Walnut Street, Mount Vernon, WA 98274', FALSE),
	('Ivy King', 'ivyk', SHA2('password555', 256), '901-234-5678', 'ivy@yahoo.com', '530 Beach Court, Seattle, WA 98108', TRUE),
	('John Doe', 'johnd', SHA2('password666', 256), '012-345-6789', 'john@gmail.com', '342 Mountainview Road, Snoqualmie, WA 98065', FALSE);

-- Insert data into USER_PAYMENT table
INSERT INTO USER_PAYMENT (UserID, CardName, PaymentType, EncryptedCardNumber, Expiry, CardAddress)
VALUES (10000, 'Alice Johnson', 'Credit Card', AES_ENCRYPT('6534227854109467', 'secret_key'), '2025-12-31', '123 Maple Street, Seattle, WA 98110'),
	(10001, 'Bob Smith', 'Debit Card', AES_ENCRYPT('1234567891011123', 'secret_key'), '2024-11-30', '456 Oak Avenue, Bellevue, WA 98006'),
	(10002, 'Carol White', 'Credit Card', AES_ENCRYPT('4465324687659025', 'secret_key'), '2023-10-31', '789 Pine Road, Shoreline, WA 98125'),
	(10003, 'Elise Brown', 'Debit Card', AES_ENCRYPT('6581239745239574', 'secret_key'), '2024-01-31', '700 Alpine Court, Lakewood, WA 98421'),
	(10004, 'Eva Green', 'Debit Card', AES_ENCRYPT('5426435687146734', 'secret_key'), '2024-05-08', '542 Skokomish Avenue, Lynnwood, WA 98036'),
	(10005, 'Angelica Brown', 'Debit Card', AES_ENCRYPT('2365478912376542', 'secret_key'), '2024-04-18', '421 Sunrise Blvd, Sammamish, WA 98532'),
	(10006, 'Grace Lee', 'Credit Card', AES_ENCRYPT('44752334834667543', 'secret_key'), '2024-08-28', '439 Seaview Road, Redmond, WA 98281'),
	(10007, 'Hank Hill', 'Debit Card', AES_ENCRYPT('8765432187654321', 'secret_key'), '2024-05-01', '459 Skyview Blvd, Edmonds, WA 98131'),
	(10008, 'Ivy King', 'Credit Card', AES_ENCRYPT('4558143790210954', 'secret_key'), '2024-06-16', '530 Beach Court, Seattle, WA 98108'),
	(10009, 'John Doe', 'Credit Card', AES_ENCRYPT('5522678903424368', 'secret_key'), '2024-02-18', '342 Mountainview Road, Snoqualmie, WA 98208');

INSERT INTO PRODUCT (ProductName, Animal, Description, Price)
VALUES ('Dog Food', 'Dog', 'Premium dog food', 29.99),
	('Cat Toy', 'Cat', 'Interactive cat toy', 9.99),
	('Dog Leash', 'Dog', 'Durable dog leash', 19.99),
	('Bird Seed', 'Bird', 'Nutrient-rich bird seed', 12.99),
	('Fish Tank', 'Fish', 'Glass fish tank with rounded corners and LED lighting', 59.99),
	('Rabbit Hutch', 'Rabbit', 'Spacious rabbit hutch', 79.99),
	('Hamster Wheel', 'Hamster', 'Silent running hamster wheel', 14.99),
	('Lizard Heat Lamp', 'Lizard', 'Modern heat lamp to emit infrared light providing source of warmth for reptiles', 24.99),
	('Horse Saddle', 'Horse', 'Traditional leather horse saddle with adjustable stirrups and padded seat', 199.99),
	('Dog Bed', 'Dog', 'Orthopedic dog bed with memory foam mattress', 39.99),
	('Dog Toy', 'Dog', 'Interactive dog toy set featuring durable chew toys', 20.99),
	('Cat Sweater', 'Cat', 'Soft and fluffy, crafted from fine wool and adorned with intricate patterns', 15.99),
	('Cat Food', 'Cat', 'Healthy cat food made from high-quality ingredients', 9.99),
	('Rabbit Coat', 'Rabbit', 'Soft, insulating material, and snug-fitting fleece jacket', 17.99),
	('Hamster Food', 'Hamster', 'Nutritious hamster food pellets packed with essential vitamins and minerals', 8.99),
	('Rabbit Food', 'Rabbit', 'Balanced rabbit food pellets enriched with fiber and nutrients', 12.99),
	('Dog Hoodie', 'Dog', 'Stylish and cozy hoodie features a soft cotton blend and a convenient hood', 24.99),
	('Cat Jacket', 'Cat', 'Chic cat jacket crafted from durable denim fabric', 19.99),
	('Horse Blanket', 'Horse', 'Functional horse blanket made from cozy and fluffy material', 39.99),
	('Bird Toy', 'Bird', 'Vibrant textures and durable interactive bird toy', 30.99),
	('Cat Toy', 'Cat', 'Catnip mice toys designed to captivate cats with sparking play and lifelike movement', 5.99),
    ('Reptile Food', 'Reptile', 'Specially formulated food for reptiles', 6.99),
    ('Fish Food', 'Fish', 'Premium blend of nutrients to support healthy growth and vibrant colors in fish', 8.99),
	('Horse Food', 'Horse', 'High-quality food to provide essential nutrients for horses of all ages', 45.99),
    ('Dog Food', 'Dog', 'Specially formulated balanced diet rich in protein and essential nutrients', 29.99), 
	('Cat Food', 'Cat', 'A delectable blend of fish, poultry, and savory gravy packed with vitamins and minerals', 19.99),
	('Hamster Sweater', 'Hamster', 'Cozy and cute sweater, made from soft acrylic yarn and featuring a ribbed design for a snug fit', 8.99),
    ('Parrot Hoodie', 'Bird', 'Stylish parrot hoodie, made from durable cotton and available in vibrant colors', 14.99),
	('Dog Raincoat', 'Dog', 'Waterproof dog raincoat, available in various sizes for a perfect fit', 24.99), 
	('Cozy Cat Sweater', 'Cat', 'Warm and fashionable cozy cat sweater, made from soft, breathable material for ultimate comfort.', 17.99),
    ('Rabbit Jacket', 'Rabbit', 'Rabbit winter jacket, features a fleece lining and adjustable straps for a snug fit', 18.99),
    ('Dog Toy', 'Dog', 'Interactive dog toy ball, made from durable rubber, it bounces unpredictably to stimulate play and exercise', 12.99), 
	('Cat Toy', 'Cat', 'Feather teaser wand with natural feathers and flexible wand for hours of interactive fun', 8.99),
	('Bird Toy', 'Bird', 'Provide essential mental and physical stimulation bird chew toy, made from safe and non-toxic materials', 9.99), 
	('Fish Toy', 'Fish', 'Floating fish tank toy with colorful design and gentle movements', 4.99),
	('Fish Cave', 'Fish', 'Fish tank hideout cave with realistic design and smooth edges provide a safe and comfortable retreat', 14.99),
    ('Dog Bowl', 'Dog', 'Stainless steel dog bowl, rust-resistant material and non-slip base make it a durable and practical', 9.99),
	('Cat Litter Box', 'Cat', 'Self-cleaning cat litter box, automatic rake system sifts through litter, removing waste and eliminating odors', 49.99), 
	('Bird Cage Perch', 'Bird', 'Enhance bird cage perch for comfortable and secure spot for your bird', 6.99), 
	('Aquarium Heater', 'Fish', 'Adjustable thermostat and shatterproof glass design for safe and reliable heating', 19.99),
	('Cat Scratching Post', 'Cat', 'Cat scratching post with sisal rope and sturdy base.', 24.99);
    
-- Insert data into REVIEWS table
INSERT INTO REVIEWS (UserID, SKU, Rating, Date, Comment)
VALUES (10000, 90000, 5, '2024-01-15', 'Excellent product!'),
	(10001, 90001, 4, '2024-02-20', 'Very good, but could be improved.'),
	(10002, 90002, 5, '2024-03-25', 'Great product, durable.'),
	(10003, 90003, 5, '2024-03-18', 'Excellent quality bird seed.'),
	(10004, 90004, 4, '2024-03-20', 'Large and sturdy, great for my fish.'),
	(10005, 90005, 5, '2024-04-01', 'The quality is outstanding, looks comfort for my rabbit'),
	(10006, 90006, 3, '2024-04-12', 'Cage is good, but too small for my hamster.'),
	(10007, 90007, 5, '2024-05-15', 'Keeps my lizard tank at the perfect temperature.'),
	(10008, 90008, 5, '2024-05-22', 'This horse saddle is a game-changer, providing unparalleled comfort and durability'),
	(10009, 90009, 4, '2024-06-01', 'Soft and fluffy, my dog loves it!');
				 

-- Insert data into CATEGORY table
INSERT INTO CATEGORY (CategoryName, Description)
VALUES	('Dogs', 'Products related to dogs and dog care'), 
	('Cats', 'Products related to cats and cat care'), 
	('Birds', 'Products related to birds and bird care'), 
	('Small Pets', 'Products related to small pets like hamsters, rabbits, etc.'), 
	('Fish', 'Products related to fish and aquarium care'), 
	('Reptiles', 'Products related to reptiles and reptile care'), 
	('Horses', 'Products related to horses and equine care'), 
	('Farm Animals', 'Products related to farm animals like cows, pigs, etc.'), 
	('Exotic Pets', 'Products related to exotic pets like sugar gliders, hedgehogs, etc.'), 
	('Wildlife', 'Products related to wildlife rehabilitation and care'); 

-- Insert data into PET_FOOD table
INSERT INTO PET_FOOD (SKU, Flavour, Weight)
VALUES (90000, 'Beef', 10.5),
	(90003, 'Mixed Fruit', 2.5),
	(90012, 'Savory Chicken', 5.0),
	(90014, 'Apple', 3.5),
	(90015, 'Carrot', 5.0),
    (90021, 'Insect Blend', 5.0),
    (90022, 'Shrimp Pelletes', 0.50),
    (90023, 'Grain Mix', 25.0),
    (90024, 'Savory Chicken', 2.5), 
    (90025, 'Grilled Salmon', 3.0);

	 
-- Insert data into PET_OUTERWEAR table
INSERT INTO PET_OUTWEAR (SKU, Size, ClothesType, Colour)
VALUES (90011, 'Medium', 'Sweater', 'Yellow'),
	(90013, 'Small', 'Coat', 'Purple'),
	(90016, 'Small', 'Hoodie', 'Pink'),
	(90017, 'Medium', 'Jacket', 'Green'),
	(90018, 'Large', 'Blanket', 'Red'),
    (90026, 'Small', 'Sweater', 'Purple'),
    (90027, 'Small', 'Hoodie', 'Yellow'),
    (90028, 'Medium', 'Raincoat', 'Blue'),
	(90029, 'Small', 'Sweater', 'Red'),
	(90030, 'Large', 'Jacket', 'Green');

-- Insert data into PET_TOY table
INSERT INTO PET_TOY (SKU, Size, Material)
VALUES (90001, 'Small', 'Plastic'),
	(90006, 'Medium', 'Plastic'),
	(90010, 'Large', 'Nylon'),
	(90019, 'Large', 'Wood'),
	(90020, 'Small', 'Polyester Fabric'),
    (90031, 'Medium', 'Rubber'),
	(90032, 'Small', 'Plastic'),
	(90033, 'Small', 'Natural Fiber'),
	(90034, 'Medium', 'Acrylic'),
	(90035, 'Large', 'Resin');

-- Insert data into PET_NECESSITIES table
INSERT INTO PET_NECESSITIES(SKU, Item, Material)
VALUES (90005, 'Hutch', 'Wood'),
	(90002, 'Leash', 'Nylon'),
	(90004, 'Fish Tank', 'Glass'),
	(90007, 'Heat Lamp', 'Ceramic'),
	(90008, 'Saddle', 'Leather'),
	(90009, 'Bed', 'Polyester Fabric'),
	(90036, 'Water Bowl', 'Ceramic'), 
	(90037, 'Litter Box', 'Plastic'), 
	(90038, 'Perch', 'Wood'), 
	(90039, 'Heater', 'Glass'),
    (90040, 'Scratching Post', 'Sisal Rope');

-- Insert data into PRODUCT_CATEGORY table
INSERT INTO PRODUCT_CATEGORY (SKU, CategoryID)
VALUES (90000, 1),
	(90001, 2),
	(90002, 3),
	(90003, 1),
	(90004, 3),
	(90005, 3),
	(90006, 2),
	(90007, 3),
	(90008, 3),
	(90009, 3);

-- Insert data into INVENTORY table
INSERT INTO INVENTORY (SKU, ProductName, Quantity, CheckDate, DeleteDate)
VALUES (90000, 'Dog Food', 100, '2024-01-30', NULL),
	(90001, 'Cat Toy', 200, '2024-02-01', NULL),
	(90002, 'Dog Leash', 150, '2024-02-28', NULL),
	(90003, 'Bird Seed', 280, '2024-03-01', NULL),
	(90004, 'Fish Tank', 100, '2024-03-30', NULL),
	(90005, 'Rabbit Hutch',130, '2024-03-30', NULL),
	(90006, 'Hamster Wheel', 300, '2024-04-01', NULL),
	(90007, 'Lizard Heat Lamp', 140, '2024-04-01', NULL),
	(90008, 'Horse Saddle', 30, '2024-04-15', NULL),
	(90009, 'Dog Bed', 500, '2024-04-15', NULL),
	(90010, 'Dog Toy', 800, '2024-04-29', NULL),
	(90011, 'Cat Sweater', 360, '2024-04-29', NULL),
	(90012, 'Cat Food', 1000, '2024-04-30', NULL),
	(90013, 'Rabbit Coat', 20, '2024-04-30', NULL),
	(90014, 'Hamster Food', 470, '2024-05-15', NULL),
	(90015, 'Rabbit Food', 530, '2024-05-15', NULL),
	(90016, 'Dog Hoodie', 630, '2024-05-30', NULL),
	(90017, 'Cat Jacket', 520, '2024-05-31', NULL),
	(90018, 'Horse Blanket', 30, '2024-05-31', NULL),
	(90019, 'Bird Toy', 320, '2024-05-31', NULL),
	(90020, 'Cat Toy', 580, '2024-06-01', NULL),
	(90021, 'Reptile Food', 160, '2024-06-01', NULL),
    (90022, 'Fish Food', 180, '2024-06-02', NULL),
	(90023, 'Horse Food', 25, '2024-06-03', NULL),
    (90024, 'Dog Food', 320, '2024-06-04', NULL), 
	(90025, 'Cat Food', 410, '2024-06-04', NULL),
	(90026, 'Hamster Sweater', 30, '2024-06-04', NULL),
    (90027, 'Parrot Hoodie', 100, '2024-06-05', NULL),
	(90028, 'Dog Raincoat', 50, '2024-06-05', NULL), 
	(90029, 'Cozy Cat Sweater', 80, '2024-06-05', NULL),
    (90030, 'Rabbit Jacket', 30, '2024-06-05', NULL),
    (90031, 'Dog Toy', 200, '2024-06-06', NULL), 
	(90032, 'Cat Toy', 400, '2024-06-06', NULL),
	(90033, 'Bird Toy', 350, '2024-06-06', NULL), 
	(90034, 'Fish Toy', 120, '2024-06-07', NULL),
	(90035, 'Fish Cave', 280, '2024-06-07', NULL),
    (90036, 'Dog Bowl', 540, '2024-06-07', NULL),
	(90037, 'Cat Litter Box', 100, '2024-06-08', NULL), 
	(90038, 'Bird Cage Perch', 25, '2024-06-08', NULL), 
	(90039, 'Aquarium Heater', 30, '2024-06-08', NULL),
	(90040, 'Cat Scratching Post', 80, '2024-06-08', NULL);
    

-- Insert data into TRACKING table
INSERT INTO TRACKING (ShipMethod, ShipAddress,ShippingDate, DeliveryDate)
VALUES ('Standard', '123 Maple Street, Bellingham, WA 98225', '2024-04-02', '2024-04-05'),
	('Express', '456 Oak Avenue, Vashon, WA 98070', '2024-04-02', '2024-04-02'),
	('Standard', '789 Pine Road, Bremerton, WA 98312', '2024-04-03', '2024-04-10'),
	('Express', '101 Elm Blvd, Seattle, WA 98108', '2024-04-08', '2024-04-08'),
	('Standard', '202 Birch Lane, BirchBay, WA 98230', '2024-04-12', '2024-04-18'),
	('Express','303 Cedar Drive, Olympia, WA 98501', '2024-04-22', '2024-04-22'),
	('Express', '439 Seaview Road, Redmond, WA 98052', '2024-05-02', '2024-05-02'),
	('Standard', '505 Walnut Street, Mount Vernon, WA 98274', '2024-05-04', '2024-05-14'),
	('Express', '530 Beach Court, Seattle, WA 98108', '2024-06-02', '2024-06-02'),
	('Standard', '342 Mountainview Road, Snoqualmie, WA 98065', '2024-06-03', '2024-06-08');

-- Insert data into ORDER_HISTORY table
INSERT INTO ORDER_HISTORY(UserID, OrderDate, Name, TrackingID, Amount, Tax, TotalAmount)
VALUES (10000, '2024-04-02', 'Alice Johnson', 1, 59.99, 5.99, 65.97),
	(10001, '2024-04-03', 'Bob Smith', 2, 19.99, 1.99, 43.96),
	(10002, '2024-04-08', 'Carol White', 3, 79.99, 7.99, 87.98),
	(10003, '2024-04-12', 'David Brown', 4, 12.99, 1.29, 14.28),
	(10004, '2024-04-22', 'Eva Green', 5, 24.99, 2.49, 99.96),
	(10005, '2024-05-02', 'Frank Black', 6, 199.99, 19.99, 219.98),
	(10006, '2024-05-04', 'Grace Lee', 7, 30.99, 3.09, 34.08),
	(10007, '2024-04-02', 'Hank Hill', 8, 17.99, 1.79, 19.78),
	(10008, '2024-06-02', 'Ivy King', 9, 9.99, 0.99, 10.98),
	(10009, '2024-06-03', 'John Doe', 10, 8.99, 0.89, 9.88);


-- Insert data into TRANSACTION_REPORT table
INSERT INTO TRANSACTION_REPORT (OrderID, PayID, Layaway, GrossAmount)
VALUES (80000, 100000, FALSE, 65.97),
	(80001, 100001, FALSE, 43.96),
	(80002, 100002, FALSE, 87.98),
	(80003, 100003, FALSE, 14.28),
	(80004, 100004, FALSE, 99.96),
	(80005, 100005, FALSE, 219.98),
	(80006, 100006, FALSE, 34.08),
	(80007, 100007, FALSE, 19.78),
	(80008, 100008, FALSE, 10.98),
	(80009, 100009, FALSE, 9.88);


-- Insert data into ORDER_ITEM table
INSERT INTO ORDER_ITEM (OrderID, SKU, QuantityPerProduct, TotalQuantity, SubTotal)
VALUES (80000, 90004, 1, 1, 59.99),
	(80001, 90002, 2, 2, 19.99),
	(80002, 90005, 1, 1, 79.99),
	(80003, 90003, 1, 1, 12.99),
	(80004, 90007, 4, 4, 24.99),
	(80005, 90008, 1, 1, 199.99),
	(80006, 90019, 1, 1, 30.99),
	(80007, 90013, 1, 1, 17.99),
	(80008, 90012, 1, 1, 9.99),
	(80009, 90014, 1, 1, 8.99);

