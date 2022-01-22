import boto3
import json
import pytesseract

s3 = boto3.resource('s3')


def image_from_s3(bucket, key):
    bucket = s3.Bucket(bucket)
    image = bucket.Object(key)
    img_data = image.get().get('Body').read()

    return img_data


def lambda_handler(event, context):
    source_key = event['source_key']
    source_bucket = event['source_bucket']

    image = image_from_s3(source_bucket, source_key)

    # Adding custom options
    custom_config = r'--oem 3 --psm 6'
    res = pytesseract.image_to_string(image, config=custom_config)

    return {
        'statusCode': 200,
        'body': json.dumps(res)
    }
