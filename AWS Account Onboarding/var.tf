variable "url" {
  default = "<stack>"
}

variable "username" {
  default = "<access key>"
}

variable "password" {
  default = "<secret access key>"
}

# Fetch Supported Features
data "prismacloud_account_supported_features" "prismacloud_supported_features" {
    cloud_type = "aws"
    account_type = "account"
}

# Fetch AWS CFT s3 presigned url based on required features
data "prismacloud_aws_cft_generator" "prismacloud_account_cft" {
    account_type = "account"
    account_id = "xxxxxxx"
    features = data.prismacloud_account_supported_features.prismacloud_supported_features.supported_features
}