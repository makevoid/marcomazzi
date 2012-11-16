path = File.expand_path "../", __FILE__
photos = Dir.glob("#{path}/*.TIF")
puts photos

photos.each_with_index do |photo, idx|
  # `sips --resampleWidth 1600 --resampleHeight 1600 #{photo}`
  cmd = "convert #{photo}  -geometry 2000x -density 72 -colorspace gray #{idx}.jpg"
  puts cmd
  `#{cmd}`

  `rm -f #{idx}-1.jpg`
  `mv #{idx}-0.jpg #{idx}.jpg`
end