User.all.each do |u|

	if u.last_4_digits.blank?
		puts "Not a paid subscriber: skipping"
	elsif u.rolable_type == "Student"
		puts "A student: skipping"
	elsif u.rolable_type == "Teacher"
		puts "A teacher: skipping"
	else
		puts "Updating user: " << u.email
		u.rolable_type = "OldMember"
		u.save
		puts "Rolable_Type now: " << u.rolable_type
	end
end
