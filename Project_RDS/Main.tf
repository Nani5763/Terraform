resource "aws_db_instance" "rds" {
    allocated_storage = 20
    engine = "mysql"
    engine_version = "8.0"
    db_name = "database1"
    instance_class = "db.t3.micro"
    username = "admin"
    password = "Pavan5763"
    parameter_group_name = "default.mysql8.0"
    skip_final_snapshot = true
    multi_az = true
    vpc_security_group_ids = [aws_security_group.rds_sg.id]
    db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
    backup_retention_period = 7

  
}
resource "aws_vpc" "rds_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      name = "rds_vpc"
    }
  
}
# Create a subnet within the VPC
resource "aws_subnet" "rds_subnet_a" {
  vpc_id     = aws_vpc.rds_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-2a"
  tags = {
    Name = "rds_subnet"
  }
}
resource "aws_subnet" "rds_subnet_b" {
  vpc_id     = aws_vpc.rds_vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-east-2b"
  tags = {
    Name = "rds_subnet_b"
  }
}
# Create a DB subnet group with subnets in multiple availability zones
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds_subnet_group"
  subnet_ids = [aws_subnet.rds_subnet_a.id, aws_subnet.rds_subnet_b.id]

  tags = {
    Name = "RDS Subnet Group"
  }
}
resource "aws_security_group" "rds_sg" {
    vpc_id = aws_vpc.rds_vpc.id
    name = "allow_tls"

    ingress {
        from_port = "3306"
        to_port = "3306"
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}

resource "aws_db_instance" "rds_replica-1" {
    count = 1
    replicate_source_db = aws_db_instance.rds.identifier
    identifier = "db-instance-replica-1-${count.index}"
    instance_class = "db.t3.micro"
    skip_final_snapshot = true
    availability_zone = "us-east-2a"
    vpc_security_group_ids = [ aws_security_group.rds_sg.id ]
    #db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
    backup_retention_period = 7

  
}

resource "aws_db_instance" "rds_replica-2" {
    count = 1
    replicate_source_db = aws_db_instance.rds.identifier
    identifier = "db-instance-replica-2-${count.index}"
    instance_class = "db.t3.micro"
    skip_final_snapshot = true
    availability_zone = "us-east-2b"
    vpc_security_group_ids = [ aws_security_group.rds_sg.id ]
    #db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
    backup_retention_period = 7

  
}
