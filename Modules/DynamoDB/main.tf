resource "aws_dynamodb_table" "lighting_table" {
    name = "Lighting-Table"
    billing_mode = "PROVISIONED"
    read_capacity = 20
    write_capacity = 20
    hash_key = "id"
    attribute {
      name = "id"
      type = "N"
    }
#     attribute {
#       name = "location"
#       type = "S"
#     }
#  attribute {
#   name= "status"
#   type = "B"
#  }
#     global_secondary_index {
#       name = "index"
#       hash_key = "location"
#       range_key = "status"
#       write_capacity = 10
#       read_capacity = 10
#       projection_type = "INCLUDE"
#       non_key_attributes = ["id"]
#     }
    tags = {
        Name = "Lighting-table"
        Environment = "production"
    }
}
resource "aws_dynamodb_table" "heating_table" {
    name = "heating"
    billing_mode = "PROVISIONED"
    read_capacity = 20
    write_capacity = 20
    hash_key = "id"
    attribute {
      name = "id"
      type = "N"
    }

    tags = {
        Name = "Heating-Table"
        Environment = "production"
    }
}
