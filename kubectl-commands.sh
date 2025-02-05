kubectl create namespace clickhouse

kubectl get secret --namespace clickhouse my-release-clickhouse -o jsonpath="{.data.admin-password}"

# [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("<Base64-encoded-password>"))


