output "vpc_id" { value = module.network.vpc_id }
output "alb_dns_name" { value = module.alb.alb_dns_name }
output "ecs_cluster_name" { value = module.ecs_cluster.cluster_name }
output "backend_ecr_repository_url" { value = module.ecr_backend.repository_url }
output "frontend_ecr_repository_url" { value = module.ecr_frontend.repository_url }
output "artifact_bucket_id" { value = module.artifact_bucket.bucket_id }
