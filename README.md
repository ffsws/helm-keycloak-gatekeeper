# Helm chart for Keycloak Gatekeeper

## Description
Secure applications by putting light weight keycloak gatekeeper in front of them.

## Setup tiller

Follow the [link](https://helm.sh/docs/install/)

## Setup Helm

Download helm from [here](https://github.com/helm/helm/releases).

```bash
# set tiller namespace
export TILLER_NAMESPACE=<TILLER_NAMESPACE>
# set application namespace
export NAMESPACE=<NAMESPACE>
```

## Install chart
### dry run

```bash
helm install --name keycloak-gatekeeper . --dry-run --debug --namespace $NAMESPACE
```

### install

```bash
helm install --name keycloak-gatekeeper . --namespace $NAMESPACE
```

## Upgrade chart

```bash
helm upgrade keycloak-gateekeeper . --install --namespace $NAMESPACE
```

## Delete chart

```bash
helm delete --purge keycloak-gateekeeper
```

## configuration

The values.yaml contains the configuration for keycloak-gatekeeper:
- podAnnotations: list of additional pod annotations
- podLabels: list of additional pod labels
- roles: list of Realm roles. The user is authorized when he is part at least of one Realm role.

## App redirection
Keycloak gatekeeper will redirect the final users to an application using internal OpenShift service (e.g. securing Prometheus service)
```yaml
app:
  # Application name
  name: prometheus
  service:
    ## OpenShift Service name
    name: prometheus.<NAMESPACE>.svc
    ## OpenShift Service port
    port: 9090
```

## Monitoring
Monitoring can be set up to get some statistics based on the return code of the requests of keycloak gatekeeper. To enable that, add podAnnotations as described in values.yaml
```yaml
  podAnnotations:
    prometheus.io/path: "oauth/metrics"
    prometheus.io/port: "3000"
    prometheus.io/scrape: "true"
```

See [here](https://www.keycloak.org/docs/4.8/securing_apps/index.html#endpoints) for the documentation.

## Known issues
TBD