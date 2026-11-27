# Web stack debugging #4

Fixes an Nginx server that fails many requests under load (ApacheBench: 713 of 2000 failed).

| File | Purpose |
|---|---|
| `0-the_sky_is_the_limit_not.pp` | Puppet manifest that raises the Nginx open files limit and restarts Nginx |

## Problem and fix
| Step | Result |
|---|---|
| `ab -c 100 -n 2000 localhost/` | 713 failed requests |
| Nginx error log | `Too many open files` |
| `/etc/default/nginx` | `ULIMIT="-n 15"` (far too low) |
| Raise `ULIMIT` to 4096, restart Nginx | `Failed requests: 0` |
