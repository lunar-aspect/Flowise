### Deploy Instructions
`gcloud container clusters get-credentials flowise-dev --region us-west1 --project lunaraspect-dev`
`docker build -t gcr.io/lunaraspect-dev/flowise:dev .`
`docker push gcr.io/lunaraspect-dev/flowise:dev`
`kubectl apply -f yamls/deployment.yaml`
`kubectl apply -f yamls/service.yaml`
`kubectl apply -f yamls/managed-cert.yaml`
`kubectl apply -f yamls/ingress.yaml`
