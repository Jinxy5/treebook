FactoryGirl.define do
	factory :status_one, class: Status do
	#	name "Here is numerano Uno Status!"
		content "This is definitely the number one status! One, as in 1!"
	end

	factory :user_with_all_valid, class: User do
		first_name "jimmy12"
		last_name "Thehat"
		profile_name "Jimbohatboy"	
		email "awesomedog@hotmail.co.uk"
		password "thisisasupersecretpassword12234234"
		password_confirmation "thisisasupersecretpassword12234234"
	end

	factory :user_with_blank_first_name, class: User do
		first_name ""
		last_name "Thehat"
		profile_name "Jimbohatboy893"	
		email "awesomedog@hotmail.co.uk"
		password "thisisasupersecretpassword12234234"
		password_confirmation "thisisasupersecretpassword12234234"
	end


	factory :user_with_all_valid_2, class: User do
		first_name "Billy"
		last_name "Thehat"
		profile_name "Jimbohatboy893"	
		email "awesomedog@hotmail.co.uk"
		password "thisisasupersecretpassword12234234"
		password_confirmation "thisisasupersecretpassword12234234"
	end

	factory :user_with_all_valid_3, class: User do
		last_name "Thehat"
		profile_name "Jimbohatboy893"	
		email "awesomedog@hotmail.co.uk"
		password "thisisasupersecretpassword12234234"
		password_confirmation "thisisasupersecretpassword12234234"
	end

	factory :user_with_no_attributes, class: User do
		last_name ""
		profile_name ""	
		email ""
		password ""
		password_confirmation ""
	end

=begin
	factory :user_with_no_last_name, class: User do
		first_name "Jimmy"
		profile_name "Jimbohatboy893"	
		email "awesomedog@hotmail.co.uk"
		password "thisisasupersecretpassword12234234"
		password_confirmation "thisisasupersecretpassword12234234"
	end

	factory :user_with_no_profile_name, class: User do
		first_name "Jimmy"
		last_name "Thehat"
		email "awesomedog@hotmail.co.uk"
		password "thisisasupersecretpassword12234234"
		password_confirmation "thisisasupersecretpassword12234234"
	end

	factory :user_with_no_email, class: User do
		first_name "Jimmy"
		last_name "Thehat"
		profile_name "Jimbohatboy893"	
		pas    Finished in 0.64396 seconds
    14 examples, 2 failures, 3 errors sword "thisisasupersecretpassword12234234"
		password_confirmation "thisisasupersecretpassword12234234"
	end

	factory :user_with_no_password, class: User do
		first_name "Jimmy"
		last_name "Thehat"
		profile_name "Jimbohatboy893"	
		email "awesomedog@hotmail.co.uk"
		password_confirmation "thisisasupersecretpassword12234234"
	end

	factory :user_with_no_password_confirmation, class: User do
		first_name "Jimmy"
		last_name "Thehat"
		profile_name "Jimbohatboy893"	
		email "awesomedog@hotmail.co.uk"
		password "thisisasupersecretpassword12234234"
	end
=end

end