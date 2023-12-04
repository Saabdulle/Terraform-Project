resource "aws_dynamodb_table" "lighting_table" {
    name = "LightingAppTable"
    billing_mode = "PROVISIONED"
    read_capacity = 20
    write_capacity = 20
    hash_key = "Id"
    attribute {
      name = "Id"
      type = "N"
    }
    attribute {
      name = "Location"
      type = "S"
    }
    attribute {
      name = "Status"
      type = "B"
    }
    global_secondary_index {
      name = "locIndex"
      hash_key = "Location"
      range_key = "Status"
      write_capacity = 10
      read_capacity = 10
      projection_type = "INCLUDE"
      non_key_attributes = ["Id"]
    }
    tags = {
        Name = "Lighting-table"
        Environment = "production"
    }
}
