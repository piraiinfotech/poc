
---- Pirai Infotech Cli ----------

----- Version 1.0 ------------


Steps to install 

Create a aws profile called "piraicli" under your .aws folder with your aws key and security key along with region

1) Create a new folder caller "Pirai"

2) copy the pirai_cli-0.1-py3-none-any.whl file from Git Repo folder Pirai_cli under below path

3) install using pip3

command : "pip3 install pirai_cli-0.1-py3-none-any.whl"

4) thats is Pirai cli is ready to use  :: try with  "pirai --help"



v1.0 Include

1) You can list ec2 instances
2) Stop Instances
3) start instance
3) terminate instance
4) list volumes
5) list snapshots
6) create snapshots

Imp Points:

This project will take a parameter --project alomg with any command , which will excute the command only on given tag

if you take all ec2 instances snapshot at a time , Pirai cli will pick one ec2 instance and it will stop it 
and after stopped status it wiil take snapshot and will start the respective ec2 
then pick other ec2 instance and fallow the same process

Example Commands :



pirai --help ( It will give you all listed commands in v.1.0

pirai instances list ( please make sure you have instances in your account, if no instances will throw error, Fix will release soon with new features

pirai instances snapshot

pirai instances stop




