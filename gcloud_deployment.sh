gcloud config set project gcedemo-173901
gcloud container clusters get-credentials gcedemocluster \
    --zone us-central1-a --project gcedemo-173901

export IMAGE=gcr.io/gcedemo-173901/gkedemoapp:v2
echo $IMAGE

# build container
docker build -t gkedemoapp -f Dockerfile .
# # tag container version
docker tag gkedemoapp $IMAGE
#push to google container registry
gcloud docker -- push $IMAGE

# For SUBSEQUENT DEPLOYMENTS  -------------------------------------------------------------------- BEGIN
kubectl set image deployment web web=$IMAGE --record
kubectl rollout status deployment web
curl --retry 10 --retry-delay 10 -v https://35.186.202.179 -k
# For SUBSEQUENT DEPLOYMENTS  -------------------------------------------------------------------- END

# For FIRST TIME DEPLOYMENT  -------------------------------------------------------------------- BEGIN
# Set up the Deployment and Service
# # create new ones
# kubectl create -f ./kube/web-deployment.yml --record
# kubectl create -f ./kube/web-service-static-lb.yml
# # #
# # # Get deployment details
# kubectl get deployment
# kubectl get pods
# kubectl get services
# kubectl get nodes
# gcloud compute forwarding-rules list
#
#
# # Cert and TLS
# kubectl create secret tls gkecert --key ./ssl_cert/example.key --cert ./ssl_cert/example.crt
# # #
# # # Create the ingress
# kubectl create -f ./kube/gce-tls-ingress.yaml
# kubectl describe ing gke-ingress
# For FIRST TIME DEPLOYMENT  -------------------------------------------------------------------- END
