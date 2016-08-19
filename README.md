## Chef recipes used for sample AWS work


  The cloud-config.yml provides an example of an unattended chef-client bootstrap

  * After placing private Key for your organization in the cloud config yml, aws cli can deploy:

  aws ec2 run-instances --image-id ami-d732f0b7 --count 1 --instance-type t2.micro --key-name keyname --security-group-ids sg-653e5702 --region us-west-2 --user-data file:///secure/cloud-config.yml 
