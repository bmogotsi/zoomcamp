## Ingest Data
		https://www.youtube.com/watch?v=B1WwATwf-vY&list=PL3MmuxUbc_hJed7dXYoJw8DoCuVHhGEQb&index=10
		DE Zoomcamp 1.2.4 - Dockerizing the Ingestion Script
		
## Dockerfile
	Include all pip installation
	Include RUN apt-get install wget  (This one will install wget in bash, which fetches data from https)
	Include statement to invoke: ingest_data.py 
	
	
## Others
	>>> $ py -m http.server
		this did not work on my side
		>> http://localhost:8000/
			This will display all files in the Current Working Directory
		>> ipconfig 
			this is to get IP Address for localhost 
				take the first one :vEtherne (Defaol Switch)
					 172.25.112.1
						replace name localhost with ip Address
							this will make file downloading faster
								http://172.25.112.1:8000/
		
		>> copy the url with IP Address to "Docker run -it taxi-ingest:v001"
				

