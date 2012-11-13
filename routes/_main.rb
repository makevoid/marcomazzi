class Marcomazzi < Sinatra::Base
  get "/" do

    @photos = Dir.glob("#{PATH}/public/img/home/*.jpg").map do |photo|
      File.basename photo
    end
    haml :index
  end

  get "/news" do
    haml :news
  end

  get "/bio" do
    haml :bio
  end

  get "/contacts" do
    haml :contacts
  end

  post "/mail" do
    haml :mail
  end
end