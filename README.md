This is the Helm setup of OpenAPM.

You need to run follwoing commands,

To install prometheus-operator:
cd /path/to/repo/
helm dependency build ./my-prometheus/
helm install my-prometheus ./my-prometheus -n prometheus --create-namespace

To install Grafana:
cd /path/to/repo/
helm dependency build ./my-grafana/
helm install my-prometheus ./my-grafana -n grafana --create-namespace

To install Mimir:
cd /path/to/repo/
helm dependency build ./my-mimir/
helm install my-prometheus ./my-mimir -n mimir --create-namespace


To uninstall any helm chart which was created earlier:
helm uninstall my-prometheus -n prometheus (same command for grafana and mimir)


