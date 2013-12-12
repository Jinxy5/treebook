FactoryGirl.define do
	factory :status_one, class: Status do
	#	name "Here is numerano Uno Status!"
		content "This is definitely the number one status! One, as in 1!"
	end

	factory :user_with_all_valid, class: User do
		first_name "jimmy"
		last_name "Thehat"
		profile_name "Jimbohatboy"	
		sequence (:email){ |n| "awesomedog" + n.to_s + "@hotmail.co.uk" }
		password "thisisasupersecretpassword12234234"
		password_confirmation "thisisasupersecretpassword12234234"
	end

	# look into the following:
	# we can nest factories
	# we can use sequences to increment email addresses and make them unique
	# we can set up associations (below)

	# use fresh users here, that's what'ss causing the error

	# what's with the association. Does simply calling it write the assosiated factories (:user and :friend) to their own table?

	factory :user_friendship_1, class: UserFriendship do
		association :user, factory: :user_with_all_valid_five
		# or :user_id, factory: :user_with_all_valid[id]
		association :friend, factory: :user_with_all_valid_six
		# or :friend_id, factory: :user_with_all_valid_two[id]

		factory :pending_user_friendship do
			state 'pending'
		end

		factory :requested_user_friendship do
			state 'requested'
		end

		factory :accepted_user_friendship do
			state 'accepted'
		end
	end
	
	factory :user_with_all_valid_two, class: User do
		first_name "Mattychips"
		last_name "Matthews"
		profile_name "Chipboy76"	
		email "Chips@hotmail.co.uk"
		password "yeahyeahsupersecret"
		password_confirmation "yeahyeahsupersecret"
	end

	factory :user_with_all_valid_three, class: User do
		first_name "Ratty"
		last_name "Excellent"
		profile_name "Ratexcellent"	
		email "rat@hotmail.co.uk"
		password "hello_987"
		password_confirmation "hello_987"
	end

	factory :user_with_all_valid_four, class: User do
		first_name "Sylvia"
		last_name "Plath"
		profile_name "Ovengirl64676421"	
		email "ovengirl@987987.co.uk"
		password "thisisasupersecretpassword12234234"
		password_confirmation "thisisasupersecretpassword12234234"
	end	

	factory :user_with_all_valid_five, class: User do
		first_name "Charles"
		last_name "Dickens"
		profile_name "LondonBoy1880"	
		email "quitethe@twist.co.uk"
		password "thisisasupersecretpassword12234234"
		password_confirmation "thisisasupersecretpassword12234234"
	end	

	factory :user_with_all_valid_six, class: User do
		first_name "Mary"
		last_name "Shelly"
		profile_name "FrankenStein"	
		email "the@creature.co.uk"
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