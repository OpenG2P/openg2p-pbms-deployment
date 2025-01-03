# OpenG2P PBMS Helm Chart

This helm contains the following components:

- PBMS Odoo Package (Odoo + PostgreSQL)
- PBMS Beneficiary Portal
- Mail SMTP server
- MinIO
- ODK Central
- Keymanager
- OpenSearch
- Reporting (Reporting Framework + Reporting Init)
- Superset
- eSignet (eSignet + Mock Identity System)
- PBMS Landing Page

Note: Helm chart versions lower than 2.x.x were split into two parts. For versions 2.x.x and higher, there is only a single chart that installs all the required components. No need to install P2.
