import json
import boto3
import pandas as pd
from io import StringIO
import os

s3_client = boto3.client('s3')

def lambda_handler(event, context):
    bucket = event['Records'][0]['s3']['bucket']['name']
    key = event['Records'][0]['s3']['object']['key']
    
    # Download the CSV file from S3
    response = s3_client.get_object(Bucket=bucket, Key=key)
    data = response['Body'].read().decode('utf-8')
    
    # Load data into a DataFrame
    df = pd.read_csv(StringIO(data))
    
    # Clean the data
    cleaned_df = clean_data(df)
    
    # Save the cleaned data back to the cleaned bucket
    cleaned_bucket = os.environ['CLEANED_BUCKET']
    cleaned_key = f"cleaned/{key}"
    
    csv_buffer = StringIO()
    cleaned_df.to_csv(csv_buffer, index=False)
    
    s3_client.put_object(Bucket=cleaned_bucket, Key=cleaned_key, Body=csv_buffer.getvalue())
    
    return {
        'statusCode': 200,
        'body': json.dumps(f"Processed file {key} and saved to {cleaned_key}")
    }

def clean_data(df):
    df.dropna(inplace=True)
    df['Date'] = pd.to_datetime(df['Date'])
    return df
