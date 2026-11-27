# Web stack debugging #0

Fixes a broken Docker container so that Apache serves a page containing `Hello Holberton` on port 80.

| File | Purpose |
|---|---|
| `0-give_me_a_page` | Starts the Apache web server in the container |

## Problem and fix
| Step | Result |
|---|---|
| `service apache2 status` | Apache was not running |
| `service apache2 start` | Apache started (the `AH00558` ServerName warning is harmless) |
| `curl localhost` | Returns `Hello Holberton` |

## Check
```bash
curl localhost
```
