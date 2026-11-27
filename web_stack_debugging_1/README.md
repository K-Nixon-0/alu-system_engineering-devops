# Web stack debugging #1

Fixes a container where Nginx does not listen on port 80.

| File | Purpose |
|---|---|
| `0-nginx_likes_port_80` | Changes the Nginx listen port from 8080 to 80 and restarts Nginx |

## Problem and fix
| Step | Result |
|---|---|
| `curl 0:80` | Connection refused |
| `ss -ltnp \| grep nginx` | Nginx was listening on 8080, not 80 |
| `sed -i 's/8080/80/g' /etc/nginx/sites-enabled/default` | Port changed in the active site config |
| `service nginx restart` | Nginx now listens on port 80 |
| `curl 0:80` | Returns the Nginx welcome page |
