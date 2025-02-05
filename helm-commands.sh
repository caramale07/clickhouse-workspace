helm install my-release oci://registry-1.docker.io/bitnamicharts/clickhouse --namespace clickhouse --create-namespace -f clickhouse-values.yaml

helm upgrade my-release oci://registry-1.docker.io/bitnamicharts/clickhouse --namespace clickhouse --create-namespace -f clickhouse-values.yaml

helm uninstall my-release oci://registry-1.docker.io/bitnamicharts/clickhouse --namespace clickhouse