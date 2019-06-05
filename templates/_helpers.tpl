{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "keycloak-gatekeeper.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "keycloak-gatekeeper.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
############################################## Create custom SIX values
*/}}

{{/*
Create unified labels
*/}}
{{- define "keycloak-gatekeeper.matchLabels" -}}
app.kubernetes.io/name: {{ template "keycloak-gatekeeper.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "keycloak-gatekeeper.labels" -}}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ template "keycloak-gatekeeper.chart" . }}
{{ include "keycloak-gatekeeper.matchLabels" . }}
{{- end -}}
