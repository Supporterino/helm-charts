# shlink

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 4.2.0](https://img.shields.io/badge/AppVersion-4.2.0-informational?style=flat-square)

A Helm chart for Kubernetes

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| externalDatabase | object | `{"driver":"postgres","enabled":false,"host":"","name":"shlink","password":"","port":"","user":"shlink"}` | Define external database driver |
| externalDatabase.driver | string | `"postgres"` | mysql, maria, postgres, mssql |
| externalDatabase.host | string | `""` | The host name of the database server when using an external database driver. |
| externalDatabase.name | string | `"shlink"` | The database name to be used when using an external database driver. Defaults to shlink. |
| externalDatabase.password | string | `""` | The password credential to be used when using an external database driver. |
| externalDatabase.port | string | `""` | The port in which the database service is running when using an external database driver. Default value is based on the value provided for driver |
| externalDatabase.user | string | `"shlink"` | The username credential to be used when using an external database driver. |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"shlinkio/shlink"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| livenessProbe.httpGet.path | string | `"/rest/health"` |  |
| livenessProbe.httpGet.port | string | `"http"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| readinessProbe.httpGet.path | string | `"/rest/health"` |  |
| readinessProbe.httpGet.port | string | `"http"` |  |
| redis | object | `{"enabled":false,"real_time_updates":false,"sentinel":"","servers":""}` | Redis integration |
| redis.real_time_updates | bool | `false` | Tells if the configured redis instance/cluster should also be used to publish real-time updates via redis pub/sub. Defaults to false. |
| redis.sentinel | string | `""` | The name of the sentinel service if you want to use redis sentinel. If this value is provided, the servers provided in REDIS_SERVERS will be considered sentinel instances. |
| redis.servers | string | `""` | A comma-separated list of redis servers which Shlink uses for shared locks, cache, and optionally real-time updates through pub/sub (make sure to include the port number and credentials for every server). |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| shlink | object | `{"base_path":"","cache_namespace":"Shlink","domain":"","geolite_license_key":"","https":true,"initial_api_key":"","memory_limit":"","skip_initial_geolite_download":true,"timezone":"UTC"}` | Application specific settings. See official documentation for more insight. https://shlink.io/documentation/environment-variables/ |
| shlink.base_path | string | `""` | The base path from which you plan to serve Shlink, in case you don’t want to serve it from the root of the domain. It has to start with a bar, like /shlink. Defaults to ''. |
| shlink.cache_namespace | string | `"Shlink"` | Set different cache key if shlink is sharing a redis instance with another instance |
| shlink.domain | string | `""` | Default domain name for your shlink instance |
| shlink.geolite_license_key | string | `""` | Licence key for geolite for tracking. https://shlink.io/documentation/geolite-license-key/ |
| shlink.https | bool | `true` | Tell application if it is running as http or https. Actual https needs to be impelmented yourself. Possible by ingress in this chart |
| shlink.initial_api_key | string | `""` | An API key that will be created once during container start-up, with admin permissions. |
| shlink.memory_limit | string | `""` | The maximum amount of memory that every Shlink process can use. You can provide a number, which will be the amount of memory in bytes, or a number followed by K for kilobytes, M for megabytes or G for gigabytes. You can also provide -1 to set no memory limit. Defaults to 512M. |
| shlink.skip_initial_geolite_download | bool | `true` | If provided with value true, it will skip the initial GeoLite2 db file download, speeding-up the container start-up. As a side effect, first visits on this container will remain un-located until the file finishes downloading in background. |
| shlink.timezone | string | `"UTC"` | Timezone of server for tracking purpose. PHP format https://www.php.net/manual/en/timezones.php |
| shortening.code_length | int | `5` | The length you want generated short codes to have. It defaults to 5 and has to be at least 4, so any value smaller than that will fall back to 4. |
| shortening.delete_threshold | string | `""` | The amount of visits on short URLs which will not allow them to be deleted. If not provided, this restriction will be disabled. |
| shortening.multi_segment | bool | `false` | Allows to create and handle multi-segment custom slugs when true is provided. Default value is false. See multi-segment custom slugs for more information. https://shlink.io/documentation/some-features/#multi-segment-custom-slugs |
| shortening.resolve_titles | bool | `true` | Used to automatically resolve the short URL’s title based on the <title /> tag in the long URL. Defaults to true. |
| shortening.url_mode | string | `"strict"` | strict or loose. Determines how to match short URLs. Defaults to strict. See short URLs mode for more information. https://shlink.io/documentation/some-features/#short-urls-mode |
| tolerations | list | `[]` |  |
| tracking | object | `{"anonymize_ips":true,"disable_ip":false,"disable_param":"","disable_referer":false,"disable_ua":false,"disabled":false,"disabled_ips":"","orphan_visits":true}` | Settings for shlinks tracking https://shlink.io/documentation/tracking-visits/ |
| tracking.anonymize_ips | bool | `true` | Tells if IP addresses from visitors should be obfuscated before storing them in the database. Default value is true |
| tracking.disable_ip | bool | `false` | Tells if tracking of the IP address (and therefore visitors location) should be disabled. Defaults to false |
| tracking.disable_param | string | `""` | The name of a query param that can be used to visit short URLs avoiding the visit to be tracked. This feature won’t be available if no value is provided |
| tracking.disable_referer | bool | `false` | Tells if tracking of the referrer should be disabled. Defaults to false |
| tracking.disable_ua | bool | `false` | Tells if tracking of the user agent should be disabled. Defaults to false |
| tracking.disabled | bool | `false` | Tells if visits tracking should be completely disabled. Defaults to false |
| tracking.disabled_ips | string | `""` | A comma-separated list of IP address patterns from which all tracking should be disabled. It allows providing fixed IP addresses (100.200.80.40), CIDR blocks (192.168.10.0/24) or wildcard patterns (11.22.*.*) |
| tracking.orphan_visits | bool | `true` | Tells if orphan visits should be tracked or not. Defaults to true |
| volumeMounts | list | `[]` |  |
| volumes | list | `[]` |  |

