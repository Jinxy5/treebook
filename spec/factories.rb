FactoryGirl.define do
	factory :status_one, class: Status do
		name "Here is numerano Uno Status!"
		content "This is definitely the number one status! One, as in 1!"
	end

	factory :user_one, class: User do
		first_name "Jimmy"
		last_name "Thehat"
		profile_name "Jimbohatboy893"	
		email "awesomedog@hotmail.co.uk"
		password "thisisasupersecretpassword12234234"
		password_confirmation "thisisasupersecretpassword12234234"
	end
end