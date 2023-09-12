Some instructions for using this local AIrflow development environment. It has a basic setup that works for GCP along with GCP Secrets however you can butcher it to your needs.

## Setup

The first time you spin up the Airflow environment ensure you have:
- Installed the GCP SDK and authenticated your local machine with `gcloud auth application-default login` as Airflow will rely on your machine being authenticated to work with GCP e.g. BigQuery etc.

### Build
Build the environment by running:

```bash
docker compose build
```
## Start Up

You need to specify the following variables:

- `LOCAL_DAGS_FOLDER` to the full path of your dags folder. This is handy as you can therefore switch between Airflow projects by restarting the environment and pointing to the DAGS folder you need to work on.
- `GOOGLE_CLOUD_PROJECT` Your GCP Project ID
- `APP_ENV` An environment identifier. This is useful as we can access it in our DAGs, tasks etc to control configurations.

Start the environment: 

My preferred method is to create or modify a .env file with the following content:

```shell
GOOGLE_CLOUD_PROJECT=your_project_name
LOCAL_DAGS_FOLDER=path_to_your_dags_folder
APP_ENV=your_app_env_value
```

then simple startup with 

```shell
docker compose up
```

Alternatively you can startup with the follwing command:

```shell
GOOGLE_CLOUD_PROJECT=your_project_name \
LOCAL_DAGS_FOLDER=path_to_your_dags_folder \ 
APP_ENV=your_app_env_value docker-compose up
``` 

## Shut Down
Its recommended to run the `sh safe_shutdown.sh` shell script when shutting down the environment.

## Reset
If your environement becomes corrupted for whatever reason. Shut it down and run `sh cleanup.sh` to clean everthing up and start a fresh. (This will not affect your DAGS)