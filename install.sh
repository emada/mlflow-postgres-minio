#!/bin/bash

INSTALL_DIR=/etc/docker/compose/mlflow

rm -f /etc/systemd/system/mlflow.service
cp mlflow.service /etc/systemd/system/mlflow.service

rm -rf ${INSTALL_DIR}
mkdir -p ${INSTALL_DIR}
cp .env ${INSTALL_DIR}
cp docker-compose.yml ${INSTALL_DIR}
cp mlflow.Dockerfile ${INSTALL_DIR}
cp README.md ${INSTALL_DIR}
cp requirements.txt ${INSTALL_DIR}

systemctl daemon-reload

echo "MLflow service successfully installed!"
echo "You can now delete this installation folder including the .env file."
echo "Use 'systemctl start mlflow' to start MLflow"
