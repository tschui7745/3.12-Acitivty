---
# Source: my-app/templates/deployment.yaml.cpy
apiVersion: apps/v1
kind: Deployment
metadata:
  name: release-name-my-app
  labels:
    helm.sh/chart: my-app-0.1.0
    app.kubernetes.io/name: my-app
    app.kubernetes.io/instance: release-name
    app.kubernetes.io/version: "1.16.0"
    app.kubernetes.io/managed-by: Helm
spec:
  replicas: 3
  selector:
    matchLabels:
      app.kubernetes.io/name: my-app
      app.kubernetes.io/instance: release-name
  template:
    metadata:
      labels:
        helm.sh/chart: my-app-0.1.0
        app.kubernetes.io/name: my-app
        app.kubernetes.io/instance: release-name
        app.kubernetes.io/version: "1.16.0"
        app.kubernetes.io/managed-by: Helm
    spec:
      serviceAccountName: release-name-my-app
      containers:
        - name: my-app
          image: "nginx:latest"
          imagePullPolicy: IfNotPresent
          ports:
            - name: http
              containerPort: 80
              protocol: TCP
          livenessProbe:
            httpGet:
              path: /
              port: http
          readinessProbe:
            httpGet:
              path: /
              port: http
