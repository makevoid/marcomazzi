class Marcomazzi < Sinatra::Base

  helpers  do
    def captions_for(work)
      captions = SimpleArticleFormat.load "#{PATH}/public/img/#{work}/captions.saf"
      captions.map{ |c| RedCloth.new(c[:title]).to_html }
    end
  end

  def load_photos(dir)
    @photos = Dir.glob("#{PATH}/public/img/#{dir}/*.jpg").map do |photo|
      dimensions = Dimensions.dimensions photo
      vertical = dimensions[0] < dimensions[1]
      { name: File.basename(photo), vertical: vertical }
    end.sort_by{ |p| p[:name] }
  end

  get "/" do
    haml :index
  end

  get "/news" do
    haml :news
  end

  get "/works" do
    haml :works
  end

  get "/works/*" do |work|
    @work = WORKS.find{ |w| w[:name] == work }
    load_photos work
    haml :work
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