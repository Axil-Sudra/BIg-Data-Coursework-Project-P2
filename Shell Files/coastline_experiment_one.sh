cd cloudml-samples/coastline/

# ----- STANDARDGPU -----

export PROJECT=$(gcloud config list project --format "value(core.project)")
export JOB_ID="coastline_standard_GPU_${USER}"
export BUCKET="gs://${PROJECT}-ml"
export GCS_PATH="${BUCKET}/${USER}/${JOB_ID}"
export DICT_FILE=${BUCKET}/dict.txt
export MODEL_NAME=coastline_standard_GPU
export VERSION_NAME=v1

gcloud beta ml-engine jobs submit training "$JOB_ID" \
 --stream-logs \
 --module-name trainer.task \
 --package-path trainer \
 --staging-bucket "$BUCKET" \
 --region us-east1 \
 --runtime-version=1.10 \
 --scale-tier custom \
 --master-machine-type standard_gpu \
 -- \
 --max_steps=5000 \
 --eval_set_size=2343 \
 --label_count=18 \
 --output_path "${GCS_PATH}/training" \
 --eval_data_paths "${BUCKET}/${USER}/coastline_${USER}/preproc/eval*" \
 --train_data_paths "${BUCKET}/${USER}/coastline_${USER}/preproc/train*"

gcloud ml-engine models create "$MODEL_NAME" \
 --regions us-east1

gcloud ml-engine versions create "$VERSION_NAME" \
 --model "$MODEL_NAME" \
 --origin "${GCS_PATH}/training/model" \
 --runtime-version=1.10

# ----- COMPLEXMGPU -----

export PROJECT=$(gcloud config list project --format "value(core.project)")
export JOB_ID="coastline_complex_GPU_${USER}"
export BUCKET="gs://${PROJECT}-ml"
export GCS_PATH="${BUCKET}/${USER}/${JOB_ID}"
export DICT_FILE=${BUCKET}/dict.txt
export MODEL_NAME=coastline_complex_M_GPU
export VERSION_NAME=v1

gcloud beta ml-engine jobs submit training "$JOB_ID" \
 --stream-logs \
 --module-name trainer.task \
 --package-path trainer \
 --staging-bucket "$BUCKET" \
 --region us-east1 \
 --runtime-version=1.10 \
 --scale-tier custom \
 --master-machine-type complex_model_m_gpu \
 -- \
 --max_steps=5000 \
 --eval_set_size=2343 \
 --label_count=18 \
 --output_path "${GCS_PATH}/training" \
 --eval_data_paths "${BUCKET}/${USER}/coastline_${USER}/preproc/eval*" \
 --train_data_paths "${BUCKET}/${USER}/coastline_${USER}/preproc/train*"

gcloud ml-engine models create "$MODEL_NAME" \
 --regions us-east1

gcloud ml-engine versions create "$VERSION_NAME" \
 --model "$MODEL_NAME" \
 --origin "${GCS_PATH}/training/model" \
 --runtime-version=1.10

# ----- HIGHCPU16 -----

export PROJECT=$(gcloud config list project --format "value(core.project)")
export JOB_ID="coastline_high_CPU_16_${USER}"
export BUCKET="gs://${PROJECT}-ml"
export GCS_PATH="${BUCKET}/${USER}/${JOB_ID}"
export DICT_FILE=${BUCKET}/dict.txt
export MODEL_NAME=coastline_high_CPU_16
export VERSION_NAME=v1

gcloud beta ml-engine jobs submit training "$JOB_ID" \
 --stream-logs \
 --module-name trainer.task \
 --package-path trainer \
 --staging-bucket "$BUCKET" \
 --region us-east1 \
 --runtime-version=1.10 \
 --scale-tier custom \
 --master-machine-type n1-highcpu-16 \
 -- \
 --max_steps=5000 \
 --eval_set_size=2343 \
 --label_count=18 \
 --output_path "${GCS_PATH}/training" \
 --eval_data_paths "${BUCKET}/${USER}/coastline_${USER}/preproc/eval*" \
 --train_data_paths "${BUCKET}/${USER}/coastline_${USER}/preproc/train*"

gcloud ml-engine models create "$MODEL_NAME" \
 --regions us-east1

gcloud ml-engine versions create "$VERSION_NAME" \
 --model "$MODEL_NAME" \
 --origin "${GCS_PATH}/training/model" \
 --runtime-version=1.10

# ----- HIGHCPU32 -----

export PROJECT=$(gcloud config list project --format "value(core.project)")
export JOB_ID="coastline_high_CPU_32_${USER}"
export BUCKET="gs://${PROJECT}-ml"
export GCS_PATH="${BUCKET}/${USER}/${JOB_ID}"
export DICT_FILE=${BUCKET}/dict.txt
export MODEL_NAME=coastline_high_CPU_32
export VERSION_NAME=v1

gcloud beta ml-engine jobs submit training "$JOB_ID" \
 --stream-logs \
 --module-name trainer.task \
 --package-path trainer \
 --staging-bucket "$BUCKET" \
 --region us-east1 \
 --runtime-version=1.10 \
 --scale-tier custom \
 --master-machine-type n1-highcpu-32 \
 -- \
 --max_steps=5000 \
 --eval_set_size=2343 \
 --label_count=18 \
 --output_path "${GCS_PATH}/training" \
 --eval_data_paths "${BUCKET}/${USER}/coastline_${USER}/preproc/eval*" \
 --train_data_paths "${BUCKET}/${USER}/coastline_${USER}/preproc/train*"

gcloud ml-engine models create "$MODEL_NAME" \
 --regions us-east1

gcloud ml-engine versions create "$VERSION_NAME" \
 --model "$MODEL_NAME" \
 --origin "${GCS_PATH}/training/model" \
 --runtime-version=1.10

# ----- HIGHCPU16W -----

export PROJECT=$(gcloud config list project --format "value(core.project)")
export JOB_ID="coastline_high_CPU_16W_${USER}"
export BUCKET="gs://${PROJECT}-ml"
export GCS_PATH="${BUCKET}/${USER}/${JOB_ID}"
export DICT_FILE=${BUCKET}/dict.txt
export MODEL_NAME=coastline_high_CPU_16W
export VERSION_NAME=v1

gcloud beta ml-engine jobs submit training "$JOB_ID" \
 --stream-logs \
 --module-name trainer.task \
 --package-path trainer \
 --staging-bucket "$BUCKET" \
 --region us-east1 \
 --runtime-version=1.10 \
 --scale-tier custom \
 --master-machine-type n1-highcpu-16 \
 --master-accelerator count=4,type=nvidia-tesla-k80 \
 --worker-server-count 6 \
 --worker-machine-type n1-highcpu-16 \
 --worker-accelerator count=4,type=nvidia-tesla-k80 \
 --parameter-server-count 3 \
 --parameter-server-machine-type n1-highmem-8 \
 -- \
 --max_steps=5000 \
 --eval_set_size=2343 \
 --label_count=18 \
 --output_path "${GCS_PATH}/training" \
 --eval_data_paths "${BUCKET}/${USER}/coastline_${USER}/preproc/eval*" \
 --train_data_paths "${BUCKET}/${USER}/coastline_${USER}/preproc/train*"

gcloud ml-engine models create "$MODEL_NAME" \
 --regions us-east1

gcloud ml-engine versions create "$VERSION_NAME" \
 --model "$MODEL_NAME" \
 --origin "${GCS_PATH}/training/model" \
 --runtime-version=1.10

# ----- HIGHCPU32W -----

export PROJECT=$(gcloud config list project --format "value(core.project)")
export JOB_ID="coastline_high_CPU_32W_${USER}"
export BUCKET="gs://${PROJECT}-ml"
export GCS_PATH="${BUCKET}/${USER}/${JOB_ID}"
export DICT_FILE=${BUCKET}/dict.txt
export MODEL_NAME=coastline_high_CPU_32W
export VERSION_NAME=v1

gcloud beta ml-engine jobs submit training "$JOB_ID" \
 --stream-logs \
 --module-name trainer.task \
 --package-path trainer \
 --staging-bucket "$BUCKET" \
 --region us-east1 \
 --runtime-version=1.10 \
 --scale-tier custom \
 --master-machine-type n1-highcpu-32 \
 --master-accelerator count=4,type=nvidia-tesla-k80 \
 --worker-server-count 6 \
 --worker-machine-type n1-highcpu-32 \
 --worker-accelerator count=4,type=nvidia-tesla-k80 \
 --parameter-server-count 3 \
 --parameter-server-machine-type n1-highmem-16 \
 -- \
 --max_steps=5000 \
 --eval_set_size=2343 \
 --label_count=18 \
 --output_path "${GCS_PATH}/training" \
 --eval_data_paths "${BUCKET}/${USER}/coastline_${USER}/preproc/eval*" \
 --train_data_paths "${BUCKET}/${USER}/coastline_${USER}/preproc/train*"

gcloud ml-engine models create "$MODEL_NAME" \
 --regions us-east1

gcloud ml-engine versions create "$VERSION_NAME" \
 --model "$MODEL_NAME" \
 --origin "${GCS_PATH}/training/model" \
 --runtime-version=1.10