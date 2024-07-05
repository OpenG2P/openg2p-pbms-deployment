{{/*
Create the name of the service account to use
*/}}
{{- define "pbms.beneficiary-portal.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (printf "%s" (include "common.names.fullname" .)) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Render Env values section
*/}}
{{- define "pbms.beneficiary-portal.baseEnvVars" -}}
{{- $context := .context -}}
{{- range $k, $v := .envVars }}
- name: {{ $k }}
{{- if or (kindIs "int64" $v) (kindIs "float64" $v) (kindIs "bool" $v) }}
  value: {{ $v | quote }}
{{- else if kindIs "string" $v }}
  value: {{ include "common.tplvalues.render" ( dict "value" $v "context" $context ) | squote }}
{{- else }}
  valueFrom: {{- include "common.tplvalues.render" ( dict "value" $v "context" $context ) | nindent 4}}
{{- end }}
{{- end }}
{{- end -}}

{{- define "pbms.beneficiary-portal.envVars" -}}
{{- $envVars := merge (deepCopy .Values.envVars) (deepCopy .Values.envVarsFrom) -}}
{{- include "pbms.beneficiary-portal.baseEnvVars" (dict "envVars" $envVars "context" $) }}
{{- end -}}

{{- define "pbms.beneficiary-portal.ui.envVars" -}}
{{- $envVars := merge (deepCopy .Values.selfserviceUi.envVars) (deepCopy .Values.selfserviceUi.envVarsFrom) -}}
{{- include "pbms.beneficiary-portal.baseEnvVars" (dict "envVars" $envVars "context" $) }}
{{- end -}}
