#!/usr/bin/ruby
require 'aws-sdk'
require 'json'
creds = JSON.load(File.read('secrets.json'))
credentials = Aws::Credentials.new(creds['AccessKeyId'], creds['SecretAccessKey'])
s3 = Aws::S3::Client.new(region: creds['Region'], credentials:credentials)
resp = s3.list_buckets
resp.buckets.map(&:name)
