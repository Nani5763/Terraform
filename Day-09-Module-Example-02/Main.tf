module "dev" {
    source = "../Day-09-Module-Local-Source"
    ami = "ami-0427090fd1714168b"
    instance_type = "t2.micro"
    key_name = "Kubernetes"
    
    
  
}