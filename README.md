
## Features

- Serve multiple web applications (`SiteMain`, `Version1`, `Version2`) from a single NGINX container.
- Each app is accessible via a unique route:
  - `/sitemain` for `SiteMain`
  - `/version1` for `Version1`
  - `/version2` for `Version2`

## Prerequisites

- Docker installed on your system.

## Setup Instructions

1. **Clone the Repository**:
   ```bash
   git clone <repository-url>
   cd dockerimgs

  **Docker Commands:**  

   docker build -t multi-app-nginx .    
   docker run -d -p 80:80 multi-app-nginx


**Test the routes:**

http://localhost/sitemain  
http://localhost/version1  
http://localhost/version2