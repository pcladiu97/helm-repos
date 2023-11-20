{{- define "labels" -}}
helm.sh/chart: {{ .Chart.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}
