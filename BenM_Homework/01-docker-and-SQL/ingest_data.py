#!/usr/bin/env python
# coding: utf-8\

# imported and converted from from notebook Upload-Data.ipynb
# $ jupyter nbconvert --to=script Upload-Data.ipynb
# converted to Upload-Data.py
# I renamed to ingest_data.py

# ###### DE Zoomcamp 1.2.2 - Ingesting NY Taxi Data to Postgres
# ###### https://www.youtube.com/watch?v=2JM-ziJt0WI&list=PL3MmuxUbc_hJed7dXYoJw8DoCuVHhGEQb&index=6
# ###### https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page

# The argparse module 
#   Parser for command-line options, arguments and sub-commands
#   makes it easy to write user-friendly command-line interfaces. 
import argparse
import pandas as pd
from sqlalchemy import create_engine
import os
from time import time

def main(params):

    user = params.user
    password = params.password
    host = params.host
    port = params.port
    db = params.db
    table_name = params.table_name
    url = params.url

    # url test data +- 200k records
    # https://github.com/DataTalksClub/nyc-tlc-data/releases/download/yellow/yellow_tripdata_2020-04.csv.gz
    # URL = "https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2020-04.parquet"

    # for pandas to be able to open the file
    if url.endswith('.csv.gz'):
        csv_name = 'output.csv.gz'
    else:
        csv_name = 'output.csv'
    
    # download csv
    
    #>>> csv_name = 'output.csv'       #'yellow_tripData_2021.csv'
    
    if url.endswith('.parquet'):      
        parquet_name= 'output.parquet'
        # Then edit the code which downloads the files
        os.system(f"wget {url} -O {parquet_name}")
        # Convert the download .parquet file to csv and rename as csv_name to keep it relevant to the rest of the code
        df = pd.read_parquet(parquet_name)
        df.to_csv(csv_name, index=False)
    else:
        # not parquet
        os.system(f"wget {url} -O {csv_name}")

    # #### Postgres Connection
    # ###### $ pip install sqlalchemy

    # from sqlalchemy import create_engine

    engine= create_engine(f'postgresql://{password}:{user}@{host}:{port}/{db}')  # 'postgresql://root:root@localhost:5432/ny_taxi'

    engine.connect()

    # read and write to DB in chunks of 100k
    df_iter = pd.read_csv(csv_name, iterator=True, chunksize=20000)
    
    df = next(df_iter)

    # mask the 2 fields from text to TimeStamp and pass back to DF
    df.tpep_dropoff_datetime = pd.to_datetime(df.tpep_dropoff_datetime)
    df.tpep_pickup_datetime  = pd.to_datetime(df.tpep_pickup_datetime)

    df.head(n=0).to_sql( name=table_name, con=engine, if_exists='replace')
    df.to_sql(name=table_name, con=engine, if_exists='append')
    
    # get_ipython().run_line_magic('time', "df.to_sql( name='yellow_taxi_data', con=engine, if_exists='append') # how long will it run")


    countRecs=0
    while True:
        try:
            t_start = time()
            
            df = next(df_iter)
            
            df.tpep_dropoff_datetime = pd.to_datetime(df.tpep_dropoff_datetime)
            df.tpep_pickup_datetime  = pd.to_datetime(df.tpep_pickup_datetime)

            df.to_sql(name=table_name, con=engine, if_exists='append')

            countRecs+=100000
            t_end = time()
            print(f'Inserted another chunk... count... {countRecs}, it took %.3f second' % (t_end - t_start))
        except StopIteration:
            print("Finished ingesting data into the postgres database")
            break

    print('Asta - La - Vista')
    # pd.io.sql.get_schema

# https://docs.python.org/3/library/__main__.html
if __name__ == '__main__':
    # argparse
    # copied from https://docs.python.org/3/library/argparse.html

    # user
    # password
    # host
    # port
    # Database Name
    # Table Name
    # url  of csv

    parser = argparse.ArgumentParser(description='Ingest CSV data to Postgres.')
    parser.add_argument('--user', help='user name for postgres')
    parser.add_argument('--password', help='password for postgres')
    parser.add_argument('--host', help='hostname for postgres')
    parser.add_argument('--port', help='port number for postgres')
    parser.add_argument('--db', help='database name for postgres')
    parser.add_argument('--table_name', help='Table Name for postgres')
    parser.add_argument('--url', help='url of the csv')

    args = parser.parse_args()
    #print(args.accumulate(args.integers))

    main(args)