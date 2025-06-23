{{/*
Expand the name of the chart.
*/}}
{{- define "collector.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common annotations
*/}}
{{- define "collector.annotations" -}}
{{ toYaml .Values.annotations }}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "collector.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "collector.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "collector.labels" -}}
helm.sh/chart: {{ include "collector.chart" . }}
{{- end -}}

{{/*
Create the name of the service account to use. Should be a service account per service, todo think about a generic solution to this scriplet
*/}}
{{- define "collector.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
   {{ .Values.serviceAccount.name }}
{{- else -}}
    {{ "default" }}
{{- end -}}
{{- end -}}

{{/*
 Expose Node Ip
*/}}
{{- define "otel.hostIP" -}}
- name: HOST_IP
  valueFrom:
   fieldRef:
     fieldPath: status.hostIP
{{- end -}}

{{- define "collector.environment" -}}
- name: AWS_REGION
  value: {{ .Values.region }}
{{- end }}