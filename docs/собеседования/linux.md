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
