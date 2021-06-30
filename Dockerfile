FROM python:3.6


# Create app directory
WORKDIR /server

# Install dependencies
RUN pip install torch==1.8.1
RUN pip install numpy==1.15.4
RUN pip install laserembeddings==1.1.1
RUN python -m laserembeddings download-models

# Copy needed files
COPY CMD.httpserver_start.sh httpserver.py /server/
COPY classifier__TAUS.en-en.50-50-A2.pt classifier__TAUS.en-en.50-50-A3.pt classifier__TAUS.en-en.50-50-maxbalanced.pt /server/
RUN mkdir -p /server/WWW
COPY WWW/. /server/WWW/

# define the port number the container should expose
EXPOSE 8080

# run the command
CMD ["bash", "CMD.httpserver_start.sh"]

