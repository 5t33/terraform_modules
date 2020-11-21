cluster_identifier  = "demo-db-cluster"
availability_zones  = ["us-east-2a"]
database_name       = "demoDB"
num_instances       = 1
deletion_protection = false # If this were a real API you would definitely want this on, but I want to be able to make changes quickly for the purpose of this post.
instance_class = "db.t2.micro"
publicly_accessible = true