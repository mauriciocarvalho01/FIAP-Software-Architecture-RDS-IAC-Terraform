## Documentação da Configuração Terraform

Este arquivo Terraform provisiona os seguintes recursos na AWS:

* **Subnets**: Um grupo de subnets para a instância do banco de dados.
* **Instância RDS MySQL**: Uma instância do banco de dados MySQL.
* **Grupo de Subnet RDS**: Um grupo de subnets associado à instância RDS MySQL.
* **Security Group**: Um security group para controlar o acesso à instância RDS MySQL.

### Informações Gerais
* **Versão Terraform:** 1.9.5


### Recursos Provisionados

**1. Subnets (data.aws_subnets)**

* **Nome:** default
* **IDs das Subnets:** [mascaradas](são 6 subnets identificadas por "subnet-")
* **Região AWS:** us-east-1
* **ID da VPC:** vpc-072de84496ad21076 (mascarada)

**2. Instância RDS MySQL (aws_db_instance)**

* **Nome:** default
* **Endereço:** restaurante-acme-mysql.cyz1nt1mpmwb.us-east-1.rds.amazonaws.com
* **Armazenamento Alocado:** 20 GB
* **Versão do Engine:** 8.0 (versão atual: 8.0.35)
* **Classe da Instância:** db.t3.micro
* **Ponto de Final:** restaurante-acme-mysql.cyz1nt1mpmwb.us-east-1.rds.amazonaws.com:3306
* **Grupo de Subnet RDS:** rds-subnet-group
* **Security Group:** sg-0efe60771b7e80bbd (associado)
* **Acesso Público:** Habilitado (**Atenção!** Segurança a ser revisada)
* **Credenciais (SENSÍVEIS):** [mascaradas]
    * Username: [mascarado]
    * Password: [mascarado]

**3. Grupo de Subnet RDS (aws_db_subnet_group)**

* **Nome:** default
* **IDs das Subnets:** [mesmas subnets da seção 1] (mascaradas)
* **ID da VPC:** vpc-072de84496ad21076 (mascarada)

**4. Security Group (aws_security_group)**

* **Nome:** rds-mysql-sg
* **Regras de Saída:** Tráfego de saída permitido para qualquer destino (**Atenção!** Regras a serem revisadas)
* **Regras de Entrada:** 
    * Acesso permitido ao banco de dados na porta 3306 TCP a partir de outros security groups específicos (**Verifique os IDs permitidos**)
* **ID da VPC:** vpc-072de84496ad21076 (mascarada)

**Observação:** As informações sensíveis, como IDs de recursos, credenciais e detalhes de regras de segurança, foram mascaradas para proteger dados confidenciais.

### Considerações de Segurança 
* O acesso público à instância RDS MySQL está habilitado. É altamente recomendável revisar as regras de segurança para restringir o acesso apenas às fontes autorizadas.
* As credenciais de acesso ao banco de dados foram mascaradas neste documento. 

### Próximos Passos
* Para utilizar esta configuração, é necessário:
    * Uma conta AWS ativa.
    * Credenciais de acesso AWS configuradas no Terraform.
    * O Terraform instalado e configurado.
    * O kubectl configurado para interagir com o cluster (se aplicável).
* Você pode utilizar os seguintes comandos para gerenciar a infraestrutura:
    * `terraform init`: Inicializa o backend do Terraform.
    * `terraform apply`: Aplica a configuração do Terraform.
    * `terraform plan`: Verifica as alterações que serão feitas antes da aplicação.
