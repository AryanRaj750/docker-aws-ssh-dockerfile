FROM ubuntu:latest
COPY ./docker /usr/bin/
COPY ./aws  /
COPY ./entry.sh /
RUN  ./install  && \
     rm -rf dist install README.md  THIRD_PARTY_LICENSES && \
     apt-get update &&     \
     apt-get install -y     \ 
          openssh-server     \
          git                 \
          jq                   \
          openjdk-11-jre-headless && \
     useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo ubuntu && \
     echo 'ubuntu:ubuntu' | chpasswd 

# setting environmental variable for aws credentials
ENV  AWS_ACCESS_KEY_ID=XXXXXX  AWS_SECRET_ACCESS_KEY=XXXXXX AWS_DEFAULT_REGION=us-west-2
EXPOSE 22
CMD ["./entry.sh"]
