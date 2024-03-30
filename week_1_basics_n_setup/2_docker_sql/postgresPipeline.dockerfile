# run Postgres
docker run -it \
    -e  POSTGRES_USER="root" \
    -e  POSTGRES_PASSWORD="root" \
    -e  POSTGRES_DB="ny_taxi" \
    -v  /$(pwd)/ny_taxi_postgres_data:/var/lib/postgresql/data:rw \
    -p  5432:5432 \
    postgres:13


docker run -it 
    -e  POSTGRES_USER="root" 
    -e  POSTGRES_PASSWORD="root" 
    -e  POSTGRES_DB="ny_taxi" 
    -v   //c/Users/ben/gitProjectFlr/data-engineering-zoomcamp/week_1_basics_n_setup/2_docker_sql/ny_taxi_postgres_data:/var/lib/postgresql/data 
    -p  5432:5432 
postgres:13

# Running Postgres and pgAdmin together

docker network create pg-network

# Run Postgres (change the path to network path)

docker run -it \
    -e  POSTGRES_USER="root" \
    -e  POSTGRES_PASSWORD="root" \
    -e  POSTGRES_DB="ny_taxi" \
    -v  /$(pwd)/ny_taxi_postgres_data:/var/lib/postgresql/data:rw \
    -p  5432:5432 \
    --network=pg-network \
    --name pg-database \
    postgres:13

# Run pgAdmin (change the path to network path)
docker run -it \
    -e PGADMIN_DEFAULT_EMAIL="admin@admin.com" \
    -e PGADMIN_DEFAULT_PASSWORD="root" \
    -p 8080:80 \
    --network=pg-network \
    --name pgadmin-2 \
    dpage/pgadmin4   

URL = "https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2021-01.parquet"
# URL = "file:///C:/Users/ben/gitProjectFlr/data-engineering-zoomcamp/week_1_basics_n_setup/2_docker_sql/"
# URL = "/$(pwd)yellow_tripData_2021.csv"
# URL = "https://github.com/DataTalksClub/nyc-tlc-data/releases/download/yellow/yellow_tripdata_2020-04.csv.gz"
# URL = "https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2020-04.parquet"
py ingest_data.py \
    --user=root \
    --password=root \
    --host=localhost \
    --port=5432 \
    --db=ny_taxi \
    --table_name=yellow_taxi_data \
    --url=https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2021-01.parquet 


py ingest_data_parquet.py \
    --user=root \
    --password=root \
    --host=localhost \
    --port=5432 \
    --db=ny_taxi \
    --table_name=yellow_parquet_data \
    --url=https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2020-04.parquet 

py ingest_data_parquet.py \
    --user=root \
    --password=root \
    --host=localhost \
    --port=5432 \
    --db=ny_taxi \
    --table_name=yellow_2021parquet_data \
    --url=https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2021-01.parquet

# pd.io.sql.get_schema