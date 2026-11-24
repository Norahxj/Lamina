
-- Lamina: Plant Trait Definitions

INSERT INTO plant_traits (
    trait_name,
    description
)
VALUES
(
    'leaf_color',
    'Color of the plant leaves'
),
(
    'flower_color',
    'Color of the plant flowers'
),
(
    'leaf_shape',
    'Shape of the plant leaves'
),
(
    'plant_type',
    'General type of the plant'
),
(
    'flowering_season',
    'Season when the plant flowers'
),
(
    'habitat_type',
    'Type of environment where the plant grows'
)
ON CONFLICT (trait_name) DO NOTHING;