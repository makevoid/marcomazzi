class Marcomazzi < Sinatra::Base
  get "/" do

    @photos = Dir.glob("#{PATH}/public/img/home/*.jpg").map do |photo|
      File.basename photo
    end.sort
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