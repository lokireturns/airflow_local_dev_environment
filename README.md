Some instructions for using this local AIrflow development environment. It has a basic setup that works for GCP along with GCP Secrets however you can butcher it to your needs.

## Setup

The first time you spin up the Airflow environment ensure you have:
- Installed the GCP SDK and authenticated your local machine with `gcloud auth application-default login` as Airflow will rely on your machine being authenticated to work with GCP e.g. BigQuery etc.

### Build Image
set your local `ENV` variable `LOCAL_DAGS_FOLDER` to the full path of your dags folder. This is handy as you can therefore switch between Airflow projects by restarting the environment and pointing to the DAGS folder you need to work on.

```bash
export LOCAL_DAGS_FOLDER=<full path to my dags folder>
export APP_ENV=<staging or production or development>
```

Build the environment & point to your GCP project by running:

```bash
docker compose build --build-arg GOOGLE_CLOUD_PROJECT=<your project id>
```

Since docker layers the image if you need to change the dags folder you can rebuild by re running the above.
## Start Up

Start the environment with `docker compose up` 

## Shut Down
Its recommended to run the `sh safe_shutdown.sh` shell script when shutting down the environment.

## Reset
If your environement becomes corrupted for whatever reason. Shut it down and run `sh cleanup.sh` to clean everthing up and start a fresh. (This will not affect your DAGS)