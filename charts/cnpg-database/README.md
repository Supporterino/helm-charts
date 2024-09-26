# cnpg-database

![Version: 1.4.0](https://img.shields.io/badge/Version-1.4.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 16.4-5](https://img.shields.io/badge/AppVersion-16.4--5-informational?style=flat-square)

A Helm chart for Kubernetes

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| authentication.clusterSuperUser.enable | bool | `true` |  |
| authentication.clusterSuperUser.password | string | `""` |  |
| authentication.clusterSuperUser.username | string | `""` |  |
| authentication.clusterUser.password | string | `""` |  |
| authentication.clusterUser.username | string | `""` |  |
| cluster.backup.endpointURL | string | `"http://minio.minio.svc.cluster.local:9000"` |  |
| cluster.backup.retentionPolicy | string | `"30d"` |  |
| cluster.backup.s3_access_key_id | string | `""` |  |
| cluster.backup.s3_access_secret_key | string | `""` |  |
| cluster.backup.schedule | string | `"0 10 0 * * *"` |  |
| cluster.spec.enablePDB | bool | `true` |  |
| cluster.spec.instances | int | `2` |  |
| cluster.spec.postgresGID | int | `65534` |  |
| cluster.spec.postgresUID | int | `65534` |  |
| cluster.spec.primaryUpdateMethod | string | `"switchover"` |  |
| cluster.spec.primaryUpdateStrategy | string | `"unsupervised"` |  |
| cluster.storage.size | string | `"10Gi"` |  |
| cluster.storage.storageClass | string | `"nfs"` |  |
| clusterName | string | `"test-db"` |  |
| databaseName | string | `"dummy"` |  |
| image.repository | string | `"ghcr.io/cloudnative-pg/postgresql"` |  |
| image.tag | string | `""` |  |
| postgresql.parameters."auto_explain.log_min_duration" | string | `"10s"` |  |
| postgresql.parameters."pg_stat_statements.max" | string | `"10000"` |  |
| postgresql.parameters."pg_stat_statements.track" | string | `"all"` |  |
| resources.requests.cpu | string | `"100m"` |  |
| resources.requests.memory | string | `"1Gi"` |  |

