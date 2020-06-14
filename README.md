# eggobase

## What is this?

- An egg based 'web application'
- It serves as a medium to learn about Servlets, JSPs and JSTL
    - And Java 8+ serverside development in general
- It also serves as a reference of how to build simple stuff using Java + PostgreSQL

## Building the docker image

The docker image must include the JSTL/mail jars!

- `docker build -t tomcat-eggobase .`

## Running through Docker

If you have postgres running in a non-networked way through docker

- `docker run --network host -p 80:8080 tomcat-eggobase`

## Running through compose

- `docker-compose build && docker-compose up -d`


## Vague future plan

- JUnit
- TravisCI
- Dockerise
    - Tomcat
    - All required libs
    - environment vars
    - PostgreSQL
        - Migrations with Flyway (or something)
- ...to make a CI/CD pipeline
- Deploy to GCP in an automated manner

## Fun things to do in the future

- Upload pictures of eggs
- Use some off-the-shelf GCP ML thing to detect whether or not the picture is actually an egg

## Useful resources

### Setting environment variables so that eclipse can see them
(on Linux)

- https://stackoverflow.com/questions/7048216/environment-variables-in-eclipse
- Essentially, put them in /etc/environment
