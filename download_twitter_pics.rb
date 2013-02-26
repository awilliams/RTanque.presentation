#!/usr/bin/env ruby
# encoding: utf-8
require 'net/http'
require 'json'

SCREEN_NAMES = %w(
@otikik
@amaiac
@mcberros
@eamodeorubio
@colgado
@ferblape
@laura_morillo
@jmanrubia
@ivanfdezperea
@ciscou
@eLafo
@christos
@diec123
@dgc273
@zipizap
@carlossanchezp
@supercoco9
@dparracatalan
@pasku1
@jmoratilla
@joseluis
@mikelodeon
@antarticonorte
@amartinfraguas
@littlemove
@jmdlta
@javierhdez3
@alvarosanmartin
@afcapel
@wchiquito
@darkrodry)

Dir.mkdir('twitter_images') unless Dir.exists?('twitter_images')
SCREEN_NAMES.each do |screen_name|
  json = JSON.parse(Net::HTTP.get('api.twitter.com', "/1/users/show.json?screen_name=#{screen_name}"))
  image_url = json['profile_image_url'].gsub('_normal', '')
  system_path = "twitter_images/#{screen_name}#{File.extname(image_url)}"
  puts "#{screen_name} [#{image_url}]\n => #{system_path}"
  system("wget --quiet --background -O #{system_path} #{image_url}")
end