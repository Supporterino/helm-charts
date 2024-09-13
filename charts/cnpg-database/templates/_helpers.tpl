{{/*
Expand the name of the chart.
*/}}
{{- define "cnpg-database.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "cnpg-database.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "cnpg-database.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "cnpg-database.labels" -}}
helm.sh/chart: {{ include "cnpg-database.chart" . }}
{{ include "cnpg-database.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "cnpg-database.selectorLabels" -}}
app.kubernetes.io/name: {{ include "cnpg-database.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "cnpg-database.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "cnpg-database.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Calculate postgres shared buffers
*/}}
{{- define "cnpg-database.sharedBufferSize" -}}
{{- $memory := .Values.resources.requests.memory -}}
{{- if hasSuffix "Gi" $memory -}}
  {{- $valueGi := trimSuffix "Gi" $memory | int -}}
  {{- $resultGB := mulf $valueGi 0.25 -}}
  {{- if lt $resultGB 1.0 -}}
    {{- $resultMB := mulf $resultGB 1000 | int -}}
    {{- printf "%dMB" $resultMB -}}
  {{- else -}}
    {{- $result := round $resultGB 0 | int -}}
    {{- printf "%dGB" $result -}}
  {{- end -}}
{{- else if hasSuffix "Mi" $memory -}}
  {{- $valueMi := trimSuffix "Mi" $memory | int -}}
  {{- $resultMB := mulf $valueMi 0.25 -}}
  {{- $result := round $resultMB 0 | int -}}
  {{- printf "%dMB" $result -}}
{{- else -}}
  {{- printf "128MB" -}}
{{- end -}}
{{- end -}}