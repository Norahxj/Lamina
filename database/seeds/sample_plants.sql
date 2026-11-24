
-- Lamina: Sample Plants
-- Development/test data only

INSERT INTO plants (
    scientific_name,
    common_name,
    family,
    description,
    native_habitat,
    care_instructions
)
VALUES
(
    'Ziziphus spina-christi',
    'Sidr',
    'Rhamnaceae',
    'Sample record for testing.',
    'Sample habitat',
    'Sample care instructions'
),
(
    'Calotropis procera',
    'Sodom Apple',
    'Apocynaceae',
    'Sample record for testing.',
    'Sample habitat',
    'Sample care instructions'
),
(
    'Vachellia tortilis',
    'Umbrella Thorn',
    'Fabaceae',
    'Sample record for testing.',
    'Sample habitat',
    'Sample care instructions'
)
ON CONFLICT (scientific_name) DO NOTHING;