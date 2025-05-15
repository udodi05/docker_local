docker pull kniru/acadaweb:latest
docker stop acada-webapp1 acada-webapp2 acada-webapp3 acada-webapp4 acada-webapp5 acada-webapp_collins  || true
docker rm acada-webapp1  acada-webapp2 acada-webapp3 acada-webapp4 acada-webapp5 acada-webapp_collins  -f 
docker network create acada-app
docker run -d --name acada-webapp1 --hostname acada-webapp1 --network acada-app kniru/acadaweb:latest
docker run -d --name acada-webapp2 --hostname acada-webapp2 --network acada-app kniru/acadaweb:latest
docker run -d --name acada-webapp3 --hostname acada-webapp3 --network acada-app kniru/acadaweb:latest
docker run -d --name acada-webapp4 --hostname acada-webapp4 --network acada-app kniru/acadaweb:latest
docker run -d --name acada-webapp5 --hostname acada-webapp5 --network acada-app kniru/acadaweb:latest
docker run -d --name acada-webapp_collins --hostname acada-webapp_collins --network acada-app kniru/acadaweb:latest
