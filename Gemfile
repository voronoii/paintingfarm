source 'https://rubygems.org'
ruby "2.4.0"
gem 'mailgun_rails' #메일보내기
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.8'
# Use sqlite3 as the database for Active Record
group :development do
  gem 'sqlite3'
end
group :production do
  gem 'pg', '~> 0.20'

end
gem 'rails_12factor', group: :production

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

gem 'mini_magick' #이미지 crop용
gem 'devise' #회원가입
gem 'hirb-unicode' #rails console에서 table모양으로 데이터 뿌리기
gem 'carrierwave' #파일 업로드
# gem 'fog-aws' #파일 업로드 아마존 aws
gem 'will_paginate', '~> 3.1.0' #페이지네이션
gem 'will_paginate-bootstrap' #페이지네이션(프론트단)

gem 'omniauth-facebook' #페이스북 가입하기

#편집기----------------------------
gem 'tinymce-rails' #편집기 (기본)
gem 'tinymce-rails-imageupload', '~> 4.0.0.beta' #편집기의 이미지 업로드 위함
gem 'tinymce-rails-langs' #편집기 언어

#엑셀파일에서 데이터 가져오기
gem 'roo', '~> 2.4.0'
