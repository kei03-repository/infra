output "subnet_ids" {
  value = [
    for subnet_key in sort(keys(aws_subnet.this)) : aws_subnet.this[subnet_key].id
  ]
}

output "subnet_ids_by_key" {
  value = {
    for subnet_key, subnet in aws_subnet.this : subnet_key => subnet.id
  }
}