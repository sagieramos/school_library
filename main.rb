#!/usr/bin/ruby -w

require 'pry'
require './modules/app'

def main
  app = App.new
  app.start
  binding.pry

  puts "program resumes here." 
end

main
