module "dev" {
    source = "../Day-09-Module-Local-Source"
    ami = "ami-0bb84b8ffd87024d8"
    instance_type = "t2.micro"
    key_name = "first-key"
    
    
  
}