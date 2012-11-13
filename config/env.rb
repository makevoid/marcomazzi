path = File.expand_path '../../', __FILE__
APP = "marcomazzi"

require "bundler/setup"
Bundler.require :default
module Utils
  def require_all(path)
    Dir.glob("#{path}/**/*.rb") do |model|
      require model
    end
  end
end
include Utils

env = ENV["RACK_ENV"] || "development"
# DataMapper.setup :default, "mysql://localhost/marcomazzi_#{env}"
require_all "#{path}/models"
# DataMapper.finalize


# news

require "#{path}/lib/simple_article_format"

NEWS = SimpleArticleFormat.load "#{path}/config/news.saf"

# email

mail_pass = File.read(File.expand_path "~/.password").strip.gsub(/33/, '')

smtp_options = {
  address:    "smtp.gmail.com",
  port:       587,
  user_name:  'm4kevoid@gmail.com',
  password:   mail_pass,
  enable_starttls_auto: true
}

Mail.defaults do
  delivery_method :smtp, smtp_options
end