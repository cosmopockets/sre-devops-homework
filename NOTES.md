# Steps for task 1
1. [Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) for creating an EC2 Instance with the requirement of it being on the free tier
   - Commit once you successfully deploy ec2 instance 
   - set up security group to only allow traffic from lb. 
   - On GCP you can do this by only allowing an internal IP. The concept is probably the same with AWS. 
2. [Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elb) for creating a Load balancer on AWS...I can pretty much just take this template since it already has 
   - health checks 
   - listener on port 80.

3. [Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) for creating a postgress RDS database.
    - RDS db is only allowed to communicate with ec2. 
    - Can probaly setup a firewall rule that only allows traffic from ec2 and denies all other traffic. 
4. Commit often and when all the above has been completed merge task1 -> master. 


# Steps for task 2

1. Create new branch called task2 
2. Dockerfile for api (to-do) is inefficient and needs to be converted to a multi-stage dockerbuild. Some links I found
   - https://docs.docker.com/develop/develop-images/multistage-build/
   - https://www.docker.com/blog/multi-stage-builds/
   - https://blog.bitsrc.io/a-guide-to-docker-multi-stage-builds-206e8f31aeb8
3. Convert Dockerfile to a multi-stage docker build with node12 as runtime
   -  is a way to test the Dockerfiles for efficiency? Hit up the web && jake and see if he has any tips or recommendations. 
4. Docker-compose file in root has two bugs
   - Not too familiar with debugging Dockerfiles so search the web and reach out to Jake
   - Test everything is WAI by curling http://localhost and create a to-do list

# Steps for Task 3
1. Create brach called task3
2. Deploy containers to ec2 Instance maybe reference this [guide](https://medium.com/@chandupriya93/deploying-docker-containers-with-aws-ec2-instance-265038bba674) 

# Steps for task 4
1. Create and move to task4 branch
2. Configure RDS db so it mimics a production environment
   - ask jake if there are any req's for the production environment. 
   - foudn this [post on creating rds postgres db](https://dev.to/abhishekjaindba/how-to-create-aws-rds-postgresql-database-12kh)
3. API configurations are located in ‘todo-api/src/main.ts’ and expects a postgres db to be running.
    - This can be set in ‘todo-api/src/database/database.providers.ts’
4. Client API configurations are in ‘todo-client/src/environments/environments.**.ts’

# Steps for task 5
###### We could move this up to task one so we can test the pipeline while we configure the infrastructure. 
Create github [action](https://docs.github.com/en/free-pro-team@latest/actions) pipeline that terraform applies any changes that are committed to master branch. 




