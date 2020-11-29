resource "aws_dynamodb_table" "dynamodbtable" {
  name           = "egov"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "UserId"
  range_key      = "egovtitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "egovtitle"
    type = "S"
  }

  attribute {
    name = "TopScore"
    type = "N"
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }

  global_secondary_index {
    name               = "egovTitleIndex"
    hash_key           = "egovtitle"
    range_key          = "TopScore"
    write_capacity     = 10
    read_capacity      = 10
    projection_type    = "INCLUDE"
    non_key_attributes = ["UserId"]
  }

  tags = {
    Name        = "dyno-table-egov"
    Environment = "test"
  }
}
