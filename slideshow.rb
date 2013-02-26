#!/usr/bin/env ruby
# encoding: utf-8
require "rubygems"
require "bundler"
Bundler.require

FONT = Artii::Base.new :font => 'small'
TOP_MARGIN = 3

Termination.new do |presentation|

    presentation.section('Video Games', 'Adam Williams | @acw5') do |intro|
    intro.slide(TOP_MARGIN).text {
      %q(I. Básicos para empezar)
    }.br(3).text {
      %q(II. Competición para seguir)
    }

    intro.slide(TOP_MARGIN).image{ %q(media/crazyRobocode.png) }.text { |color|
      color.bold { %q(Robocode de IBM) }
    }.br(6).text {
      %q(Hacerlo con Ruby)
    }
  end

  presentation.section("Desarrollo de videojuegos\ncon Ruby", 'state of the art') do |ruby_dev|
    ruby_dev.slide(TOP_MARGIN).text { |color|
      color.bold { "\"Ruby is *not*\nat all suitable for game development!\"" }
    }.br.text {
      '- the internet'
    }

    ruby_dev.slide(TOP_MARGIN).image{
      %q('media/ruby_homepage.png')
    }.text {
      "'Ruby features a true mark-and-sweep garbage collector\nfor all Ruby objects. No need to\nmaintain reference counts in extension libraries.\nAs Matz says,\n“This is better for your health.”'"
    }.br.text {
      %q(- http://www.ruby-lang.org/en/about/)
    }

    ruby_dev.slide(TOP_MARGIN).text {
      %q(Ruby es lento)
    }.br(5).text {
      %q(¿Entonces?)
    }
  end

  gosu_subtitle = "\"Gosu is a 2D game development library\nfor the Ruby and C++ programming languages\"\n-http://www.libgosu.org/"
  presentation.section('Gosu', gosu_subtitle) do |gosu|
    gosu.slide(TOP_MARGIN).video {
      %q(media/gosu_examples.mpeg) }
    .text {
      %q(Call of Duty 5 no son)
    }

    gosu.slide(TOP_MARGIN).text {
      %q(Encuesta)
    }

    gosu.slide.image { 'media/doom-3.jpg' }.code(:cpp) {
      File.open('examples/doom_3.cpp')
    }

    gosu.slide(TOP_MARGIN).text(:center_all) {
      %q(Gosu::
  Color < Object
  Font < Object
  GLTexInfo < Object
  Image < Object
  Sample < Object
  SampleInstance < Object
  Song < Object
  TextInput < Object
  Window < Object)
    }

    gosu.slide(TOP_MARGIN).text(:center_all) {
      %q(Gosu::
  Font < Object
  Image < Object
  Window < Object)
    }

    gosu.slide(TOP_MARGIN).text { |color|
      color.bold { %q(Gosu::Window & Gosu::Image) }
    }

    gosu.slide.code { File.open('examples/twitter_1_extract.rb') }
    gosu.slide(TOP_MARGIN).script(false) { %q(ruby examples/twitter_1.rb) }.text { |color|
      color.bold { %q(Gosu::Font) }
    }

    gosu.slide.code { File.open('examples/twitter_2_extract.rb') }
    gosu.slide(TOP_MARGIN).script(false) { %q(ruby examples/twitter_2.rb) }.text { |color|
      color.bold { %q(Gosu::Window#button_down?) }
    }

    gosu.slide.code { File.open('examples/twitter_3_extract.rb') }
    gosu.slide(TOP_MARGIN).script(false) { %q(ruby examples/twitter_3.rb) }.text { |color|
      color.bold { %q(Gosu::Window#mouse_x & Gosu::Window#mouse_y) }
    }

    gosu.slide.code { File.open('examples/twitter_4_extract.rb') }
    gosu.slide(TOP_MARGIN).script(false) { %q(ruby examples/twitter_4.rb) }.text { |color|
      color.bold { %q(Patrones para seguir) }
    }.br.text{
      [
        %q(* SRP),
        %q(* GUI / No GUI),
        %q(* Chingu)
      ]
    }

    gosu.slide.code { File.open('examples/twitter_5_extract.rb') }
    gosu.slide(TOP_MARGIN).script(false) { %q(ruby examples/twitter_5.rb) }.text { |color|
      "#{color.underline{'Facíl'}}, exportable, y tiene varios usos"
    }
  end

  presentation.section('RTanque', 'A game for Ruby programmers') do |rtanque|
    rtanque.slide(TOP_MARGIN).image {
      %q(media/robotwar.png)
    }.text { %q(Robocode) }

    rtanque.slide(TOP_MARGIN).video { %q(media/robocode.mpeg) }.text {
      %q(Versión en Ruby)
    }

    rtanque.slide(TOP_MARGIN).image { %q(media/RRobots-Home.png) }.text {
      'Viejo, No muy OO, ...'
    }

    rtanque.slide.image {
      'media/robocode_tank.gif'
    }.code {
      File.open(%q(examples/bot_sensors.rb))
    }

    rtanque.slide.code { File.open(%q(examples/bot_command.rb)) }

    rtanque.slide(TOP_MARGIN).text { %q(RTanque Competición) }.br.text(:center_all) {
      [
        %q(* Abierto a tod@s),
        %q(* Cuando tengamos 5+),
        %q(* Pull-requests welcome),
        %q(* No hacks (ie ObjectSpace))
      ]
    }

    rtanque.slide.text(:left) {
      '$ bundle exec rtanque init my_bot'
    }.code{
      File.open('examples/my_bot.rb')
    }

    rtanque.slide(TOP_MARGIN).text { |color|
      color.bold { 'http://awilliams.github.com/RTanque/' }
    }
  end

  presentation.slide(TOP_MARGIN) { |slide|
    slide.text { |color| color.bold { FONT.asciify("Preguntas") } }
  }

  presentation.slide.script {
    'rtanque start sample_bots/keyboard sample_bots/seek_and_destroy sample_bots/seek_and_destroy sample_bots/seek_and_destroy sample_bots/seek_and_destroy sample_bots/seek_and_destroy --width=800 --height=600'
  }
end.start