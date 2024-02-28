import boto3
import datetime

def cleanup_ecr_images(repository_name, images_to_retain=5, retention_days=30):
    ecr_client = boto3.client('ecr')
    
    # Get image details
    response = ecr_client.describe_images(repositoryName=repository_name)
    images = response['imageDetails']

    # Sort images by imagePushedAt timestamp (oldest to newest)
    images.sort(key=lambda x: x['imagePushedAt'])

    # Retain the last 'images_to_retain' images, regardless of age
    images_to_delete = images[:-images_to_retain]

    # Calculate the timestamp 'retention_days' days ago
    retention_date = datetime.datetime.now() - datetime.timedelta(days=retention_days)

    # Filter images older than 'retention_days' days
    images_to_delete = [image for image in images_to_delete if image['imagePushedAt'] < retention_date]

    # Delete old images
    for image in images_to_delete:
        image_digest = image['imageDigest']
        ecr_client.batch_delete_image(repositoryName=repository_name, imageIds=[{'imageDigest': image_digest}])
        print(f"Deleted image: {image_digest}")

if __name__ == "__main__":
    repository_name = 'test'
    cleanup_ecr_images(repository_name)

