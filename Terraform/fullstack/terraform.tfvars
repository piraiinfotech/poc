# Varibles for the Providers
AWS_ACCESS_KEY                        = "AKIAWGNJBLFWPMT5GAGO"
AWS_SECRET_KEY                        = "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"
AWS_REGION                            = "us-west-1"


# Varibales of VPC

AWS_VPC_MAIN_CIDR = "10.0.0.0/16"
AWS_VPC_PUBLIC_SUBNET1_CIDR = "10.0.1.0/24"
AWS_VPC_PUBLIC_SUBNET2_CIDR = "10.0.2.0/24"
AWS_VPC_PRIVATE_SUBNET1_CIDR = "10.0.3.0/24"
AWS_VPC_PRIVATE_SUBNET2_CIDR = "10.0.4.0/24"


# RDS

CIDR_RDS = "0.0.0.0/0"
DB_INSTANCE_CLASS                     = "db.t2.micro"
RDS_ENGINE                            = "mysql"
ENGINE_VERSION                        = "5.7.17"
BACKUP_RETENTION_PERIOD               = "7"
PUBLICLY_ACCESSIBLE                   = "true"
RDS_USERNAME                          = "test"
RDS_PASSWORD                          = "test123#$"
RDS_ALLOCATED_STORAGE                 = "20"

# Ec2 Variables
SSH_CIDR_WEB_SERVER                   = "0.0.0.0/0"
SSH_CIDR_APP_SERVER                   = "0.0.0.0/0"
WEB_SERVER_INSTANCE_TYPE              = "t2.micro"
APP_SERVER_INSTANCE_TYPE              = "t2.micro"
USER_DATA_FOR_WEBSERVER               = "./demo_code/web.sh"
USER_DATA_FOR_APPSERVER               = "./demo_code/app.sh"
PEM_FILE_APPSERVERS                   = "NcaliforniaKeyPair"
PEM_FILE_WEBSERVERS                   = "NcaliforniaKeyPair"
