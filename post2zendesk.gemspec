Gem::Specification.new do |s|
  s.name    = 'post2zendesk'
  s.version = '0.0.1'
  s.homepage = 'https://github.com/zacharyalexstern/post2zendesk'
  s.date    = '2014-04-01'
  s.summary = 'Post text or text file as comment to Zendesk ticket'
  s.description = 'Post text or text file as comment to Zendesk ticket.'
  s.authors = ["Zachary Alex Stern"]
  s.email   = 'zacharyalexstern@gmail.com'
  s.files = Dir["{lib}/**/*.rb", "bin/*", "LICENSE", "*.md"]
  s.executables << 'post2zendesk'
  s.license = 'WTFPL'
  s.add_development_dependency 'pry'
end 
