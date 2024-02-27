def create_ec2_instance(): 

    ec2 = boto3.resource('ec2') 

    instance = ec2.create_instances( 

        ImageId='ami-087c4d241dd19276d',  # replace with a valid AMI ID 

        MinCount=1, 

        MaxCount=1, 

        InstanceType='t2.micro', 

        KeyName='my-key-pair'  # replace with a valid key pair 

    ) 

    return instance[0].id 

 

# List EC2 instances 

def list_ec2_instances(): 

    ec2 = boto3.client('ec2') 

    instances = ec2.describe_instances() 

    for reservation in instances['Reservations']: 

        for instance in reservation['Instances']: 

            print("Instance ID : ", instance['InstanceId']) 
