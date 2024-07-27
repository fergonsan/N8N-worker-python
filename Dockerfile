# Usa la imagen base de n8n
FROM n8nio/n8n:latest

# Instala Python, pip y virtualenv
USER root
RUN apk add --no-cache python3 py3-pip

# Crear un entorno virtual y activar
RUN python3 -m venv /opt/venv

# Instalar la librería yfinance en el entorno virtual
RUN /opt/venv/bin/pip install yfinance

# Añadir el entorno virtual al PATH
ENV PATH="/opt/venv/bin:$PATH"

# Vuelve al usuario n8n
USER node

# Establece el directorio de trabajo
WORKDIR /data

# Exponer el puerto por defecto de n8n
EXPOSE 5678

# Comando por defecto para ejecutar n8n
ENTRYPOINT ["tini", "--"]
CMD ["n8n"]
