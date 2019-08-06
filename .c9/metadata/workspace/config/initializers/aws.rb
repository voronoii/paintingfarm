{"filter":false,"title":"aws.rb","tooltip":"/config/initializers/aws.rb","undoManager":{"mark":96,"position":96,"stack":[[{"start":{"row":0,"column":0},"end":{"row":13,"column":3},"action":"insert","lines":["CarrierWave.configure do |config|","  config.fog_provider = 'fog/aws'                        # required","  config.fog_credentials = {","    provider:              'AWS',                        # required","    aws_access_key_id:     'xxx',                        # required","    aws_secret_access_key: 'yyy',                        # required","    region:                'eu-west-1',                  # optional, defaults to 'us-east-1'","    host:                  's3.example.com',             # optional, defaults to nil","    endpoint:              'https://s3.example.com:8080' # optional, defaults to nil","  }","  config.fog_directory  = 'name_of_directory'                          # required","  config.fog_public     = false                                        # optional, defaults to true","  config.fog_attributes = { 'Cache-Control' => \"max-age=#{365.day.to_i}\" } # optional, defaults to {}","end"],"id":1}],[{"start":{"row":1,"column":0},"end":{"row":1,"column":2},"action":"insert","lines":["# "],"id":2}],[{"start":{"row":11,"column":0},"end":{"row":11,"column":2},"action":"insert","lines":["# "],"id":3}],[{"start":{"row":12,"column":0},"end":{"row":12,"column":2},"action":"insert","lines":["# "],"id":4}],[{"start":{"row":7,"column":4},"end":{"row":7,"column":6},"action":"insert","lines":["# "],"id":5}],[{"start":{"row":4,"column":28},"end":{"row":4,"column":31},"action":"remove","lines":["xxx"],"id":6},{"start":{"row":4,"column":28},"end":{"row":4,"column":48},"action":"insert","lines":["AKIAJHMYSKSRL6BSBFFQ"]}],[{"start":{"row":5,"column":28},"end":{"row":5,"column":31},"action":"remove","lines":["yyy"],"id":7},{"start":{"row":5,"column":28},"end":{"row":5,"column":68},"action":"insert","lines":["7VZyTVqv7BmvXuJAIDfBpLz8ca4sWsLPIOorIOJI"]}],[{"start":{"row":6,"column":36},"end":{"row":6,"column":37},"action":"remove","lines":["1"],"id":8}],[{"start":{"row":6,"column":35},"end":{"row":6,"column":36},"action":"remove","lines":["-"],"id":9}],[{"start":{"row":6,"column":34},"end":{"row":6,"column":35},"action":"remove","lines":["t"],"id":10}],[{"start":{"row":6,"column":33},"end":{"row":6,"column":34},"action":"remove","lines":["s"],"id":11}],[{"start":{"row":6,"column":32},"end":{"row":6,"column":33},"action":"remove","lines":["e"],"id":12}],[{"start":{"row":6,"column":31},"end":{"row":6,"column":32},"action":"remove","lines":["w"],"id":13}],[{"start":{"row":6,"column":30},"end":{"row":6,"column":31},"action":"remove","lines":["-"],"id":14}],[{"start":{"row":6,"column":29},"end":{"row":6,"column":30},"action":"remove","lines":["u"],"id":15}],[{"start":{"row":6,"column":28},"end":{"row":6,"column":29},"action":"remove","lines":["e"],"id":16}],[{"start":{"row":6,"column":28},"end":{"row":6,"column":29},"action":"insert","lines":["a"],"id":17}],[{"start":{"row":6,"column":29},"end":{"row":6,"column":30},"action":"insert","lines":["o"],"id":18}],[{"start":{"row":6,"column":29},"end":{"row":6,"column":30},"action":"remove","lines":["o"],"id":19}],[{"start":{"row":6,"column":29},"end":{"row":6,"column":30},"action":"insert","lines":["p"],"id":20}],[{"start":{"row":6,"column":30},"end":{"row":6,"column":31},"action":"insert","lines":["-"],"id":21}],[{"start":{"row":6,"column":31},"end":{"row":6,"column":32},"action":"insert","lines":["n"],"id":22}],[{"start":{"row":6,"column":32},"end":{"row":6,"column":33},"action":"insert","lines":["o"],"id":23}],[{"start":{"row":6,"column":33},"end":{"row":6,"column":34},"action":"insert","lines":["r"],"id":24}],[{"start":{"row":6,"column":33},"end":{"row":6,"column":34},"action":"remove","lines":["r"],"id":25}],[{"start":{"row":6,"column":33},"end":{"row":6,"column":34},"action":"insert","lines":["r"],"id":26}],[{"start":{"row":6,"column":34},"end":{"row":6,"column":35},"action":"insert","lines":["t"],"id":27}],[{"start":{"row":6,"column":35},"end":{"row":6,"column":36},"action":"insert","lines":["h"],"id":28}],[{"start":{"row":6,"column":36},"end":{"row":6,"column":37},"action":"insert","lines":["e"],"id":29}],[{"start":{"row":6,"column":37},"end":{"row":6,"column":38},"action":"insert","lines":["a"],"id":30}],[{"start":{"row":6,"column":38},"end":{"row":6,"column":39},"action":"insert","lines":["s"],"id":31}],[{"start":{"row":6,"column":39},"end":{"row":6,"column":40},"action":"insert","lines":["t"],"id":32}],[{"start":{"row":6,"column":40},"end":{"row":6,"column":41},"action":"insert","lines":["-"],"id":33}],[{"start":{"row":6,"column":41},"end":{"row":6,"column":42},"action":"insert","lines":["2"],"id":34}],[{"start":{"row":8,"column":28},"end":{"row":8,"column":55},"action":"remove","lines":["https://s3.example.com:8080"],"id":35},{"start":{"row":8,"column":28},"end":{"row":8,"column":59},"action":"insert","lines":["s3.ap-northeast-2.amazonaws.com"]}],[{"start":{"row":6,"column":28},"end":{"row":6,"column":42},"action":"remove","lines":["ap-northeast-2"],"id":36},{"start":{"row":6,"column":28},"end":{"row":6,"column":42},"action":"insert","lines":["ap-northeast-2"]}],[{"start":{"row":8,"column":28},"end":{"row":8,"column":29},"action":"insert","lines":["h"],"id":37}],[{"start":{"row":8,"column":29},"end":{"row":8,"column":30},"action":"insert","lines":["t"],"id":38}],[{"start":{"row":8,"column":30},"end":{"row":8,"column":31},"action":"insert","lines":["t"],"id":39}],[{"start":{"row":8,"column":31},"end":{"row":8,"column":32},"action":"insert","lines":["p"],"id":40}],[{"start":{"row":8,"column":32},"end":{"row":8,"column":33},"action":"insert","lines":["s"],"id":41}],[{"start":{"row":8,"column":33},"end":{"row":8,"column":34},"action":"insert","lines":[":"],"id":42}],[{"start":{"row":8,"column":34},"end":{"row":8,"column":35},"action":"insert","lines":["/"],"id":43}],[{"start":{"row":8,"column":35},"end":{"row":8,"column":36},"action":"insert","lines":["/"],"id":44}],[{"start":{"row":10,"column":43},"end":{"row":10,"column":44},"action":"remove","lines":["y"],"id":45}],[{"start":{"row":10,"column":42},"end":{"row":10,"column":43},"action":"remove","lines":["r"],"id":46}],[{"start":{"row":10,"column":41},"end":{"row":10,"column":42},"action":"remove","lines":["o"],"id":47}],[{"start":{"row":10,"column":40},"end":{"row":10,"column":41},"action":"remove","lines":["t"],"id":48}],[{"start":{"row":10,"column":39},"end":{"row":10,"column":40},"action":"remove","lines":["c"],"id":49}],[{"start":{"row":10,"column":38},"end":{"row":10,"column":39},"action":"remove","lines":["e"],"id":50}],[{"start":{"row":10,"column":37},"end":{"row":10,"column":38},"action":"remove","lines":["r"],"id":51}],[{"start":{"row":10,"column":36},"end":{"row":10,"column":37},"action":"remove","lines":["i"],"id":52}],[{"start":{"row":10,"column":35},"end":{"row":10,"column":36},"action":"remove","lines":["d"],"id":53}],[{"start":{"row":10,"column":34},"end":{"row":10,"column":35},"action":"remove","lines":["_"],"id":54}],[{"start":{"row":10,"column":33},"end":{"row":10,"column":34},"action":"remove","lines":["f"],"id":55}],[{"start":{"row":10,"column":32},"end":{"row":10,"column":33},"action":"remove","lines":["o"],"id":56}],[{"start":{"row":10,"column":31},"end":{"row":10,"column":32},"action":"remove","lines":["_"],"id":57}],[{"start":{"row":10,"column":30},"end":{"row":10,"column":31},"action":"remove","lines":["e"],"id":58}],[{"start":{"row":10,"column":29},"end":{"row":10,"column":30},"action":"remove","lines":["m"],"id":59}],[{"start":{"row":10,"column":28},"end":{"row":10,"column":29},"action":"remove","lines":["a"],"id":60}],[{"start":{"row":10,"column":27},"end":{"row":10,"column":28},"action":"remove","lines":["n"],"id":61}],[{"start":{"row":10,"column":27},"end":{"row":10,"column":28},"action":"insert","lines":["p"],"id":62}],[{"start":{"row":10,"column":28},"end":{"row":10,"column":29},"action":"insert","lines":["a"],"id":63}],[{"start":{"row":10,"column":29},"end":{"row":10,"column":30},"action":"insert","lines":["i"],"id":64}],[{"start":{"row":10,"column":30},"end":{"row":10,"column":31},"action":"insert","lines":["n"],"id":65}],[{"start":{"row":10,"column":31},"end":{"row":10,"column":32},"action":"insert","lines":["t"],"id":66}],[{"start":{"row":10,"column":32},"end":{"row":10,"column":33},"action":"insert","lines":["i"],"id":67}],[{"start":{"row":10,"column":33},"end":{"row":10,"column":34},"action":"insert","lines":["n"],"id":68}],[{"start":{"row":10,"column":34},"end":{"row":10,"column":35},"action":"insert","lines":["g"],"id":69}],[{"start":{"row":10,"column":35},"end":{"row":10,"column":36},"action":"insert","lines":["f"],"id":70}],[{"start":{"row":10,"column":36},"end":{"row":10,"column":37},"action":"insert","lines":["a"],"id":71}],[{"start":{"row":10,"column":37},"end":{"row":10,"column":38},"action":"insert","lines":["r"],"id":72}],[{"start":{"row":10,"column":38},"end":{"row":10,"column":39},"action":"insert","lines":["m"],"id":73}],[{"start":{"row":1,"column":3},"end":{"row":1,"column":4},"action":"remove","lines":[" "],"id":74}],[{"start":{"row":1,"column":2},"end":{"row":1,"column":3},"action":"remove","lines":[" "],"id":75}],[{"start":{"row":1,"column":1},"end":{"row":1,"column":2},"action":"remove","lines":[" "],"id":76}],[{"start":{"row":1,"column":0},"end":{"row":1,"column":1},"action":"remove","lines":["#"],"id":77}],[{"start":{"row":1,"column":0},"end":{"row":1,"column":1},"action":"insert","lines":[" "],"id":78}],[{"start":{"row":1,"column":1},"end":{"row":1,"column":2},"action":"insert","lines":[" "],"id":79}],[{"start":{"row":1,"column":2},"end":{"row":1,"column":3},"action":"insert","lines":["#"],"id":80}],[{"start":{"row":4,"column":0},"end":{"row":5,"column":104},"action":"remove","lines":["    aws_access_key_id:     'AKIAJHMYSKSRL6BSBFFQ',                        # required","    aws_secret_access_key: '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',                        # required"],"id":81}],[{"start":{"row":3,"column":67},"end":{"row":4,"column":0},"action":"remove","lines":["",""],"id":82}],[{"start":{"row":11,"column":3},"end":{"row":12,"column":0},"action":"insert","lines":["",""],"id":85}],[{"start":{"row":12,"column":0},"end":{"row":13,"column":0},"action":"insert","lines":["",""],"id":86}],[{"start":{"row":13,"column":0},"end":{"row":18,"column":58},"action":"insert","lines":["Aws.config.update({","  region: 'us-east-1',","  credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']),","})","","S3_BUCKET = Aws::S3::Resource.new.bucket(ENV['S3_BUCKET'])"],"id":87}],[{"start":{"row":14,"column":19},"end":{"row":14,"column":20},"action":"remove","lines":["1"],"id":88}],[{"start":{"row":14,"column":18},"end":{"row":14,"column":19},"action":"remove","lines":["-"],"id":89}],[{"start":{"row":14,"column":17},"end":{"row":14,"column":18},"action":"remove","lines":["t"],"id":90}],[{"start":{"row":14,"column":16},"end":{"row":14,"column":17},"action":"remove","lines":["s"],"id":91}],[{"start":{"row":14,"column":15},"end":{"row":14,"column":16},"action":"remove","lines":["a"],"id":92}],[{"start":{"row":14,"column":14},"end":{"row":14,"column":15},"action":"remove","lines":["e"],"id":93}],[{"start":{"row":14,"column":13},"end":{"row":14,"column":14},"action":"remove","lines":["-"],"id":94}],[{"start":{"row":14,"column":12},"end":{"row":14,"column":13},"action":"remove","lines":["s"],"id":95}],[{"start":{"row":14,"column":11},"end":{"row":14,"column":12},"action":"remove","lines":["u"],"id":96}],[{"start":{"row":14,"column":11},"end":{"row":14,"column":25},"action":"insert","lines":["ap-northeast-2"],"id":97}],[{"start":{"row":0,"column":0},"end":{"row":0,"column":2},"action":"insert","lines":["# "],"id":98},{"start":{"row":1,"column":0},"end":{"row":1,"column":2},"action":"insert","lines":["# "]},{"start":{"row":2,"column":0},"end":{"row":2,"column":2},"action":"insert","lines":["# "]},{"start":{"row":3,"column":0},"end":{"row":3,"column":2},"action":"insert","lines":["# "]},{"start":{"row":4,"column":0},"end":{"row":4,"column":2},"action":"insert","lines":["# "]},{"start":{"row":5,"column":0},"end":{"row":5,"column":2},"action":"insert","lines":["# "]},{"start":{"row":6,"column":0},"end":{"row":6,"column":2},"action":"insert","lines":["# "]},{"start":{"row":7,"column":0},"end":{"row":7,"column":2},"action":"insert","lines":["# "]},{"start":{"row":8,"column":0},"end":{"row":8,"column":2},"action":"insert","lines":["# "]},{"start":{"row":9,"column":0},"end":{"row":9,"column":2},"action":"insert","lines":["# "]},{"start":{"row":10,"column":0},"end":{"row":10,"column":2},"action":"insert","lines":["# "]},{"start":{"row":11,"column":0},"end":{"row":11,"column":2},"action":"insert","lines":["# "]}],[{"start":{"row":0,"column":0},"end":{"row":18,"column":58},"action":"remove","lines":["# CarrierWave.configure do |config|","#   #config.fog_provider = 'fog/aws'                        # required","#   config.fog_credentials = {","#     provider:              'AWS',                        # required","#     region:                'ap-northeast-2',                  # optional, defaults to 'us-east-1'","#     # host:                  's3.example.com',             # optional, defaults to nil","#     endpoint:              'https://s3.ap-northeast-2.amazonaws.com' # optional, defaults to nil","#   }","#   config.fog_directory  = 'paintingfarm'                          # required","# #   config.fog_public     = false                                        # optional, defaults to true","# #   config.fog_attributes = { 'Cache-Control' => \"max-age=#{365.day.to_i}\" } # optional, defaults to {}","# end","","Aws.config.update({","  region: 'ap-northeast-2',","  credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']),","})","","S3_BUCKET = Aws::S3::Resource.new.bucket(ENV['S3_BUCKET'])"],"id":99}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":0,"column":0},"end":{"row":0,"column":0},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1473225085017,"hash":"da39a3ee5e6b4b0d3255bfef95601890afd80709"}