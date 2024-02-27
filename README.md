# DeviantArt Site Reliability Engineer Hiring Exercise

Steps:

- Install Rancher Desktop on your computer with Kubernetes enabled: https://rancherdesktop.io
- Write a prometheus exporter in python using the `prometheus-client` library that queries the Coindesk API for the current price of Bitcoin and exports it as a metric named `bitcoin_price` on port 8000 and commit it to this git repository.
- Write a Dockerfile for the prometheus exporter and commit it to this repository.
- Write a .yaml file that deploys the resulting image in the local Kubernetes cluster using the `kubectl apply -f` command and commit it to this repository.
- Deploy prometheus in the local Kubernetes cluster with an ingress with hostname "localhost" on port 80.
- Get the `bitcoin-exporter` metrics into Prometheus and commit the changes to this repository.
- Run the `./submit.sh` script to check your local environment and generate a txt file for us to review.
- Send the resulting `hiring-test-<username>.txt` file to da-sre-hiring-exercise@wix.com for us to review
- ...
- Profit!
