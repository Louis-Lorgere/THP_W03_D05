require 'launchy'
require 'rubygems'
require 'nokogiri'
require 'open-uri'

def make_url
  search = ARGV.join("+")
  return "https://www.google.com/search?q=" + search
end


def process
  abort("Écrit une recherche à faire en appelant le fichier !!") if ARGV.empty?
  Launchy.open (make_url)
end

process