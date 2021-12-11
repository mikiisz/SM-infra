import boto3
import json

s3 = boto3.client('s3')


def lambda_handler(event, context):
    source_key = event['source_key']
    source_bucket = event['source_bucket']
    destination_key = event['destination_key']
    destination_bucket = event['destination_bucket']

    copy_source = {
        'Bucket': source_bucket,
        'Key': source_key
    }

    res = s3.meta.client.copy(copy_source, destination_bucket, destination_key)

    return {
        'statusCode': 200,
        'body': json.dumps(res)
    }
