import json
import boto3
from decimal import Decimal

# Initialize DynamoDB
dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('VisitorCount')

def lambda_handler(event, context):
    try:
        # Get the current visitor count
        response = table.get_item(Key={'id': 'visitor_count'})
        count = int(response.get('Item', {}).get('count', 0))  # Convert Decimal to int

        # Increment the count
        count += 1
        table.put_item(Item={'id': 'visitor_count', 'count': count})

        return {
            'statusCode': 200,
            'headers': {'Access-Control-Allow-Origin': '*'},  # Enable CORS
            'body': json.dumps({'count': count})  # Now count is an int
        }
    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps({'error': str(e)})
        }
