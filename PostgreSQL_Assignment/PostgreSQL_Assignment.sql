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

INSERT INTO sightings(species_id, ranger_id, location, sighting_time, notes)
    VALUES 
        (1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
        (2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
        (2, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
        (1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', 'Camera trap image captured')



--1. Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'
INSERT INTO rangers(name, region) VALUES('Derek Fox', 'Coastal Plains');


--2.  Count unique species ever sighted.
SELECT common_name, count(*) FROM species
    INNER JOIN sightings ON species.species_id = sightings.species_id
        GROUP BY common_name;

--3. Find all sightings where the location includes "Pass".
SELECT * FROM sightings
    WHERE location LIKE '%Pass%';


--4.  List each ranger's name and their total number of sightings.
SELECT name, count(*)  FROM rangers
 JOIN sightings ON rangers.ranger_id = sightings.ranger_id
    GROUP BY name;

--5. List species that have never been sighted.
SELECT * FROM species
    WHERE species_id NOT IN (SELECT species_id FROM sightings);
  

--6. Show the most recent 2 sightings.
SELECT * FROM sightings ORDER BY sighting_time DESC LIMIT 2;

--7.  Update all species discovered before year 1800 to have status 'Historic'.
UPDATE species
    SET conservation_status = 'Historic'
        WHERE extract(year from discovery_date) <  '1800';


--8. Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening'.
SELECT sighting_id,
CASE 
    WHEN extract(hour from sighting_time) < 12 THEN  'Morning'
    WHEN extract(hour from sighting_time) < 17 THEN  'Afternoon'
    WHEN extract(hour from sighting_time) < 24 THEN  'Evening'
    
    ELSE  
     'nothing'
END
FROM sightings;


--9. Delete rangers who have never sighted any species
SELECT CONSTRAINT_NAME FROM information_schema.key_column_usage
WHERE TABLE_NAME = 'sightings' and column_name = 'ranger_id'; -- Get Foreign key constraing name

ALTER TABLE sightings
    DROP CONSTRAINT sightings_ranger_id_fkey; -- Delete foreign key constraings

ALTER Table sightings
    ADD FOREIGN KEY (ranger_id) REFERENCES rangers(ranger_id) ON DELETE CASCADE; -- Added foreign key constraing with ON DELETE CASCADE

DELETE FROM rangers
    WHERE ranger_id NOT IN (SELECT ranger_id FROM sightings GROUP BY ranger_id);

