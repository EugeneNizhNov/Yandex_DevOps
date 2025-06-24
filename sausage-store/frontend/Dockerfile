# =============================================
# 1. Сборка фронтенда (React/Angular/Vue)
# =============================================
FROM node:16.20.0-alpine3.18 as frontend-builder
WORKDIR /usr/src/app

# Копируем зависимости и устанавливаем их
COPY frontend/package.json frontend/package-lock.json ./
RUN npm ci --silent

# Копируем исходный код и собираем
COPY frontend/ .
RUN npm run build

# =============================================
# 2. Финальный образ для фронтенда (Nginx)
# =============================================
FROM nginx:stable-alpine3.17-slim as frontend
COPY --from=frontend-builder /usr/src/app/dist /usr/share/nginx/html
COPY frontend/nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80

# =============================================
# 3. Образ для nginx-proxy (отдельный сервис)
# =============================================
FROM nginxproxy/nginx-proxy:1.5 as nginx-proxy
COPY frontend/nginx.tmpl /app/nginx.tmpl
EXPOSE 80