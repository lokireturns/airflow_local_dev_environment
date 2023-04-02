# Stop container & delete webserver pid
docker stop airflow_dev
rm -r airflow-webserver.pid
echo Airflow standalone shutdown complete.