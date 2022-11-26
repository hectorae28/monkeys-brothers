CREATE DATABASE IF NOT EXISTS root;

\c root;

CREATE TYPE food_enum AS ENUM ('burger', 'hotdog', 'drink');

CREATE TABLE IF NOT EXISTS Foods (
    id_food SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    price NUMERIC(10,2) DEFAULT 0,
    category food_enum NOT NULL
);

CREATE TABLE IF NOT EXISTS Ingredients (
    id_ingredient SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS Foods_Ingredients (
    id_food_Ingredient SERIAL PRIMARY KEY,
    id_food INT,
    id_ingredient INT,
    FOREIGN KEY (id_food) REFERENCES Foods(id_food),
    FOREIGN KEY (id_ingredient) REFERENCES Ingredients(id_ingredient)
);

INSERT INTO Ingredients(name) VALUES
('Pan'),
('Salchicha'),
('Papas'),
('Cebolla'),
('Queso amarillo'),
('Carne'),
('Pollo'),
('Huevo'),
('Tocineta'),
('Maíz'),
('Cebolla caramelizada');

INSERT INTO Foods(name,price,category) VALUES 
('Classic',2,'hotdog'),
('Monkey`s',4,'hotdog');

INSERT INTO Foods_Ingredients(id_food,id_ingredient) VALUES
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(2,1),
(2,2),
(2,6),
(2,7),
(2,8),
(2,9),
(2,10),
(2,11);

-- query ingredientes de la clasic --
SELECT Foods.name, Ingredients.name from Ingredients 
JOIN Foods_Ingredients ON Foods_Ingredients.id_ingredient=Ingredients.id_ingredient
JOIN Foods on Foods.id_food=Foods_Ingredients.id_food
WHERE Foods.name='Classic';
-- query ingredientes de la monkeys --
SELECT Foods.name, Ingredients.name from Ingredients 
JOIN Foods_Ingredients ON Foods_Ingredients.id_ingredient=Ingredients.id_ingredient
JOIN Foods on Foods.id_food=Foods_Ingredients.id_food
WHERE Foods.name='Monkey`s';

