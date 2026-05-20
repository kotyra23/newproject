#!/bin/bash

# Переходим в папку docs
cd ~/devops-spravochnik/docs/линукс

# 1. Переименовываем файл "Права" в "Права.md" (если существует без расширения)
if [ -f "Права" ]; then
    mv "Права" "Права.md"
    echo "✅ Переименован Права → Права.md"
fi

# 2. Создаем файлы для Bash скриптинга
touch bash_скриптинг_основы.md
touch bash_скриптинг_продвинутый.md
echo "✅ Созданы файлы для Bash скриптинга"

# 3. Создаем файл для Docker Compose
cd ~/devops-spravochnik/docs/контейнеры/docker_compose
touch основы.md
echo "✅ Создан файл Docker Compose основы.md"

# 4. Создаем недостающие файлы в других разделах
cd ~/devops-spravochnik/docs

# Kubernetes
touch кубернетес/основы/базы.md
touch кубернетес/сети/конфигурация.md
touch кубернетес/хранение_данных/конфигурация.md
touch кубернетес/безопасность/конфигурация.md
touch кубернетес/операторы/основы.md

# CI/CD
touch сборка_и_доставка/gitlab_ci/пайплайны.md
touch сборка_и_доставка/github_actions/пайплайны.md
touch сборка_и_доставка/jenkins/пайплайны.md

# IaC
touch инфраструктура_как_код/terraform/основы.md
touch инфраструктура_как_код/ansible/основы.md
touch инфраструктура_как_код/pulumi/основы.md

# Monitoring
touch мониторинг/prometheus/конфигурация.md
touch мониторинг/grafana/конфигурация.md
touch мониторинг/loki/конфигурация.md
touch мониторинг/оповещения/конфигурация.md

# Cloud
touch облачные_платформы/aws/основы.md
touch облачные_платформы/yandex_cloud/основы.md
touch облачные_платформы/digitalocean/основы.md

# Special sections
touch инструкции_по_восстановлению/обзор.md
touch шпаргалки_и_команды/обзор.md
touch разборы_инцидентов/обзор.md

echo "✅ Созданы все недостающие файлы"

# 5. Показываем итоговую структуру
echo ""
echo "📁 Итоговая структура папки линукс:"
ls -l ~/devops-spravochnik/docs/линукс/

echo ""
echo "🎉 Готово! Теперь можно обновить mkdocs.yml"
