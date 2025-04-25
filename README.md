
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
   git clone https://github.com/nagurram/dockerimgs.git
   cd dockerimgs

  **Docker Commands:**  

   docker build -t multi-app-nginx .    
   docker run -d -p 80:80 multi-app-nginx


****Pulling docker image from dockerhub****

docker pull nagurram/multi-app-nginx:latest  
docker run -d -p 80:80 nagurram/multi-app-nginx:latest




**Test the routes:**

http://localhost/sitemain  
http://localhost/version1  
http://localhost/version2