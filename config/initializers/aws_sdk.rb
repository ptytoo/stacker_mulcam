creds = Aws::Credentials.new(ENV['AWS_SES_ID'], ENV['AWS_SES_SECRET'])
Aws::Rails.add_action_mailer_delivery_method(:aws_sdk, credentials: creds, region: 'us-west-2')
