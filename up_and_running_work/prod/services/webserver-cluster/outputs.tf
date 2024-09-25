


output "prd_lb_name" {
    value = module.prd_web_cluster.LoadBalancer_dns
}

output "prd_asg_name" {
    value = module.prd_web_cluster.asg_name
}