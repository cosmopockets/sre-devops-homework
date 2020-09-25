As I understnad I need to complete the following action items. 

1. Create a terraform file that does the following
    a. elastic load balancer
    b. ec2 instance
    c. postgress RDS db
    d. any required security group

2. Bug fixes and optimization
    a. optimize the Dockerfile to a multi-stage docker build(aim for ~300 MB)
    b. docker-compose at root directory has 2 bugs
    c. curl http://localhost and create a to-do list

3. Deploy docker containers to the ec2 Instance that was provision in step 1

4. Rollout pstgress for production
    a. Make necessary changes required to use RDS db as a production environment
    b. API expects Postgress db to be running

5. Create guthub action pipeline that terraform applies when there is a push to master


