# Web stack debugging #3

Fixes a WordPress site on a LAMP stack that returns HTTP 500.

| File | Purpose |
|---|---|
| `0-strace_is_your_friend.pp` | Puppet manifest that fixes the typo causing the 500 error |

## Problem and fix
| Step | Result |
|---|---|
| `curl -sI 127.0.0.1` | HTTP 500 Internal Server Error |
| `strace` on the Apache processes | Showed a failed open of `class-wp-locale.phpp` (typo) |
| `grep -rn "phpp" /var/www/html/` | Found it in `wp-settings.php`, line 137 |
| `sed -i s/phpp/php/g` on `wp-settings.php` | Typo fixed |
| `curl -sI 127.0.0.1` | HTTP 200 OK |
