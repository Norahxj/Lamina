# Lamina
## Software Requirements Specification (SRS)

**Version:** 0.1  
**Status:** Draft  
**Project:** Lamina  
**Platform:** Flutter Web (Mobile-first), with planned Android and iOS support

---

# 1. Introduction

## 1.1 Purpose

This document defines the initial functional and non-functional requirements of Lamina, a plant identification and botanical exploration application.

It serves as a reference for system design, UML modeling, implementation, and testing.

## 1.2 Project Overview

Lamina is a plant identification and botanical exploration application designed to help users identify plants, discover botanical information, explore plant distribution across Saudi Arabia, and learn about plant care.

The name *Lamina* is derived from the botanical term referring to the flat, expanded part of a leaf, commonly known as the leaf blade.

## 1.3 Project Objectives

Lamina aims to:

1. Simplify plant identification through image recognition.
2. Enable plant discovery through descriptive searches.
3. Provide accessible and reliable botanical information.
4. Allow users to explore plants associated with Saudi Arabia's administrative regions.
5. Support botanical education and plant care.
6. Enable registered users to maintain personal plant collections.

---

# 2. System Scope

## 2.1 In Scope

The initial version of Lamina will provide:

- Image-based plant identification.
- Descriptive plant search.
- Detailed plant information.
- An interactive map of Saudi Arabia's 13 administrative regions.
- Region-based plant browsing.
- Botanical educational content.
- Plant care information.
- User registration and authentication.
- Personal plant collections.
- Plant identification history for registered users.

## 2.2 Out of Scope

The following features are excluded from the initial version:

- AI-powered conversational plant care assistance.
- Community discussions and social networking.
- Automated plant watering reminders.
- User-submitted botanical distribution records.
- Real-time plant location tracking.

These features may be considered for future releases.

---

# 3. User Roles

## 3.1 Guest

A Guest is a user who accesses Lamina without authentication.

Guests can:

- Identify plants using images.
- Search for plants using descriptive keywords.
- Explore the Saudi botanical map.
- Browse plants by region.
- View plant details.
- Access botanical learning content.
- Register or log in.

## 3.2 Registered User

A Registered User is an authenticated user who can access all Guest features.

Additionally, registered users can:

- Save plants to personal collections.
- View and manage saved plants.
- Access their identification history.
- Log out.

---

# 4. Functional Requirements

## 4.1 Plant Identification

**FR-01: Image-Based Plant Identification**

The system shall allow users to capture or upload plant images for identification.

**FR-02: Plant Recognition**

The system shall analyze submitted images and return potential plant identification results.

**FR-03: Identification Results**

The system shall display potential plant matches, including available names, images, and confidence information when supported by the recognition service.

## 4.2 Plant Search

**FR-04: Descriptive Search**

The system shall allow users to search for plants using descriptive keywords, such as leaf color, flower color, or other visible characteristics.

**FR-05: Search Results**

The system shall display matching plants with their names and images.

## 4.3 Plant Information

**FR-06: Plant Details**

The system shall provide available botanical information, including:

- Common name.
- Scientific name.
- Botanical family.
- Physical characteristics.
- Native habitat.
- Geographic distribution.
- Toxicity information.
- Sunlight requirements.
- Water requirements.
- Soil requirements.
- Temperature preferences.
- Plant care instructions.

Unavailable or unverified information shall not be presented as confirmed facts.

## 4.4 Saudi Botanical Map

**FR-07: Interactive Regional Map**

The system shall display an interactive map of Saudi Arabia divided into its 13 administrative regions.

**FR-08: Regional Plant Browsing**

The system shall allow users to select an administrative region and browse plants recorded in that region.

**FR-09: Regional Plant Information**

The system shall display available plant names, images, and details for each selected region.

## 4.5 User Authentication

**FR-10: User Registration**

The system shall allow users to create accounts.

**FR-11: User Login**

The system shall authenticate registered users.

**FR-12: Guest Access**

The system shall allow guests to access public plant identification, search, map, and educational features without authentication.

## 4.6 Personal Plant Collection

**FR-13: Save Plants**

The system shall allow authenticated users to save plants to their personal collections.

**FR-14: Manage Saved Plants**

The system shall allow authenticated users to view and remove plants from their collections.

**FR-15: Identification History**

The system shall allow authenticated users to access their saved identification history.

## 4.7 Botanical Education

**FR-16: Educational Content**

The system shall provide educational information about plants, their characteristics, and botanical concepts.

**FR-17: Plant Care Guidance**

The system shall provide available plant care information and recommendations.

---

# 5. Non-Functional Requirements

## 5.1 Usability

**NFR-01:** The application shall provide a responsive, mobile-first interface.

**NFR-02:** The application shall provide clear navigation between identification, search, map, and educational features.

## 5.2 Security

**NFR-03:** The system shall protect authentication credentials and user information.

**NFR-04:** Only authenticated users shall be able to access and modify their personal collections and identification history.

## 5.3 Performance

**NFR-05:** The application shall provide clear loading and error states during image identification and data retrieval.

**NFR-06:** The application shall support efficient retrieval of plant information and regional search results.

## 5.4 Reliability

**NFR-07:** The system shall handle failed image identification requests gracefully.

**NFR-08:** The system shall communicate when botanical information is unavailable or identification results are uncertain.

## 5.5 Maintainability

**NFR-09:** The system shall use a modular architecture to support future development and maintenance.

## 5.6 Compatibility

**NFR-10:** The initial application shall support modern web browsers, with future support planned for Android and iOS.

---

# 6. Preliminary Technology Stack

| Component | Proposed Technology |
|---|---|
| Frontend | Flutter / Dart |
| Backend | Python / FastAPI |
| Database | PostgreSQL |
| Authentication | Token-based authentication |
| Plant Recognition | External recognition API or ML model |
| Maps | Flutter-compatible mapping solution |
| API Architecture | REST API |

Technology selections remain subject to evaluation.

---

# 7. Assumptions and Dependencies

- Plant identification may depend on an external recognition service.
- Identification accuracy depends on image quality, supported species, and model capabilities.
- Botanical information must be obtained from appropriate and reliable sources.
- Regional distribution information depends on the availability and quality of geographic botanical records.
- Internet connectivity will be required for server-dependent features in the initial version.
- The initial regional map will use Saudi Arabia's administrative regions rather than precise plant occurrence coordinates.

---

# 8. Future Enhancements

Potential future enhancements include:

- AI-powered plant care assistance.
- Plant watering reminders.
- Advanced botanical search filters.
- Detailed geographic distribution maps.
- Community contributions.
- Expanded educational content.
- Offline access to selected botanical information.

---

# 9. Document Status

This document represents the initial requirements baseline for Lamina.

Requirements may be refined during UML modeling, architecture design, implementation, and testing.