## Terraform IaC Tool

### Deploy a three-tier infrastructure on AWS using Terraform

#### Steps
- Clone the git repository

``` git clone https://github.com/rcacfs/bootcamp.git```

- Get into the project root directory

``` cd bootcamp ```

- Go to general_variables.tf file, edit the region to your liking
Example regions are as shown below:
```
us-east-1
us-east-2
eu-west-1
eu-west-2
ap-south-1
```

- Navigate to vpc_variables.tf, you will see there is a variable for cidr block i.e 10.0, \
but this is just a part of a cidr block, this defines how all you cidr blocks will look like. \
In the case above, they will all have the 10.0 at the beginning. \
you can keep the default cidr block range or change it.

- Navigate into aws_services_variables.tf.\
 This file contains some services that we will use in the infrastructure. \
 It contains the load balancer variables, and database variables

- 