# Firewall

Configures `ufw` on web-01 to block all incoming traffic except TCP ports 22 (SSH), 80 (HTTP) and 443 (HTTPS).

| File | Purpose |
|---|---|
| `0-block_all_incoming_traffic_but` | Installs ufw, denies incoming by default, allows 22, 80, 443, enables the firewall |

| Port | Service | Rule |
|---|---|---|
| 22/tcp | SSH | ALLOW (set before enabling, to avoid lockout) |
| 80/tcp | HTTP | ALLOW |
| 443/tcp | HTTPS | ALLOW |
| all others | n/a | DENY incoming |

## Check
```bash
sudo ufw status verbose
```
