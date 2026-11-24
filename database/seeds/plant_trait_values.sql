
-- Lamina: Sample Plant Trait Values
-- Development/test data only

INSERT INTO plant_trait_values (
    plant_id,
    trait_id,
    trait_value
)
SELECT
    p.id,
    t.id,
    sample.trait_value
FROM (
    VALUES
        ('Ziziphus spina-christi', 'leaf_color', 'green'),
        ('Ziziphus spina-christi', 'flower_color', 'yellow'),
        ('Ziziphus spina-christi', 'leaf_shape', 'oval'),
        ('Ziziphus spina-christi', 'plant_type', 'tree'),

        ('Calotropis procera', 'leaf_color', 'green'),
        ('Calotropis procera', 'flower_color', 'white'),
        ('Calotropis procera', 'leaf_shape', 'oval'),
        ('Calotropis procera', 'plant_type', 'shrub'),

        ('Vachellia tortilis', 'leaf_color', 'green'),
        ('Vachellia tortilis', 'flower_color', 'white'),
        ('Vachellia tortilis', 'leaf_shape', 'compound'),
        ('Vachellia tortilis', 'plant_type', 'tree')
) AS sample(scientific_name, trait_name, trait_value)
JOIN plants p
    ON p.scientific_name = sample.scientific_name
JOIN plant_traits t
    ON t.trait_name = sample.trait_name
ON CONFLICT (plant_id, trait_id, trait_value)
DO NOTHING;