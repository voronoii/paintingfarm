CarrierWave.configure do |config|

  # Use local storage if in development or test
  if Rails.env.development? || Rails.env.test?
    
  
    #개발모드일때의 아마존s3 Buckets은 paintingfarm-test임
    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     'AKIAIIR62M32S363O5VQ',                        # required
      aws_secret_access_key: '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',                        # required
      region:                'ap-northeast-2',                  # optional, defaults to 'us-east-1'
      host:                  'paintingfarm-missahng.c9users.io',             # optional, defaults to nil
      endpoint:              'https://s3.ap-northeast-2.amazonaws.com' # optional, defaults to nil
    }
    config.fog_directory  = 'paintingfarm-test'                          # requiredefaults to {}
  end

  CarrierWave.configure do |config|
      #config.storage = :file
      config.storage = :fog
    end

  # Use AWS storage if in production
  if Rails.env.production?
    CarrierWave.configure do |config|
      config.storage = :fog
    end
    
   
  config.fog_directory  = 'paintingfarm'                          # requiredefaults to {}  
  end
end
