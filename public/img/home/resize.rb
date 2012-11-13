path = File.expand_path "../", __FILE__
photos = Dir.glob("#{path}/*.jpg")
puts photos

photos.each_with_index do |photo, idx|
  `sips --resampleWidth 1600 --resampleHeight 1600 #{photo}`
end