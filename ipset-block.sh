#!/usr/bin/env bash
# Blocca IP che superano 100 richieste/minuto, a livello di kernel.
set -e
ipset create ge_bad hash:ip timeout 3600 -exist
ipset create ge_allow hash:ip timeout 86400 -exist

# Regola iptables: se gia' bannato -> DROP
iptables -I INPUT -m set --match-set ge_bad src -j DROP 2>/dev/null || true

# Parser log nginx: banna chi spamma
tail -F /var/log/nginx/access.log | while read -r line; do
  ip=$(echo "$line" | awk '{print $1}')
  [ -z "$ip" ] && continue
  # se l'IP fa piu' di 100 req in 60s
  count=$(grep -c "$ip" <(tail -n 5000 /var/log/nginx/access.log))
  if [ "$count" -gt 100 ]; then
    ipset add ge_bad "$ip" timeout 3600 -exist 2>/dev/null || true
  fi
done
