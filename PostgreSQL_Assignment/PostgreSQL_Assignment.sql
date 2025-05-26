-- Active: 1747742347551@@127.0.0.1@5432@conservation_db@public

-- =========CREATE TABLES===========
CREATE TABLE rangers(
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL
);

CREATE TABLE species(
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(100) NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(50) NOT NULL
);

CREATE TABLE sightings(
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT REFERENCES rangers(ranger_id),
    species_id INT REFERENCES species(species_id),
    sighting_time TIMESTAMP,
    location VARCHAR(150) NOT NULL,
    notes VARCHAR(250)
);

-- =======INSERT DATA==========
INSERT INTO rangers(name, region)
    VALUES ('Alice Green', 'Northern Hills'),
            ('Bob White', 'River Delta'),
            ('Carol King', 'Mountain Range'),
            ('David Brown', 'Coastal Plains'),
            ('Emily Young', 'Forest Canopy'),
            ('Frank Miller', 'Southern Plateau'),
            ('Grace Harris', 'Lake District'),
            ('Henry Taylor', 'Savanna Grasslands'),
            ('Isabella Clark', 'Desert Oasis'),
            ('Jack Wilson', 'Tropical Rainforest');


INSERT INTO species(common_name, scientific_name, discovery_date, conservation_status)
VALUES
    ('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
    ('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
    ('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
    ('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered'),
    ('Indian Cobra', 'Naja naja', '1758-01-01', 'Least Concern'),
    ('Great Indian Bustard', 'Ardeotis nigriceps', '1863-01-01', 'Critically Endangered'),
    ('Ganges River Dolphin', 'Platanista gangetica', '1801-01-01', 'Endangered'),
    ('Indian Pangolin', 'Manis crassicaudata', '1825-01-01', 'Near Threatened'),
    ('Sloth Bear', 'Melursus ursinus', '1791-01-01', 'Vulnerable'),
    ('Indian Star Tortoise', 'Geochelone elegans', '1831-01-01', 'Vulnerable');



SELECT * from rangers