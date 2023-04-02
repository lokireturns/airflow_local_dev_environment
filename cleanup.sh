#Clean up logs, airflow.db, admin password and webserver-pid
docker stop airflow_dev
rm -r airflow-webserver.pid
rm -r airflow.db
rm -r standalone_admin_pasword
rm -r logs/
echo Clean up complete.