# Definir o grupo de segurança para o RDS
resource "aws_security_group" "rds_sg" {
  name        = "rds-mysql-sg"
  description = "Security group for MySQL RDS"
  vpc_id      = "vpc-0389ed5a4f50b636b"  # ID da sua VPC

  # Permitir tráfego do grupo de segurança do EKS na porta MySQL (3306)
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = ["sg-0c3337007ad944347", "sg-05ce8e8d8ed25babe"]  # Adicionar novo grupo de segurança
  }

  # Permitir saída para qualquer destino
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Obter as subnets da VPC
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = ["vpc-0389ed5a4f50b636b"]  # ID da sua VPC
  }
}

# Criar o grupo de subnets para o RDS
resource "aws_db_subnet_group" "default" {
  name       = "rds-subnet-group"
  subnet_ids = data.aws_subnets.default.ids
  description = "RDS subnet group"
}

resource "aws_db_instance" "default" {
  allocated_storage    = var.allocated_storage
  db_name              = var.db_name
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = var.db_instance_class
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true

  # Associar o subnet group e o security group
  db_subnet_group_name = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  # Definir o nome personalizado da instância RDS
  identifier = "restaurante-acme-mysql"

  # Mantendo o RDS privado
  publicly_accessible = true
}
