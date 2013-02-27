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

    intro.slide(TOP_MARGIN).text { |color|
      color.bold { %q(Robocode) }
    }

    intro.slide(TOP_MARGIN).image{ %q(media/crazyRobocode.png) }.text {
      %q(Robocode.to_ruby)
    }
  end

  presentation.section("Desarrollo de videojuegos\ncon Ruby", 'state of the art') do |ruby_dev|
    ruby_dev.slide(TOP_MARGIN).text { |color|
      color.bold { "\"Ruby is *not*\nat all suitable for game development!\"" }
    }.br.text {
      '- internet'
    }

    ruby_dev.slide(TOP_MARGIN).image{
      %q('media/ruby_homepage.png')
    }.text {
      "Ruby es lento para el ordenador,\npero rápido para nosotros"
    }.br(5).text {
      %q(¿Entonces?)
    }

    ruby_dev.slide(TOP_MARGIN).text(:center_all) {
      [
        '* ruby-opengl',
        '* G3DRuby',
        '* Rubygame',
        '* Ruby/SDL'
      ]
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
    }.text {
      ['Robotwar. 1970', 'Robocode de IBM. 2001']
    }

    rtanque.slide(TOP_MARGIN).video { %q(media/robocode.mpeg) }.text {
      %q(Versiones en Ruby)
    }

    rtanque.slide(TOP_MARGIN).image { %q(media/RRobots-Home.png) }.text {
      'Viejo, No muy OO, no se aprende, ...'
    }

    rtanque.slide.image {
      'media/challenge_accepted.jpg media/robocode_tank.gif'
    }.code {
      File.open(%q(examples/bot_sensors.rb))
    }

    rtanque.slide.code { File.open(%q(examples/bot_command.rb)) }

    rtanque.slide(TOP_MARGIN).text { %q(RTanque Competición) }.br.text(:center_all) {
      [
        %q(* Abierto a tod@s),
        %q(* Cuando tengamos 5+),
        %q(* No gemas externas, solo std-lib),
        %q(* Pull-requests welcome),
        %q(* No hacks (ie ObjectSpace)),
        %q(* API está ~fijo),
        %q(* Configuración y detalles por definir)
      ]
    }

    rtanque.slide.text(:left) {
      '$ bundle exec rtanque init my_bot'
    }.br.code{
      File.open('examples/my_bot.rb')
    }

    rtanque.slide(TOP_MARGIN).image {
      %q(media/RTanque_home_1.png media/RTanque_home_2.png)
    }.text { |color|
      color.bold { 'http://awilliams.github.com/RTanque/' }
    }
  end

  presentation.slide(TOP_MARGIN) { |slide|
    slide.text { |color| color.bold { FONT.asciify("Preguntas") } }
  }

  presentation.slide.script {
    'rtanque start sample_bots/keyboard sample_bots/seek_and_destroy sample_bots/seek_and_destroy sample_bots/seek_and_destroy sample_bots/seek_and_destroy --width=790 --height=500'
  }
end.start
