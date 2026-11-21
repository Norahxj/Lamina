# Lamina — Functional Requirements Specification

**Version:** 0.1  
**Status:** Draft  
**Related Document:** SRS.md

---

## 1. Purpose

This document provides detailed functional requirements for Lamina, including user interactions, system behavior, expected results, and acceptance criteria.

Each requirement is identified by the same ID used in the Software Requirements Specification (SRS).

## 2. User Roles

**Guest:** A user who accesses Lamina without authentication and can use public identification, search, map, and educational features.

**Registered User:** An authenticated user who can access all public features and manage personal plant collections and identification history.

---

## 3. Plant Identification

### FR-01 — Image-Based Plant Identification

**Priority:** High  
**Actors:** Guest, Registered User

**Description:** The system shall allow users to capture a plant image using a supported camera or upload an existing image.

**Preconditions:**
- The application is accessible.
- The user can select an image or grant camera permission when required.

**Main Flow:**
1. The user opens the Identify Plant feature.
2. The user selects Capture Image or Upload Image.
3. The user provides a plant image.
4. The system validates the image.
5. The system submits the image for identification.

**Alternative Flows:**
- If camera permission is denied, the system allows the user to upload an image instead.
- If the image is invalid, the system displays an error and allows another attempt.

**Acceptance Criteria:**
- Users can submit a supported image.
- Invalid images are rejected with a clear error message.
- Successful submissions proceed to image recognition.

### FR-02 — Plant Recognition

**Priority:** High  
**Actors:** Guest, Registered User

**Description:** The system shall process submitted plant images using a recognition service to identify potential plant species.

**Preconditions:**
- A valid image has been submitted.

**Main Flow:**
1. The system receives the image.
2. The backend sends the image to the recognition service.
3. The service analyzes the image.
4. The system receives potential identification results.

**Alternative Flows:**
- If the recognition service is unavailable, the system displays a service error.
- If no potential match is returned, the system informs the user.

**Acceptance Criteria:**
- Valid images can be submitted for recognition.
- Service failures are handled without crashing the application.
- Returned results are passed to the identification results interface.

### FR-03 — Identification Results

**Priority:** High  
**Actors:** Guest, Registered User

**Description:** The system shall display potential plant matches with available names, images, and confidence information when supported.

**Main Flow:**
1. The system receives recognition results.
2. Potential plant matches are displayed.
3. The user reviews the suggested plants.
4. The user selects a plant to view its details.

**Acceptance Criteria:**
- Multiple possible matches can be displayed.
- Each result displays available identifying information.
- Confidence information is shown only when provided and meaningful.
- The user can open the details of an available plant record.
- The interface communicates that identification results may be uncertain.

---

## 4. Plant Search

### FR-04 — Descriptive Search

**Priority:** High  
**Actors:** Guest, Registered User

**Description:** The system shall allow users to search for plants using descriptive keywords.

**Examples:**
- Yellow leaves
- White flowers
- Thorny stems
- Small green leaves

**Main Flow:**
1. The user opens Plant Search.
2. The user enters descriptive keywords.
3. The system searches plant information and indexed characteristics.
4. The system retrieves matching plants.

**Acceptance Criteria:**
- Users can search without logging in.
- The system supports searching indexed plant characteristics.
- Search terms can be used to retrieve relevant plant records.

### FR-05 — Search Results

**Priority:** High  
**Actors:** Guest, Registered User

**Description:** The system shall display plants matching the search query.

**Acceptance Criteria:**
- Matching plants appear with their names and available images.
- Users can select a result to view its details.
- The system displays an informative message when no results are found.

---

## 5. Plant Information

### FR-06 — Plant Details

**Priority:** High  
**Actors:** Guest, Registered User

**Description:** The system shall display available information about a selected plant.

**Information Fields:**
- Common name
- Scientific name
- Botanical family
- Plant images
- Physical characteristics
- Native habitat
- Geographic distribution
- Toxicity information
- Sunlight requirements
- Water requirements
- Soil requirements
- Temperature preferences
- Plant care instructions

**Acceptance Criteria:**
- Users can open an available plant record.
- The system displays its available botanical information.
- Missing information is clearly distinguished from verified information.

---

## 6. Saudi Botanical Map

### FR-07 — Interactive Regional Map

**Priority:** High  
**Actors:** Guest, Registered User

**Description:** The system shall provide an interactive map displaying Saudi Arabia's 13 administrative regions.

**Acceptance Criteria:**
- Users can access the map without authentication.
- Each supported administrative region can be selected.
- The selected region is identified clearly.

### FR-08 — Regional Plant Browsing

**Priority:** High  
**Actors:** Guest, Registered User

**Description:** The system shall allow users to browse plants recorded within a selected Saudi administrative region.

**Main Flow:**
1. The user opens the Saudi Botanical Map.
2. The user selects a region.
3. The system retrieves the plant records associated with the selected region.
4. The system displays the regional plant list.

**Acceptance Criteria:**
- Plants are retrieved based on their recorded regional associations.
- A plant can appear in multiple regions.
- Regions without available records display an appropriate message.

### FR-09 — Regional Plant Information

**Priority:** High  
**Actors:** Guest, Registered User

**Description:** The system shall display available plant names and images for the selected region, with access to detailed plant information.

**Acceptance Criteria:**
- The region's plant list includes available names and images.
- Users can open plant details.
- Missing regional records are not presented as proof that a species is absent from the region.

---

## 7. User Authentication

### FR-10 — User Registration

**Priority:** High  
**Actor:** Guest

**Description:** The system shall allow users to create an account.

**Acceptance Criteria:**
- Users can provide the required registration information.
- Duplicate email addresses are rejected.
- Passwords are not stored in plain text.
- Successful registration creates a user account.

### FR-11 — User Login

**Priority:** High  
**Actor:** Guest

**Description:** The system shall allow registered users to authenticate using valid credentials.

**Acceptance Criteria:**
- Valid credentials allow the user to sign in.
- Invalid credentials produce an appropriate error.
- Authenticated sessions are managed securely.
- Users can log out of their accounts.

### FR-12 — Guest Access

**Priority:** High  
**Actor:** Guest

**Description:** The system shall allow public features to be accessed without authentication.

**Acceptance Criteria:**
- Guests can identify and search for plants.
- Guests can explore the Saudi botanical map.
- Guests can view plant details and learning content.
- Personal collection features require authentication.

---

## 8. Personal Plant Collection

### FR-13 — Save Plants

**Priority:** High  
**Actor:** Registered User

**Description:** The system shall allow authenticated users to save plants to personal collections.

**Acceptance Criteria:**
- Authenticated users can save a plant.
- The saved record is associated with the correct user.
- Guests are prompted to log in when attempting to save.
- Duplicate saves are handled appropriately.

### FR-14 — Manage Saved Plants

**Priority:** High  
**Actor:** Registered User

**Description:** The system shall allow authenticated users to view and remove saved plants.

**Acceptance Criteria:**
- Users can view their saved plants.
- Users can remove plants from their collections.
- Users cannot access or modify another user's collection.

### FR-15 — Identification History

**Priority:** High  
**Actor:** Registered User

**Description:** The system shall allow authenticated users to view their stored identification history.

**Acceptance Criteria:**
- Stored identification records are associated with the correct user.
- Users can access their own available history.
- Users cannot access another user's identification history.

---

## 9. Botanical Education

### FR-16 — Educational Content

**Priority:** Medium  
**Actors:** Guest, Registered User

**Description:** The system shall provide educational content about plants and botanical concepts.

**Acceptance Criteria:**
- Users can browse available educational content.
- Users can open and read individual content items.
- Educational content is accessible without authentication.

### FR-17 — Plant Care Guidance

**Priority:** High  
**Actors:** Guest, Registered User

**Description:** The system shall display available care information for plants.

**Acceptance Criteria:**
- Available watering, sunlight, soil, and temperature information is displayed.
- Missing care information is clearly indicated.
- Guidance is presented as general information when plant-specific conditions may vary.

---

## 10. Requirement Traceability

| Requirement IDs | Related System Module |
|---|---|
| FR-01 to FR-03 | Plant Identification |
| FR-04 to FR-05 | Plant Search |
| FR-06 | Plant Catalog |
| FR-07 to FR-09 | Saudi Botanical Map |
| FR-10 to FR-12 | Authentication |
| FR-13 to FR-15 | Personal Collection |
| FR-16 to FR-17 | Botanical Education |

---

## 11. Document Status

This specification is an initial functional requirements baseline.

Detailed validation rules, service selection, data retention policies, and additional acceptance criteria will be refined during implementation planning and testing.