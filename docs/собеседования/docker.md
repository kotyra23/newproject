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
