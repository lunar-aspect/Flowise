### Deploy Instructions
`gcloud container clusters get-credentials flowise-prod --region us-west1 --project lunaraspect-9ffa3`
`docker build -t gcr.io/lunaraspect-9ffa3/flowise:prod .`
`docker push gcr.io/lunaraspect-9ffa3/flowise:prod`
`kubectl apply -f yamls/deployment.yaml`
`kubectl apply -f yamls/service.yaml`
