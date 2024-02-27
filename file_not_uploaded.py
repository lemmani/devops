import sys
import boto3
from datetime import datetime

def check_file_uploaded(bucket_name, file_name, date):
    s3 = boto3.client('s3')
    prefix = date.strftime('%Y/%m/%d')
    response = s3.list_objects_v2(Bucket=bucket_name, Prefix=f"{prefix}/{file_name}")
    if 'Contents' in response:
        for obj in response['Contents']:
            if obj['Key'] == f"{prefix}/{file_name}":
                return True
    return False

def main():
    if len(sys.argv) != 2:
        print("Usage: ./file_not_uploaded.py <date>")
        sys.exit(1)

    bucket_name = "file.not.uploaded.emmanuel"
    date_str = sys.argv[1]
    try:
        date = datetime.strptime(date_str, '%Y-%m-%d')
    except ValueError:
        print("Invalid date format. Please use YYYY-MM-DD.")
        sys.exit(1)

    file_name = "example.txt"

    file_uploaded = check_file_uploaded(bucket_name, file_name, date)

    if file_uploaded:
        print(f"1 file found for {date_str}")
    else:
        print(f"[Error] No file found for {date_str}")

if __name__ == "__main__":
    main()

