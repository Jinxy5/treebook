FactoryGirl.define do
=begin
	factory :summing_else do
		#########
		## The association here populates the user_id column with the id of the specified factory
		##
		## association :<model>, factory: :<factory that specifies the model>
		## '<model> automatically "changed" to <model>_id'
		## 
		## association user
		## association :user, factory: :user_with_all_valid_five
		#########
		association :user, factory: :user_with_all_valid_five

		factory :status_testo, class: Status do
			content "noo"
		end
		factory :status_testo_2, class: Status do
			content "noo"
		end
	end

	factory :status_2, class: Status do
	end

	factory :status_3, class: Status do
	end

	factory :status_4, class: Status do
	end
	
	factory :status_5, class: Status do
	end
	
	factory :status_6, class: Status do
	end

	factory :status_7, class: Status do
	end


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

	factory :x, class: UserFriendship do
		association :user, factory: :user_with_all_valid_five
		# or :user_id, factory: :user_with_all_valid[id]
		association :friend, factory: :user_with_all_valid_six
		# or :friend_id, factory: :user_with_all_valid_two[id]

		factory :b do
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
		sequence (:email){ |n| "awesomedog" + n.to_s + "@hotmail.co.uk" }
		password "thisisasupersecretpassword12234234"
		password_confirmation "thisisasupersecretpassword12234234"
	end	

	factory :user_with_all_valid_five, class: User do
		first_name "Charles"
		last_name "Dickens"
		profile_name "LondonBoy1880"	
		sequence (:email){ |n| "awesomedog" + n.to_s + "@hotmail.co.uk" }
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
=begin
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


	factory :user_1_status, class: Status do
	#	id
	#	content
	#	created_at
	#	updated_at
		user_id 1
	end

	factory :user_1_statuses, class: Status do
	#	association :status, factory: :user_1_status 
	
		factory :user_1_status_1 do
			content "Hello this is the first content"
		end
	
		factory :user_1_status_2 do
			content "Hello this is the first content"
		end

		factory :user_1_status_3 do
			content "Hello this is the first content"
		end

		factory :user_1_status_4 do
			content "Hello this is the first content"
		end

		factory :user_1_status_5 do
			content "Hello this is the first content"
		end

		factory :user_1_status_6 do
			content "Hello this is the first content"
		end

		factory :user_1_status_7 do
			content "Hello this is the first content"
		end

		factory :user_1_status_8 do
			content "Hello this is the first content"
		end
	end

=begin
	factory :summing_else do
		#########
		## The association here populates the user_id column with the id of the specified factory
		##
		## association :<model>, factory: :<factory that specifies the model>
		## '<model> automatically "changed" to <model>_id'
		## 
		## association user
		## association :user, factory: :user_with_all_valid_five
		#########
		association :user, factory: :user_with_all_valid_five

		factory :status_testo, class: Status do
			content "noo"
		end
		factory :status_testo_2, class: Status do
			content "noo"
		end
	end
=end

=begin
	factory :user_5_statuses, class: Status do
		#########
		## The association here populates the user_id column with the id of the specified factory
		##
		## association :<model>, factory: :<factory that specifies the model>
		## '<model> automatically "changed" to <model>_id'
		## 
		## association user
		## association :user, factory: :user_with_all_valid_five
		##
		## user_id 5
		#########
		association :user, factory: :user_with_all_valid_five

		factory :user_5_status_1 do
			content "noo"
		end
		factory :user_5_status_2 do
			content "noo"
		end
		factory :user_5_status_3 do
			content "noo"
		end
		factory :user_5_status_4 do
			content "noo"
		end
		factory :user_5_status_5 do
			content "noo"
		end
		factory :user_5_status_6 do
			content "noo"
		end
		factory :user_5_status_7 do
			content "noo"
		end
		factory :user_5_status_8 do
			content "noo"
		end
	end
=end
	factory :user_4, class: User do
		first_name "Charles"
		last_name "Dickens"
		profile_name "LondonBoy1234880"	
		sequence (:email){ |n| "awesomedog" + n.to_s + "@hotmail.co.uk" }
	#	email "jizz44um@wd.com"
		password "thisisasupersecretpassword12234234"
		password_confirmation "thisisasupersecretpassword12234234"
	end

	factory :user_5, class: User do
		first_name "Charles"
		last_name "Dickens"
		profile_name "LondonBoy1823480"	
#		sequence (:email){ |n| "awesomedog" + n.to_s + "@hotmail.co.uk" }
		email "jiz2zu2344m@wd.com"
		password "thisisasupersecretpassword12234234"
		password_confirmation "thisisasupersecretpassword12234234"
	end

	factory :user_6, class: User do
		first_name "Charles"
		last_name "Dickens"
		profile_name "LondonBoy1234880"	
#		sequence (:email){ |n| "awesomedog" + n.to_s + "@hotmail.co.uk" }
		email "ji2z234zum@wd.com"
		password "thisisasupersecretpassword12234234"
		password_confirmation "thisisasupersecretpassword12234234"
	end

	factory :user_7, class: User do
		first_name "Charles"
		last_name "Dickens"
		profile_name "LondonBoy1823480"	
#		sequence (:email){ |n| "awesomedog" + n.to_s + "@hotmail.co.uk" }
		email "ji22z234zum@wd.com"
		password "thisisasupersecretpassword12234234"
		password_confirmation "thisisasupersecretpassword12234234"
	end
	factory :user_4_statuses, class: Status do
		#########
		## The association here populates the user_id column with the id of the specified factory
		##
		## association :<model>, factory: :<factory that specifies the model>
		## '<model> automatically "changed" to <model>_id'
		## 
		## association user
		## association :user, factory: :user_with_all_valid_five
		##
		## user_id 5
		#########
		
		association :author, factory: :user, strategy: :build

		association :user, factory: :user_4

		factory :user_4_status_0 do
			content "noo"
		end
		factory :user_4_status_1 do
			content "noo"
		end
		factory :user_4_status_2 do
			content "noo"
		end
		factory :user_4_status_3 do
			content "noo"
		end
		factory :user_4_status_4 do
			content "noo"
		end
		factory :user_4_status_5 do
			content "noo"
		end
		factory :user_4_status_6 do
			content "noo"
		end
		factory :user_4_status_7 do
			content "noo"
		end
	end
end