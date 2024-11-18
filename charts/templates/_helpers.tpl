{{- define "debezium.name" -}}
{{- if .Values.nameOverride -}}
{{- .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end }}



{{- define "debezium.selectorLabels" -}}
app: {{ .Chart.Name }}
connector: {{ include "debezium.name" . }}
{{- end }}

{{- define "debezium.labels" -}}
{{ include "debezium.selectorLabels" . }}
managed-by: {{ .Release.Service | lower }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "debezium.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "debezium.selectorLabels.connect" -}}
app.kubernetes.io/name: {{ include "debezium.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/app: connect
{{- end }}

