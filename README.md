# Decentralized Specialized Theatrical Costume Tracking System

## Overview

This decentralized system provides comprehensive tracking and management of theatrical costumes through specialized smart contracts. The system allows theater companies to digitally register, track history, manage maintenance, and facilitate rentals of valuable costume assets across multiple organizations.

## Smart Contract Architecture

The system consists of four specialized smart contracts:

### 1. Costume Registration Contract

The foundation of the system, storing essential information about each costume:

- Unique costume ID and digital signature
- Description, designer, construction details
- Materials, fabric types, and special features
- Size information and measurement data
- Original production information
- Photographs and authentication details
- Current ownership information
- Estimated value and insurance details

### 2. Production History Contract

Tracks the performance history of each costume:

- Productions where the costume was used
- Character associations
- Performance dates and venues
- Notable performers who wore the costume
- Director and creative team information
- Production photographs with the costume
- Special adaptations made for specific productions

### 3. Maintenance Tracking Contract

Manages the care and condition of costumes:

- Cleaning history and specialized cleaning instructions
- Repair records and condition reports
- Conservation treatments
- Material-specific care requirements
- Maintenance schedules
- Damage documentation
- Restoration history

### 4. Rental Management Contract

Facilitates sharing costumes between theater companies:

- Current availability status
- Rental history and terms
- Booking calendar
- Pricing information
- Shipping and handling requirements
- Security deposits and insurance requirements
- Condition documentation before and after rentals

## Key Benefits

- **Provenance Tracking**: Complete, immutable history of each costume's use and ownership
- **Resource Sharing**: Efficient rental system between multiple theater companies
- **Preservation**: Better maintenance through comprehensive tracking
- **Cost Efficiency**: Reduced storage costs and increased rental opportunities
- **Authentication**: Verifiable history and authenticity for valuable historic pieces

## Implementation Requirements

### Technical Requirements
- Ethereum-compatible blockchain
- IPFS integration for storing images and large data files
- Web3 frontend interface for user interactions
- Digital wallet integration for transaction signing

### User Roles
- Costume Managers: Full system access for their organization
- Designers/Creators: Registration and history viewing access
- Maintenance Staff: Access to maintenance records and updates
- Production Teams: Viewing access and rental request capabilities

## Getting Started

1. Clone this repository
2. Install dependencies: `npm install`
3. Configure your environment variables
4. Deploy contracts: `npx hardhat run scripts/deploy.js --network <your-network>`
5. Start the frontend: `npm start`

## API Documentation

Detailed API documentation is available in the `/docs` folder, covering interactions with all smart contracts and data structures.

## Contributing

We welcome contributions from the theatrical community. Please see our [CONTRIBUTING.md](CONTRIBUTING.md) file for guidelines.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
