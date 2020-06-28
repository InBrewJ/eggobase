# uses the Dockerfile in /builder to generate Eggobase.war
docker build -f ./builder/Dockerfile -t eggobase_builder .  && \
docker run -v ${PWD}/builder/out:/opt/out eggobase_builder