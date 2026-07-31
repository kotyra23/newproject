#!/bin/bash
set -e

cd "$HOME/devops-spravochnik" || { echo "❌ Папка devops-spravochnik не найдена"; exit 1; }
mkdir -p docs/собеседования
cd docs/собеседования
echo "🚀 Создаю раздел в $(pwd)..."

# === index.md ===
cat > index.md << 'MD_EOF'
# 🎯 Подготовка к собеседованию DevOps

Раздел с ответами на **136 типовых вопросов** для DevOps / SRE / SysAdmin.

## 📚 Разделы

| Раздел | Описание |
|--------|----------|
| 🐧 [Linux & OS](linux.md) | Ядро, процессы, systemd |
| 🌐 [Сети](сети.md) | TCP/IP, DNS, HTTP |
| ☸️ [Kubernetes](kubernetes.md) | Архитектура, пробы |
| 🐳 [Docker](docker.md) | Образы, volumes |
| 🔄 [CI/CD, Git, IaC](cicd_iac.md) | Пайплайны, Terraform, Ansible |
| 🗄️ [Базы данных](базы_данных.md) | PostgreSQL, Kafka |
| ⚙️ [Мониторинг](мониторинг.md) | ELK, Prometheus, SLI/SLO |
| 🐍 [Python](python.md) | Основы, ООП |
| 🔍 [Troubleshooting](troubleshooting.md) | Кейсы диагностики |
| ❌ [Типичные ошибки](типичные_ошибки.md) | Провалы на интервью |
MD_EOF

# === linux.md ===
cat > linux.md << 'MD_EOF'
# 🐧 Linux & OS

### № 1. Если сервис упал, как починить?
Диагностика: `du -h`, `ps aux`, `top`. Потом `systemctl restart <service>`.

### № 3. Диски по заполняемости?
`df -h`.

### № 13. Как обезопасить ВМ?
SSH-ключи, `iptables`, ограничение прав доступа.

### № 19. Сервер не отвечает на ping?
Проверить firewall и `sysctl` (ICMP).

### № 20. Типы ICMP?
Reply, Request, Error message, Time exceeded.

### № 21. Сбор инфо без интернета?
Сеть: `ip addr show`, `ip route`. Порты: `ss -tulnp`. Процессы: `ps aux`, `top`.

### № 22. Подключение к ВМ?
SSH-ключи, Teleport/Bastion, SSM (AWS). VPN — устарело.

### № 29. Контейнер?
Изолированный процесс, делит ядро/cgroups/namespaces с хостом.

### № 34. Утилиты Linux?
`top`, `iptables`, `ps aux`, `ss`, `ip`, `journalctl`, `chmod`.

### № 36. Софт 24/7?
`systemd`: unit-файл + `systemctl enable`.

### № 37. Type в systemd?
`simple` (базовый), `forking`, `notify`.

### № 38. Приложение завершилось?
`journalctl` или `docker logs`.

### № 39. Ping без sudo?
Бит `setuid` или `cap_net_raw`.

### № 55. Загрузка Linux?
BIOS/UEFI → GRUB → ядро → rootfs.

### № 56. Сервер лагает?
`htop` + `journalctl`.

### № 57. Load average?
Среднее число процессов в работе/ожидании за 1, 5, 15 мин.

### № 58. Дебаг без логов?
`strace -p <PID>`.

### № 59. IPC?
Сигналы, сокеты, shared memory, pipes.

### № 85. Высокий load?
`htop`. Процессы в `D` → `iostat` (диск).

### № 87. Завис процесс?
`ps -o stat`. Статус `D` = I/O wait.

### № 88. OOM Killer?
Ядро убивает процессы при нехватке RAM.

### № 91. Хардлинк vs симлинк?
Хардлинк — ссылка на inode. Симлинк — ярлык с путём.

### № 103. Системные вызовы?
Запрос услуг у ядра (память, файлы, сеть).

### № 104. Виртуализация?
Абстракция от железа для изолированных ВМ.

### № 111. LVM?
Logical Volume Manager — управление дисками.

### № 129. Порт и зомби?
**Порт** — ID сетевого соединения. **Зомби** — дочерний процесс, родитель не считал exit code.

### № 134. iptables?
Stateful firewall: INPUT, OUTPUT, FORWARD.
MD_EOF

# === сети.md ===
cat > сети.md << 'MD_EOF'
# 🌐 Networking & Security

### № 2. Диагностика сети?
`ip addr` → `ping 8.8.8.8` → `ss -tulnp` → `iptables -L -n -v`.

### № 18. MX запись?
Mail Exchange — почтовый сервер домена.

### № 23. Почему VPN плох?
Даёт доступ ко всей сети. Лучше Zero Trust / Bastion.

### № 24. Порты VPN?
UDP 1194 (OpenVPN), 51820 (WireGuard).

### № 25. Слабый интернет + фильтрация?
WAF/Reverse Proxy на CDN.

### № 26. Zero Trust?
"Никому не доверяй". Каждый запрос проверяется.

### № 28. DMZ?
Изолированная подсеть для публичных сервисов.

### № 30. Процесс vs контейнер?
Процесс быстрее, контейнер — для оркестрации.

### № 31. NAT в Docker?
Мост `docker0` + `iptables` MASQUERADE.

### № 33. Борьба с фишингом?
SPF, DKIM, DMARC, WAF.

### № 42. Маска подсети?
Разделяет IP на сеть и хост.

### № 43. Публичные vs приватные?
Публичный — глобален. Приватный (RFC 1918) — локален, выход через NAT.

### № 44. Провайдер и пакеты?
По IP + таблица маршрутизации (BGP).

### № 45. Резолв хоста?
`/etc/hosts` → резолвер → корневые/TLD/авторитетные серверы.

### № 46. Протокол DNS?
UDP 53, TCP для > 512 байт или AXFR.

### № 47. Безопасность DNS?
DNSSEC + DoH/DoT.

### № 60. Стек TCP/IP?
Прикладной, Транспортный, Сетевой, Канальный.

### № 61. TCP vs UDP?
TCP — надёжный. UDP — быстрый.

### № 62. TCP handshake?
SYN → SYN+ACK → ACK.

### № 63. Ping обязателен?
Нет. Firewall может дропать ICMP.

### № 64. Неправильный IP?
DHCP не ответил (APIPA 169.254.x.x) или конфликт.

### № 65. DHCP?
DORA: Discover → Offer → Request → Ack.

### № 66. NAT?
Подмена IP (SNAT/DNAT) на маршрутизаторе.

### № 70. HTTP?
Протокол прикладного уровня, запрос-ответ.

### № 71. Методы HTTP?
GET, POST, PUT, PATCH, DELETE, HEAD.

### № 72. Коды HTTP?
1xx, 2xx, 3xx, 4xx, 5xx.

### № 73. Версии HTTP?
1.0, 1.1, 2.0, 3.0 (QUIC).

### № 74. HTTPS handshake?
TLS: шифры + сертификат + сессионный ключ.

### № 92. TCP поддержка?
ACK + скользящее окно + keep-alive.

### № 93. Шифрование?
Симметричное — 1 ключ. Асимметричное — пара.

### № 94. ICMP?
В IP-пакете, для диагностики и ошибок.

### № 123. Маршрут?
`ip route` или `traceroute / mtr`.

### № 124. TTL?
Счётчик, защита от петель.

### № 125. Пропускная способность?
`iperf3 -c <ip>`.

### № 126. TCP разорвался?
Гарантия только в рамках сессии.

### № 127. Плюсы HTTPS?
Шифрование + аутентификация + целостность.

### № 128. Заголовки HTTP?
General, Request, Response, Entity.
MD_EOF

# === kubernetes.md ===
cat > kubernetes.md << 'MD_EOF'
# ☸️ Kubernetes

### № 5. Синхронизация мастер-воркер?
apiserver → kubelet (CRI).

### № 9. Деплой в k8s?
`kubectl apply`, `Helm`, GitOps (ArgoCD).

### № 10. StatefulSet vs Deployment?
StatefulSet — stateful, стабильные имена, PVC. Deployment — stateless.

### № 11. Какие приложения?
Node.js, Express, MongoDB, Flask.

### № 17. Самая сложная задача?
k8s в Yandex Cloud с кастомной CNI.

### № 27. Пробы?
- **Liveness** — жив? (рестарт)
- **Readiness** — готов? (убрать из Service)
- **Startup** — запустился?

### № 90. Пробы (повтор)?
Liveness — рестарт, Readiness — балансировка, Startup — защита.

### № 95. DaemonSet?
Один под на ноде (Fluentd, Node Exporter).

### № 96. Taints / Tolerations?
Taints отпугивают, Tolerations разрешают.

### № 97. Requests / Limits?
Requests — гарантия. Limits — потолок (OOM при превышении).

### № 98. Affinity?
Affinity — притягивать. Anti-affinity — разбрасывать.

### № 102. Нода?
Физическая/виртуальная машина в кластере.

### № 105. ReplicaSet / Deployment?
ReplicaSet — число реплик. Deployment — управляет ReplicaSet.

### № 106. Service?
IP/DNS для подов. ClusterIP, NodePort, LoadBalancer, ExternalName.

### № 107. Ingress?
HTTP/HTTPS маршрутизация.

### № 108. Job?
Одноразовая задача.

### № 109. apiVersion?
Схема API (apps/v1, v1).

### № 110. Namespaces?
Логическая изоляция (dev, prod).

### № 114. CrashLoopBackOff?
Контейнер падает, k8s рестартит с задержкой.

### № 120. Логи?
`kubectl logs <pod>` / `-f`.

### № 130. Nginx не отдаёт?
`systemctl status` → `ss -tlnp` → `journalctl` → `curl`.

### № 132. Доступность из контейнера?
Service LoadBalancer/NodePort или Ingress.
MD_EOF

# === docker.md ===
cat > docker.md << 'MD_EOF'
# 🐳 Docker & Containers

### № 12. Оптимизация сборки?
`.dockerignore`, alpine, multi-stage, кэш, объединение RUN.

### № 89. От кого контейнер?
От root — плохо. `USER <non-root>`.

### № 99. Изоляция?
Namespaces + Cgroups.

### № 100. Уменьшить образ?
alpine, объединение RUN, .dockerignore, multi-stage.

### № 101. Команды-слои?
RUN, COPY, ADD.

### № 112. Ограничение ресурсов?
`--memory=512m --cpus=1.0` или `deploy.resources.limits`.

### № 113. Потребление памяти?
`htop` / `docker stats` / `kubectl top pods`.

### № 115. Битый образ?
Пересобрать, `docker buildx`.

### № 115(2). ADD vs COPY?
COPY — копирует. ADD — распаковывает tar, скачивает URL.

### № 116. CMD vs ENTRYPOINT?
ENTRYPOINT — исполняемый файл. CMD — аргументы.

### № 117. Слои?
Кэширование и переиспользование.

### № 118. Multi-stage?
Тяжёлая сборка → лёгкий alpine.

### № 119. Ограничение копирования?
`.dockerignore`.

### № 121. Volumes?
`docker run -v /host:/container`.

### № 122. GitLab Runner?
shell, docker, custom.

### № 133. Сеть контейнера?
Network namespace + veth + bridge.
MD_EOF

# === cicd_iac.md ===
cat > cicd_iac.md << 'MD_EOF'
# 🔄 CI/CD, Git & DevOps

### № 40. IaC?
Инфра в коде (Terraform, Ansible). Git-версионирование.

### № 41. CI/CD?
CI — сборка/тесты. CD — доставка/деплой.

### № 48. Зачем DevOps?
Быстрая доставка, автоматизация.

### № 49. Важнейшая практика?
CI/CD и IaC.

### № 50. Инструменты?
Terraform (Provisioning), Ansible (Config).

### № 51. Push vs Pull?
Pull (ArgoCD) для k8s. Push (Ansible) для ВМ.

### № 52. Этапы Ansible?
Inventory → Playbook → Execution → Idempotency.

### № 75. Микросервисы vs монолит?
Монолит — просто. Микросервисы — независимо.

### № 76. Протоколы?
Синхронные (HTTP/gRPC), асинхронные (Kafka).

### № 77. merge vs rebase?
merge — сохраняет. rebase — линейная (опасно!).

### № 78. Откатить коммит?
`git revert <commit>`.

### № 135. Микросервисы?
Независимые сервисы через API.

### № 136. Монолиты?
Один процесс, один деплой.
MD_EOF

# === базы_данных.md ===
cat > базы_данных.md << 'MD_EOF'
# 🗄️ Databases & Brokers

### № 4. Patroni?
HA-кластер PostgreSQL. DCS (etcd) для лидера и failover.

### № 6. Message брокеры?
Kafka, RabbitMQ.

### № 7. Зачем брокеры?
Посредник: принимает, буферизирует, пересылает.

### № 8. Kafka кластер?
Топики → Партиции. Продюсеры/консьюмеры. Репликация.

### № 14. Проблема Prometheus?
Много RAM/disk. Решение: Thanos/Cortex.

### № 67. Ключ в БД?
Primary Key — ID. Foreign Key — связь.

### № 68. Защита SQL?
Транзакции: BEGIN, COMMIT, ROLLBACK.

### № 69. Ускорить чтение?
Индексы (B-Tree) на WHERE/ORDER BY/JOIN.

### № 131. Тормоза после релиза?
Медленные SQL, нет индекса, блокировки.
MD_EOF

# === мониторинг.md ===
cat > мониторинг.md << 'MD_EOF'
# ⚙️ Monitoring & SRE

### № 15. ELK?
Elasticsearch + Logstash + Kibana.

### № 16. Переменные Ansible?
Inline, Inventory, роли.

### № 32. Зачем мониторинг?
Предупреждение, тренды, узкие места.

### № 53. SLI/SLO/SLA?
- SLI — метрика
- SLO — цель
- SLA — договор со штрафами

### № 54. Error Budget?
Допустимые сбои без нарушения SLO.
MD_EOF

# === python.md ===
cat > python.md << 'MD_EOF'
# 🐍 Python

### № 35. Код без исполняемого?
README → `pip install -r requirements.txt` → собрать → запустить.

### № 79. Ключи словаря?
Неизменяемые: int, float, str, bool, tuple.

### № 80. Неизменяемый тип?
Нельзя изменить после создания.

### № 81. *args и **kwargs?
*args — кортеж позиционных. **kwargs — словарь именованных.

### № 82. Лямбда?
`lambda x: x + 1`.

### № 83. Декоратор?
Функция, расширяющая другую (`@decorator`).

### № 84. ООП?
Инкапсуляция, Наследование, Полиморфизм, Абстракция.
MD_EOF

# === troubleshooting.md ===
cat > troubleshooting.md << 'MD_EOF'
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
MD_EOF

# === типичные_ошибки.md ===
cat > типичные_ошибки.md << 'MD_EOF'
# ❌ Типичные ошибки

## 🚫 Ошибка 1: Односложные ответы
Плохо: "top."
Хорошо: "htop → pidstat → iostat".

## 🚫 Ошибка 2: merge vs rebase
merge — сохраняет. rebase — линейная (опасно!).

## 🚫 Ошибка 3: Liveness vs Readiness
Liveness — рестарт. Readiness — убрать из Service.
Для медленного старта — Startup probe.

## 🚫 Ошибка 4: Забыть .dockerignore
Без него `.git` на 500 МБ в образе.

## 🚫 Ошибка 5: "Не знаю"
Лучше: "Рассуждаю так... В проде посмотрю man/--help."

## 🚫 Ошибка 6: Deployment vs StatefulSet
Deployment — stateless. StatefulSet — stateful.

## 🚫 Ошибка 7: Не упомянуть systemd
nohup/screen — устарело. Правильно: systemd.

## 🚫 Ошибка 8: "VPN медленный"
Правильно: VPN даёт доступ ко всей сети. Zero Trust / Bastion.

---

## 🎯 Чек-лист

- [ ] Повторил Troubleshooting
- [ ] Могу нарисовать k8s на салфетке
- [ ] Знаю top, ss, ip, journalctl, kubectl
- [ ] Понимаю TCP/UDP, Liveness/Readiness, merge/rebase
- [ ] 2-3 истории по STAR
MD_EOF

echo ""
echo "═══════════════════════════════════════════════════════════════"
echo "✅ ВСЕ 11 ФАЙЛОВ СОЗДАНЫ!"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "🚀 Обнови mkdocs.yml (блок nav):"
echo ""
echo "  - Собеседования:"
echo "    - Обзор: собеседования/index.md"
echo "    - Linux: собеседования/linux.md"
echo "    - Сети: собеседования/сети.md"
echo "    - Docker: собеседования/docker.md"
echo "    - Kubernetes: собеседования/kubernetes.md"
echo "    - CI/CD и IaC: собеседования/cicd_iac.md"
echo "    - Базы данных: собеседования/базы_данных.md"
echo "    - Мониторинг: собеседования/мониторинг.md"
echo "    - Python: собеседования/python.md"
echo "    - Troubleshooting: собеседования/troubleshooting.md"
echo "    - Типичные ошибки: собеседования/типичные_ошибки.md"
echo ""
echo "🚀 Затем: mkdocs build && mkdocs serve"
echo "═══════════════════════════════════════════════════════════════"
