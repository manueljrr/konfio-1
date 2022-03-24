# Deploy static site with react lenguaje in bucket s3 hosting. 

### Description.

> Through these files we can perform an automated deployment of an app in react and deploy in an s3 bucket.

### Prerequisites & Dependencies.

The following resources must exist before the deployment can take place:
-  Make sure this project is marked as private because it will contain some credentials to your AWS Account.
- it is important to set the following secret variables in the gitlab config : $AWS_KEY_DEV, $AWS_SECRET and $AWS_KEY_PROD, $AWS_SECRET_PROD, This can be done by going to project settings -> CI/CD. 
- If you need a custom image, you should create it using a dockerfile and pass it as an argument in the .gitlab-ci.yml.

### Author.
- Nemer Gomez.