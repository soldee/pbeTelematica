#!/usr/bin/env ruby

class Rfid
	# return uid in hexa str
	def read_uid
		`nfc-scan-device -`
		puts "------------------------------------------------------"
		puts "		Passa la targeta o el clauer"
		puts "------------------------------------------------------"
		uid = `nfc-poll | grep -e "UID" | cut -d: -f2`

		#remove space between characters and convert to upper case
		uid = uid.delete(' ').upcase

		return uid
	end
end

if __FILE__ == $0
	rf = Rfid.new
	uid = rf.read_uid
	puts "uid: #{uid}"
end
