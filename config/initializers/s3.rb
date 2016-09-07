CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAIIR62M32S363O5VQ',                        # required
    aws_secret_access_key: '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',                        # required
    region:                'ap-northeast-2',                  # optional, defaults to 'us-east-1'
    host:                  'paintingfarm.com',             # optional, defaults to nil
    endpoint:              'https://s3.ap-northeast-2.amazonaws.com' # optional, defaults to nil
  }
  config.fog_directory  = 'paintingfarm'                          # required
end