# eggobase

## What is this?

- An egg based 'web application'
- It serves as a medium to learn about Servlets, JSPs and JSTL
    - And Java 8+ serverside development in general
- It also serves as a reference of how to build simple stuff using Java + PostgreSQL
- And, to boot, it serves as a playground for building CI/CD pipelines with zero consequences

## Generating the WAR

- Inspiration from:
    - http://employees.oneonta.edu/higgindm/internet%20programming/Deploying_WebApps_With_Ant.htm
    - https://ant.apache.org/manual/tutorial-HelloWorldWithAnt.html
---
- We create the `Eggobase.war` from the .java files, JSPs, html, tags, web.xml etc
- A `.war` is just a zip archive, nothing more
- We archive all files in the /warOut directory
- The main point is:
    - Compiled classes go in `/warOut/WEB_INF/classes`
    - web.xml goes in `/warOut/WEB_INF`
    - .jsp, .txt, .html go in `/warOut`
    - `/warOut/META-INF/MANIFEST.MF` must exist
- So, we compile the java with the correct classpath(s)
- And copy the static files into the format Tomcat 8.5 expects

### Manually (with javac + -cp)

- See `./build-w-javac.sh`

### With Ant

#### Installing Ant

- `sudo apt update && sudo apt -y install ant && ant -version`

#### Ant in Docker

- `docker pull frekele/ant` can help
- build.xml pending...

---

## Building the docker image

The docker image must include the JSTL/mail jars!

- `docker build -t tomcat-eggobase .`

## Running (locally) through Docker

If you have postgres running in a non-networked way through docker

- `docker run --network host -p 80:8080 tomcat-eggobase`

## Running (locally) through compose

- `docker-compose build && docker-compose up -d`

## kompose/minikube/kubectl

- https://github.com/kubernetes/kompose/blob/master/docs/user-guide.md
- THIS ONE ESPECIALLY (issues with kompose up)
    - https://github.com/kubernetes/kompose/issues/1264
- minikube / komposer port difficulties 
    - https://github.com/kubernetes/minikube/issues/7663
- Controlling minikube if a deployment went well: 
    - https://minikube.sigs.k8s.io/docs/handbook/controls/

## Kompose/minikube flow

- `minikube start --apiserver-port=9443`
- `kompose convert -o kompose-factory && kubectl apply -f kompose-factory/` (all)
- `kubectl apply -f kompose-factory/` (just to start)
- `minikube dashboard` (to see what inevitably went wrong)
- `kubectl get deployment,svc,pods` get details
- Rage quit: `minikube delete --all`

---

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
