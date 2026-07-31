# 🔍 Troubleshooting — кейсы

## Универсальный алгоритм

1. Изолировать — сеть/диск/CPU/RAM/приложение?
2. Метрики — `top`, `htop`, `iostat`, `ss`, `dmesg`.
3. Логи — `journalctl -xe`, `docker logs`, `kubectl logs`.
4. Изменения — что деплоили вчера?
5. Восстановить — откат или эскалация.

---

## 🧩 Кейс 1: Сервер лагает (№ 56)

    htop                      # CPU/RAM
    uptime                    # load
    iostat -xz 1              # %util > 90 — диск
    pidstat -p <PID> 1        # детализация
    journalctl -u <service> --since "1 hour ago"

---

## 🧩 Кейс 2: CrashLoopBackOff (№ 114)

    kubectl describe pod <pod>
    kubectl logs <pod> --previous

Причины: exception, OOM, liveness probe, архитектура.

---

## 🧩 Кейс 3: Nginx не отдаёт (№ 130)

    systemctl status nginx
    ss -tlnp | grep :80
    journalctl -u nginx --since "10 min ago"
    curl -v http://localhost

---

## 🧩 Кейс 4: Приложение без логов (№ 58)

    strace -f -p <PID> -e trace=open,openat,write,network

---

## 🧩 Кейс 5: Сеть не работает (№ 2)

    ip addr show
    ip route
    ping -c 4 8.8.8.8
    dig ya.ru
    nc -zv <host> 443
    sudo iptables -L -n -v

---

## 🧩 Кейс 6: БД тормозит (№ 131)

- `pg_stat_statements` — медленные SQL
- `EXPLAIN ANALYZE` — план
- `pg_locks` — блокировки
- `max_connections`

---

## 🧩 Кейс 7: Ошибка 500 (№ 86)

    curl -v http://example.com/api
    journalctl -u myapp | grep ERROR
    tail -f /var/log/nginx/error.log
    psql -h localhost -U user -d db -c "SELECT 1"
    redis-cli ping
    df -h
    htop

Причины: exception, БД, OOM, внешний API.
