import boto3

def get_repository_region(repository_name):
    ecr_client = boto3.client('ecr')
    response = ecr_client.describe_repositories(repositoryNames=[repository_name])
    repository = response['repositories'][0]
    return repository['repositoryUri'].split('.')[3]

if __name__ == "__main__":
    repository_name = 'myrepo'
    region = get_repository_region(repository_name)
    print(f"The region of repository '{repository_name}' is '{region}'.")

