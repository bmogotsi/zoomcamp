FROM python:3.9

# wget will help pip install to download faster
# wget has been designed for robustness over slow or unstable network connections; 
# if a download fails due to a network problem, it will keep retrying until the whole file has been retrieved

RUN apt-get install wget 
RUN pip install pandas --upgrade

# the location in the Image in the Container where we will copy the pipeline file
WORKDIR /app
# the source file name and destination filename is the same
COPY pipeline.py pipeline.py 

ENTRYPOINT [ "python", "pipeline.py" ]