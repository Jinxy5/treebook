FactoryGirl.define do
	factory :created_at_updated_at do
		created_at Time.now
		updated_at Time.now
		
		factory :users, class: User do
			password "thisisasupersecretpassword12234234"
			password_confirmation "thisisasupersecretpassword12234234"
			
			factory :user_0 do
				id 0
				first_name "Charles"
				last_name "Dickens"
				profile_name "LondonBo4880"	
				email "quite_the_twist@live.co.uk"
=begin
				factory :user_0_invalid_id do
					id "invalid"
				end
				factory :user_0_invalid_first_name do
				end
				factory :user_0_invalid_last_name do
				end
				factory :user_0_invalid_profile_name do
				end
				factory :user_0_invalid_email do
				end
=end
			end

			factory :user_1 do
				id 1
				first_name "Mark"
				last_name "Twain"
				profile_name "Wiseyank23"	
				email "twainy@live.com"
			end

			factory :user_2 do
				id 2
				first_name "Sylvia"
				last_name "Plath"
				profile_name "Ovens"	
				email "plathy@awesome.com"
			end

			factory :user_3 do
				id 3
				first_name "Rabbity"
				last_name "Furface"
				profile_name "Carrots"	
				email "kittens@kat.com"
			end
		end

		factory :user_friendships, class: UserFriendship do
			
			factory :user_0_user_1_user_friendship do
				user_id 0
				friend_id 1

				factory :pending_user_0_user_1 do
					id 0
					state "pending"
				end
			end

			factory :user_1_user_0 do
				user_id 1
				friend_id 0

				factory :requested_user_1_user_0 do
					id 1
					state "requested"
				end
			end

			factory :user_0_user_2_user_friendship do
				user_id 0
				friend_id 2

				factory :pending_user_0_user_2 do
					id 2
					state "pending"
				end
			end

			factory :user_2_user_0_user_friendship do
				user_id 2
				friend_id 0

				factory :requested_user_2_user_0 do
					id 3
					state "requested"
				end
			end
		end

		factory :statuses, class: Status do
			factory :user_0_statuses do	
				user_id 0

				factory :user_0_status_0 do
					id 0
					content "Greetings, this is the first status"
				end
				factory :user_0_status_1 do
					id 1
					content "Hello all, this is my second status"
				end
				factory :user_0_status_2 do
					id 2
					content "Right, here comes a third status!"
				end
				factory :user_0_status_3 do
					id 3
					content "A fourth one. Oh goody."
				end
			end
		end
	end
end
#	factory :status, class: Status do
#		factory :user_0_statuses do
#			factory :user_0_status_0 do
#				id 3
#				id 0
#				user_id 0
#				content "Hello"
#				created_at Time.now
#				updated_at Time.now
#			end

#			factory :user_0_status_1 do
#				id 1
#				content "Hello"
#			end

			
#		end
#	end
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
=begin
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
=end