# Load balancer

Two web servers behind one HAProxy load balancer.

| Server | IP | Role |
|---|---|---|
| 7311-web-01 | 18.134.245.178 | Nginx + `X-Served-By` header |
| 7311-web-02 | 35.178.19.144 | Nginx + `X-Served-By` header |
| 7311-lb-01 | 18.133.157.198 | HAProxy, roundrobin |

| File | Purpose |
|---|---|
| `0-custom_http_response_header` | Installs Nginx, adds `X-Served-By: <hostname>` (run on web-01 and web-02) |
| `1-install_load_balancer` | Installs HAProxy, balances web-01/web-02 with roundrobin, enabled as a service (run on lb-01) |

## Test
```bash
for i in 1 2 3 4; do curl -sI http://18.133.157.198 | grep X-Served-By; done
```
Output alternates `7311-web-01` / `7311-web-02`.
