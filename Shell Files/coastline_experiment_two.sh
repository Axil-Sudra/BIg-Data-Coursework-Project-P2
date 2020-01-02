cd cloudml-samples/coastline/

# ----- Dropout=0.1 -----
export PROJECT=$(gcloud config list project --format "value(core.project)")
export JOB_ID="coastline_drop_1_${USER}"
export BUCKET="gs://${PROJECT}-ml"
export GCS_PATH="${BUCKET}/${USER}/${JOB_ID}"
export DICT_FILE=${BUCKET}/dict.txt
export MODEL_NAME=coastline_drop_1
export VERSION_NAME=v1

gcloud ml-engine jobs submit training "$JOB_ID" \
 --stream-logs \
 --module-name trainer.task \
 --package-path trainer \
 --staging-bucket "$BUCKET" \
 --region us-central1 \
 --runtime-version=1.10 \
 -- \
 --max_steps=5000 \
 --dropout=0.1 \
 --eval_set_size=2343 \
 --label_count=18 \
 --output_path "${GCS_PATH}/training" \
 --eval_data_paths "${BUCKET}/${USER}/coastline_${USER}/preproc/eval*" \
 --train_data_paths "${BUCKET}/${USER}/coastline_${USER}/preproc/train*"

gcloud ml-engine models create "$MODEL_NAME" \
  --regions us-central1

gcloud ml-engine versions create "$VERSION_NAME" \
  --model "$MODEL_NAME" \
  --origin "${GCS_PATH}/training/model" \
  --runtime-version=1.10

# ----- Dropout=0.5 -----
export PROJECT=$(gcloud config list project --format "value(core.project)")
export JOB_ID="coastline_drop_2_${USER}"
export BUCKET="gs://${PROJECT}-ml"
export GCS_PATH="${BUCKET}/${USER}/${JOB_ID}"
export DICT_FILE=${BUCKET}/dict.txt
export MODEL_NAME=coastline_drop_2
export VERSION_NAME=v1

gcloud ml-engine jobs submit training "$JOB_ID" \
 --stream-logs \
 --module-name trainer.task \
 --package-path trainer \
 --staging-bucket "$BUCKET" \
 --region us-central1 \
 --runtime-version=1.10 \
 -- \
 --max_steps=5000 \
 --dropout=0.5 \
 --eval_set_size=2343 \
 --label_count=18 \
 --output_path "${GCS_PATH}/training" \
 --eval_data_paths "${BUCKET}/${USER}/coastline_${USER}/preproc/eval*" \
 --train_data_paths "${BUCKET}/${USER}/coastline_${USER}/preproc/train*"

gcloud ml-engine models create "$MODEL_NAME" \
  --regions us-central1

gcloud ml-engine versions create "$VERSION_NAME" \
  --model "$MODEL_NAME" \
  --origin "${GCS_PATH}/training/model" \
  --runtime-version=1.10

# ----- Dropout=0.9 -----
export PROJECT=$(gcloud config list project --format "value(core.project)")
export JOB_ID="coastline_drop_3_${USER}"
export BUCKET="gs://${PROJECT}-ml"
export GCS_PATH="${BUCKET}/${USER}/${JOB_ID}"
export DICT_FILE=${BUCKET}/dict.txt
export MODEL_NAME=coastline_drop_3
export VERSION_NAME=v1

gcloud ml-engine jobs submit training "$JOB_ID" \
 --stream-logs \
 --module-name trainer.task \
 --package-path trainer \
 --staging-bucket "$BUCKET" \
 --region us-central1 \
 --runtime-version=1.10 \
 -- \
 --max_steps=5000 \
 --dropout=0.9 \
 --eval_set_size=2343 \
 --label_count=18 \
 --output_path "${GCS_PATH}/training" \
 --eval_data_paths "${BUCKET}/${USER}/coastline_${USER}/preproc/eval*" \
 --train_data_paths "${BUCKET}/${USER}/coastline_${USER}/preproc/train*"

gcloud ml-engine models create "$MODEL_NAME" \
  --regions us-central1

gcloud ml-engine versions create "$VERSION_NAME" \
  --model "$MODEL_NAME" \
  --origin "${GCS_PATH}/training/model" \
  --runtime-version=1.10