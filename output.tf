# Outputs file
output "compute_module" {
  value = module.compute.ec2_instance_url
}