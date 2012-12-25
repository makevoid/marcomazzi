class Marcomazzi < Sinatra::Base

  def load_photos
    @photos = Dir.glob("#{PATH}/public/img/home/*.jpg").map do |photo|
      File.basename photo
    end.sort
  end

  get "/" do
    load_photos
    haml :index
  end

  get "/news" do
    haml :news
  end

  get "/works" do
    load_photos
    haml :works
  end

  get "/bio" do
    haml :bio
  end

  get "/contacts" do
    haml :contacts
  end

  post "/mail" do
    mail = params[:mail]
    message = Mail.new do
            to MAIN_EMAIL
          from 'm4kevoid@gmail.com'
      reply_to mail["from"]
       subject "Ricevuto messaggio da: #{mail["name"]} <#{mail["from"]}>"
          body mail["body"]
    end
    message.deliver

    haml :mail
  end
end