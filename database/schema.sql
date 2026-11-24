
-- ==========================================
-- LAMINA DATABASE SCHEMA
-- Version: 0.1
-- Database: PostgreSQL
-- ==========================================

-- Run this file on a newly created, empty database.
-- Seed data is stored separately in database/seeds/.
-- Do not execute against an existing initialized database.


-- ==========================================
-- TABLES
-- ==========================================


-- 1. PLANTS
CREATE TABLE plants (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    scientific_name VARCHAR(255) NOT NULL UNIQUE,
    common_name VARCHAR(255),
    family VARCHAR(255),
    description TEXT,
    native_habitat TEXT,
    toxicity_information TEXT,
    care_instructions TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);


-- 2. SAUDI REGIONS
CREATE TABLE regions (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name_ar VARCHAR(100) NOT NULL UNIQUE,
    name_en VARCHAR(100) NOT NULL UNIQUE
);


-- 3. PLANT DISTRIBUTIONS
CREATE TABLE plant_distributions (
    plant_id UUID NOT NULL,
    region_id INTEGER NOT NULL,
    occurrence_status VARCHAR(50),
    source TEXT,
    last_verified DATE,

    PRIMARY KEY (plant_id, region_id),

    FOREIGN KEY (plant_id)
        REFERENCES plants(id)
        ON DELETE CASCADE,

    FOREIGN KEY (region_id)
        REFERENCES regions(id)
        ON DELETE RESTRICT
);


-- 4. PLANT IMAGES
CREATE TABLE plant_images (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    plant_id UUID NOT NULL,
    image_url TEXT NOT NULL,
    image_type VARCHAR(50),
    attribution TEXT,

    FOREIGN KEY (plant_id)
        REFERENCES plants(id)
        ON DELETE CASCADE
);


-- 5. PLANT TRAITS
CREATE TABLE plant_traits (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    trait_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);


-- 6. PLANT TRAIT VALUES
CREATE TABLE plant_trait_values (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    plant_id UUID NOT NULL,
    trait_id INTEGER NOT NULL,
    trait_value VARCHAR(150) NOT NULL,

    FOREIGN KEY (plant_id)
        REFERENCES plants(id)
        ON DELETE CASCADE,

    FOREIGN KEY (trait_id)
        REFERENCES plant_traits(id)
        ON DELETE RESTRICT,

    UNIQUE (plant_id, trait_id, trait_value)
);


-- 7. USERS
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(150) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password_hash TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT users_email_unique
        UNIQUE (email)
);


-- 8. SAVED PLANTS
CREATE TABLE saved_plants (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    plant_id UUID NOT NULL,
    saved_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    notes TEXT,

    CONSTRAINT saved_plants_user_fk
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE,

    CONSTRAINT saved_plants_plant_fk
        FOREIGN KEY (plant_id)
        REFERENCES plants(id)
        ON DELETE CASCADE,

    CONSTRAINT saved_plants_unique
        UNIQUE (user_id, plant_id)
);


-- 9. PLANT IDENTIFICATIONS
CREATE TABLE plant_identifications (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID,
    image_reference TEXT,
    identified_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    status VARCHAR(30) NOT NULL DEFAULT 'pending',

    CONSTRAINT plant_identifications_user_fk
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE SET NULL,

    CONSTRAINT plant_identifications_status_check
        CHECK (
            status IN (
                'pending',
                'completed',
                'failed'
            )
        )
);


-- 10. IDENTIFICATION CANDIDATES
CREATE TABLE identification_candidates (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    identification_id UUID NOT NULL,
    plant_id UUID,
    predicted_name VARCHAR(255) NOT NULL,
    confidence_score DOUBLE PRECISION,
    rank INTEGER NOT NULL,

    CONSTRAINT candidates_identification_fk
        FOREIGN KEY (identification_id)
        REFERENCES plant_identifications(id)
        ON DELETE CASCADE,

    CONSTRAINT candidates_plant_fk
        FOREIGN KEY (plant_id)
        REFERENCES plants(id)
        ON DELETE SET NULL,

    CONSTRAINT candidates_confidence_check
        CHECK (
            confidence_score IS NULL
            OR confidence_score BETWEEN 0 AND 1
        ),

    CONSTRAINT candidates_rank_check
        CHECK (rank > 0),

    CONSTRAINT candidates_unique_rank
        UNIQUE (identification_id, rank)
);


-- 11. LEARNING CONTENTS
CREATE TABLE learning_contents (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title VARCHAR(255) NOT NULL,
    body TEXT NOT NULL,
    category VARCHAR(100),
    published_at TIMESTAMPTZ
);


-- ==========================================
-- INDEXES
-- ==========================================

-- Improve image retrieval by plant
CREATE INDEX idx_plant_images_plant
    ON plant_images(plant_id);

-- Improve geographic queries by region
CREATE INDEX idx_distributions_region
    ON plant_distributions(region_id);

-- Improve descriptive searches by trait
CREATE INDEX idx_trait_values_search
    ON plant_trait_values(trait_id, trait_value);


-- ==========================================
-- END OF LAMINA DATABASE SCHEMA
-- ==========================================