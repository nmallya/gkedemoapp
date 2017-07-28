# README

kubectl create secret generic cloudsql-instance-credentials \
                        --from-file=credentials.json=./private/gcedemo.json

kubectl create secret generic cloudsql-db-credentials --from-literal=username=dogs_admin --from-literal=password=password
