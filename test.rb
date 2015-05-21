#!/usr/bin/ruby
# Load JSON for reading passwords and the AWS SDK
require 'aws-sdk'
require 'json'
# Load the creds file (also has region)
creds = JSON.load(File.read('secrets.json'))
# Create a variable with the credentials, set up via AWS SDK
credentials = Aws::Credentials.new(creds['AccessKeyId'], creds['SecretAccessKey'])
# Open a connection to AWS S3 using our region and provided credentials
s3 = Aws::S3::Client.new(region: creds['Region'], credentials: credentials)
# FAILURE
resp = s3.list_buckets
resp.buckets.map(&:name)
