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
