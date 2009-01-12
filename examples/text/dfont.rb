# encoding: utf-8
#
# An early example of TTF font embedding.  Mostly kept for nostalgia's sake.
#
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', '..', 'lib'))
require "prawn"

DFONT_FILE = "#{Prawn::BASEDIR}/data/fonts/Action Man.dfont"
puts "There are #{Prawn::Font::DFont.font_count(DFONT_FILE)} fonts in #{DFONT_FILE}:"
Prawn::Font::DFont.each_named_font(DFONT_FILE) do |name|
  puts "* #{name}"
end

puts
puts "generating sample document in 'dfont.pdf'..."

Prawn::Document.generate "dfont.pdf" do       
  fill_color "0000ff"

  font_families["Action Man"] = {
    :normal      => { :name => DFONT_FILE, :select => "ActionMan" },
    :bold        => { :name => DFONT_FILE, :select => "ActionMan-Bold" },
    :italic      => { :name => DFONT_FILE, :select => "ActionMan-Italic" },
    :bold_italic => { :name => DFONT_FILE, :select => "ActionMan-BoldItalic" }
  }

  font "Action Man", :size => 16
  text "Action Man is feeling normal here."

  move_text_position 16

  font "Action Man", :style => :bold, :size => 16
  text "Action Man is feeling bold here!"

  move_text_position 16

  font "Action Man", :style => :italic, :size => 16
  text "Here, we see Action Man feeling italicized. Slick!"

  move_text_position 16

  font "Action Man", :style => :bold_italic, :size => 16
  text "Lastly, we observe Mr. Action Man being bold AND italicized. Excellent!"
end

puts "done"
