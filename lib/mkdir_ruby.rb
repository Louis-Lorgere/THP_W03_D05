def fill_files
  gemfile = File.open("#{ARGV[0]}/Gemfile", "w+")
  gemfile.puts ("source \"https://rubygems.org\"\nruby '2.7.4'\ngem 'rubocop', '~> 0.57.2'\ngem 'rspec'\ngem 'pry'\ngem 'dotenv'\ngem 'nokogiri'\ngem 'watir'\ngem 'launchy'")
  gemfile.close
  gitignore = File.open("#{ARGV[0]}/.gitignore", "w+")
  gitignore.puts(".env")
  gitignore.close
  reademe = File.open("#{ARGV[0]}/Readme.md", "w+")
  reademe.puts("#This is a Ruby programme")
  reademe.close
end

def process
  abort("Donne un nom de dossier, sans espace ;) !!") if ARGV.length != 1
  Dir.mkdir(ARGV[0])
  system("(cd #{ARGV[0]}; rspec --init)")
  system("git init #{ARGV[0]}")
  Dir.mkdir("#{ARGV[0]}/lib")
  fill_files
end

process