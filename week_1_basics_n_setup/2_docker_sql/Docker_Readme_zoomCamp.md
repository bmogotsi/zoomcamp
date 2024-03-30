## Docker_Sql
C:\Users\ben\gitProjectFlr\data-engineering-zoomcamp\week_1_basics_n_setup\2_docker_sql
file:///C:/Users/ben/gitProjectFlr/data-engineering-zoomcamp/week_1_basics_n_setup/2_docker_sql/
~/gitProjectFlr/data-engineering-zoomcamp/week_1_basics_n_setup/2_docker_sql/


Docker helps users to build applications independent of the underlying operating system

### Module
DE Zoomcamp 1.2.2 - Ingesting NY Taxi Data to Postgres
https://github.com/DataTalksClub/data-engineering-zoomcamp/tree/main/01-docker-terraform/2_docker_sql

>> Setup Postgres in Docker
>> Put data in Postgres
>> Use a simple python script to put data into Postgres

## Objective
	pwd =C:\Users\ben\gitProjectFlr\data-engineering-zoomcamp\week_1_basics_n_setup\2_docker_sql
	>> Setup Postgres in Docker
		@@ 	pull images
		@@ 	Volume(v) - map (mount) a local folder $(pwd)\ny_taxi_postgres_data
			to a folder in docker postgres image/container /var/lib/postgresql/data
			when we run postgres it does not save the state, so next time we ;ogin the data is lost
			mapping will help to keep the data in the local folder.
		@@ port (p) - map a port in the container to a port in our local/host machine
	>> Put data in Postgres
	>> Use a simple python script to put data into Postgres

### Tools
		>>> Docker application
			>> containers
			>> images
				@@ Postgres
				@@ pgAdmin (admine)
		>>> VsCode
			>> Docker File
			>> pipeline.py
		>>> GitBash
		>>> PGCLI client (python module)
			Use to access Postgres DB
			https://github.com/dbcli/pgcli
			https://www.meetgor.com/pgcli-pg-from-terminal/
			

### Errors		
	***  {docker run -it ... postgres:13 }
		docker: Error response from daemon: driver failed programming external connectiv
		ity on endpoint brave_ride (def937fc0946a0174c00f769c4013560d8f2a6ab3fb6027dee78
		a0c7a37c6ed6): Bind for 0.0.0.0:5432 failed: port is already allocated.
			
		[docker ps
			if the list (container and associated image/container) is not empty
				@@ go to DockerApp and delete the image/container
		]
	***
	
	*** {mounting/mapping error "ny_taxi_postgres_data;C"} 
		from {docker run -it ... postgres:13 }
		instead creating a folder with mapped files from the container,
		the command just created a folder and appended ";C" to the name
		
		[Using Git Bash:
		the local/host map folder must have 2 forward slahes before the letter "C" for drive C
			/$(pwd)/ny_taxi_postgres_data, will result as:
			"//c/Users/ben/gitProjectFlr/data-engineering-zoomcamp/week_1_basics_n_setup/2_docker_sql/ny_taxi_postgres_data"
			
			@@@ https://stackoverflow.com/questions/62218533/docker-volume-mapping-folder-issue-on-windows-10
		]
	***
	
	*** {winpty  TTY mintty}
		the input device is not a TTY.  If you are using mintty, try prefixing the command with 'winpty'
	
		[ prefix your BASH Commands with winpty	]
	***
### Commands
		[ Bash commands ] only execute on containers related to images in our docker-compose.yml files.
	>>> code .
			@@ invoke VsCode
	>>> docker run -it ... postgres:13 
		$ docker run -it \
		-e  POSTGRES_USER="root" \
		-e  POSTGRES_PASSWORD="root" \
		-e  POSTGRES_DB="ny_taxi" \
		-v  /$(pwd)/ny_taxi_postgres_data:/var/lib/postgresql/data:rw \
		-p  5432:5432 \
		postgres:13

		*** 
			[-p host_port:container_port]
			changed local/host_port port to 5430 because 5432 is in use by another user "-p  5430:5432     postgres:13" 
			{alternatively you can just go to DockerApp and delelte or exit the running container}
		***

	>>> docker ps
		List containers
			Aliases:
			  docker container ls, docker container list, docker container ps, docker ps

			Options:
			  -a, --all             Show all containers (default shows just running)

	>>>> docker container ls -a
	Let’s grab the CONTAINER ID and stop/remove the container.
	>>>> docker stop 45eec0e12d63
	>>>> docker rm 45eec0e12d63

### Steps
	1) 	Start DockerApp
	2) 	Open GitBash App 
	3) 	docker ps 
			list running container
				if there is any with port 5432 already running exit them or delete (see errors above)
	4) 	GitBash 
			Run Postgres locally
			Create Postgres DB, container, image, map/mount port 5432, map local folder ny_taxi_postgres_data 
				$ docker run -it \
				-e  POSTGRES_USER="root" \
				-e  POSTGRES_PASSWORD="root" \
				-e  POSTGRES_DB="ny_taxi" \
				-v  /$(pwd)/ny_taxi_postgres_data:/var/lib/postgresql/data:rw \
				-p  5432:5432 \
				postgres:13
		
	5) 	New Window of GitBash
		5.1) Open VsCode 
				$ code . 
	6) 	Access the postgres Database
		6.1)	pip install pgcli
				pip install psycopg2
				
		6.2)	run it
				$ pgcli -h localhost -p 5432 -u root -d ny_taxi

		6.3)	Enter password:root
		6.4)	List table
				$ root@localhost:ny_taxi> \dt
	7)	New Window of GitBash
		7.1) 	jupyter notebook
		7.1)	import pandas as pd
	8)	copy fata on ny taxi site
			https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page
			data is stored as .parquet type
		8.1) 	copy trip data to and name it
					$ cp ny_taxi_data/ny_TLC_Data_2021_150recs.csv yellow_taxiData_2021.csv
		8.2)	view first 100 lines
					$ head -n yellow_taxiData_2021.csv 
					$ head -n 100 yellow_taxiData_2021.csv > yellow_head.csv  (copy tp a new file)
					$ wc -l yellow_head.csv 	(count number of lines)
						100 yellow_head.csv
	9)	notebook
		>> read first 100 and create a DF
		>> Create a schema (create table base on DataFrame (DF) data)
		>> $ pip install sqlalchemy
		>> connect to Postgres
		>> 
				