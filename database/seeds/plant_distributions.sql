
-- Lamina: Sample Plant Distributions
-- TEST DATA ONLY - Not verified botanical records

INSERT INTO plant_distributions (
    plant_id,
    region_id,
    occurrence_status,
    source,
    last_verified
)
SELECT
    p.id,
    r.id,
    sample.occurrence_status,
    'TEST_DATA',
    NULL
FROM (
    VALUES
        ('Ziziphus spina-christi', 'Riyadh', 'present'),
        ('Ziziphus spina-christi', 'Asir', 'present'),
        ('Calotropis procera', 'Riyadh', 'present'),
        ('Calotropis procera', 'Makkah', 'present'),
        ('Vachellia tortilis', 'Asir', 'present'),
        ('Vachellia tortilis', 'Tabuk', 'present')
) AS sample(
    scientific_name,
    region_name,
    occurrence_status
)
JOIN plants p
    ON p.scientific_name = sample.scientific_name
JOIN regions r
    ON r.name_en = sample.region_name
ON CONFLICT (plant_id, region_id) DO NOTHING;