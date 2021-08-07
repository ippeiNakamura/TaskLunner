ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'simplecov'
require 'capybara/rspec'
require 'factory_bot'
require 'shoulda-matchers'
require 'vcr'
require 'spec_helper'
require 'rspec/rails'

# テスト実行前に未実行のmigrationファイルを検知して実行する
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

#support/config配下のファイルを読み込み
Dir[Rails.root.join("spec/support/config/*.rb")].each { |f| require f }
Dir[Rails.root.join("spec/support/helper/*.rb")].each { |f| require f }

RSpec.configure do |config|
   # テスト全体の前に実行する処理をブロックで記述
  config.before(:suite) do
    # データベースをCleanする方法を'transaction'に指定
    DatabaseCleaner.strategy = :transaction
    # このタイミングで'transaction'でデータベースをCleanしておく
    DatabaseCleaner.clean_with(:truncation)
  end

  # 各exampleの前および後に実行する処理をブロックで記述
  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      # ここに処理を記述する
      # ここがexampleの実行タイミング
      example.run
      # ここに処理を記述する ##
    end
  end
  
  # focusタグがあればそれだけ実行、なければ全spec実行
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  # ロードするfixtureのパスを指定
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # ディレクトリ構成によってspec typeを自動判別する設定
  config.infer_spec_type_from_file_location!

  # spec実行後のbacktrace表示を簡素化
  config.filter_rails_from_backtrace!

  # RSpecの実行前に1度、DBM
  config.before(:suite) do
    DatabaseCleaner.clean
  end

  # rspecでいうexample、turnipでいうシナリオが終わるごとにDBの初期化
  config.before(:each) do
    DatabaseCleaner.clean
  end  

  # 最後に1度、実行
  config.after(:suite) do
    DatabaseCleaner.clean
  end
end
