#!/usr/bin/env ruby

require 'gtk3'
require 'thread'
require 'puzzle1.rb'


#creacio de la finestra i les seves caracteristiques
window = Gtk::Window.new
window.title = "Puzzle 2 - Oriol Soldevila"
window.default_width = 450
window.default_height = 150
window.set_window_position(Gtk::WindowPosition::CENTER_ALWAYS)


#creacio de boto, text, i box
text = Gtk::Label.new("Please login with your university card")
clear_button = Gtk::Button.new(:label => "Clear")
box = Gtk::Box.new(:vertical, 0)

	
#colors utilitzats
blue = Gdk::RGBA::new(0, 0, 1.0, 1.0)
white = Gdk::RGBA::new(1.0, 1.0, 1.0, 1.0)
red  = Gdk::RGBA::new(1.0, 0,   0, 1.0)

	
#canvi color i font del boto i el text
font = Pango::FontDescription.new('15')
clear_button.override_font(font)
text.override_font(font)
text.override_color(:normal, white)
text.override_background_color(:normal, blue)


#incloure el text i el botó dins del box
box.pack_start(text, :expand => true, :fill => true, :padding => 3)
box.pack_end(clear_button, :expand => false, :fill => false, :padding => 3)


#tancar el programa quan es tanca manualment la finestra
window.signal_connect("delete_event") do Gtk.main_quit end


#funcio del clear_button
clear_button.signal_connect "clicked" do
	text.set_text("Please login with your university card")
	text.override_background_color(:normal, blue)
	@thread.run
end

	
#thread que executa read_uid
@thread = Thread.new do
	rf = Rfid.new
	#bucle que executa read_uid repetidament
	while(0)
		uid = rf.read_uid
		text.set_text("uid: " + uid)
		text.override_background_color(:normal, red)
		#parem la execució del thread per a que no es pugui passar la targeta si no es clica el botó Clear
		Thread.stop
	end
end	


window.add(box)
window.show_all
Gtk.main

