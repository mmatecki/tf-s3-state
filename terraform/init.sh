#!/bin/bash

aws s3api create-bucket --bucket ${BUCKET} --region ${AWS_REGION} --create-bucket-configuration LocationConstraint=${AWS_REGION}

cat > terraform.tfvars << EOL
s3_tfstate = {
  bucket = "${BUCKET}"
}

EOL

terraform init -reconfigure \
    -backend-config="bucket="${BUCKET}"" \
    -backend-config="key="${SERVICE_NAME}""

terraform import module.backend.aws_s3_bucket.tfstate_bucket ${BUCKET}

