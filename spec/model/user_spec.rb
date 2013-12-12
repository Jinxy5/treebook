require 'spec_helper'
	
describe User do
	context "\b: With four valid users" do
		before do
			@user_1 = FactoryGirl.create(:user_with_all_valid)
			@user_2 = FactoryGirl.create(:user_with_all_valid_two)
			@user_3 = FactoryGirl.create(:user_with_all_valid_three)
			@user_4 = FactoryGirl.create(:user_with_all_valid_four)
		end

		context "\b, and @user_1 friends with @user_2, @user_3 and @user_4" do
			before do
				@user_1.friends << @user_2 << @user_3 << @user_4
			end
			
			it "\b, @user_1's friends array should not include @user_2, @user_3 or @user_4" do
				@user_1.friends.reload
				@user_1.friends.should_not include(@user_1, @user_2, @user_3, @user_4)		
			end

			it "\b, @user_1's pending friends array should include @user_2, @user_3 and @user_4" do
				@user_1.friends.reload
				@user_1.pending_friends.should include(@user_2, @user_3, @user_4)		
			end
		end

	end

end

=begin
			def test
 				def colorize(text, color_code)
				  "\e[#{color_code}m#{text}\e"
				end

				def red(text); colorize(text, 31); end
				def green(text); colorize(text, 32); end
				def black(text); colorize(text, 30); end
				def yellow(text); colorize(text, 33); end
				def blue(text); colorize(text, 34); end
				def magenta(text); colorize(text, 35); end
				def cyan(text); colorize(text, 36); end
				def white(text); colorize(text, 37); end
	
				if subject.valid?
					puts cyan(' | ') + magenta('Validation errors: ' + subject.errors.messages.inspect.to_s )
				else
					puts cyan(' | ') + magenta('Validation errors: ' + subject.errors.messages.inspect.to_s )
				end
			end

			# function start
			def put_validation_errors

				puts "da fuq?"

				def colorize(text, color_code)
				  "\e[#{color_code}m#{text}\e[0m"
				end

				def red(text); colorize(text, 31); end
				def green(text); colorize(text, 32); end

				# puts subject.errors.inspect

				puts "*****____*****____*****___*****"
				puts subject.errors.messages.inspect
				puts subject.errors.messages.length
				puts "*****____*****____*****___*****"

				if subject.errors.messages.length > 0

					maxlength = 0
					dash = "-"
					line = ""

					subject.errors.each do |a, e|	
					
						if maxlength < a.length
							maxlength = a.length
						end
						if maxlength < e.length
							maxlength = a.length
						end
					end

					maxlength.times do
						line << dash
					end


					subject.errors.each do |a, e|	
						puts line
						puts a
						puts e
						puts line 
					end
		    	puts red('Validation errors: ' + subject.errors.messages.inspect.to_s )
				else
					puts green('Validation errors: ' + subject.errors.messages.inspect.to_s )
				end
			end

					it "spec should not have errors" do		  	

		#  	puts subject.valid? # we need to see if the subject is valid in order for the messages hash to be populated!
		 # 	puts subject.errors.messages.inspect.to_s

		 	test

		#  	puts subject.errors.inspect.messages
		#  	should_not be_valid
		end
=end



=begin

	context "with all valid attributes" do
	 	before { @user = FactoryGirl.build(:user_with_all_valid) }
		subject { @user }

		it { should be_valid }

		it "spec should not have errors" do
  			stdout.stub(:write) # and/or $stderr if needed
			test
		end
		puts "xXx"
	end

	context "with all valid attributes" do
	 	before { @user = FactoryGirl.build(:user_with_all_valid) }
		subject { @user }

		it { should be_valid }

		it "spec should not have errors" do		  	
			test
		end
		puts "\n"
	end
end

=end

=begin
	context "with non-alphanumerical characters in first_name" do
	 	before do
	 		@user = FactoryGirl.build(:user_with_all_valid)
	 		@user.first_name = "Jim\!\@\£\%\^\&\*\(\)"
	 	end
		
		subject { @user }

		it { should_not be_valid }
	
	end

	context "with numbers in first_name" do
	 	before do
	 		@user = FactoryGirl.build(:user_with_all_valid)
	 		@user.first_name = "Jimmy93"
	 	end
		
		subject { @user }

		it { should_not be_valid }
	end
=end

=begin
  	before(:each) do
  		@user = FactoryGirl.create(:user_with_all_valid) 
	  if example.metadata[:user_with_all_valid]
		@user = FactoryGirl.create(:user_with_all_valid) 
	  elsif example.metadata[:user_with_blank_first_name]
	  	@user = FactoryGirl.create(:user_with_blank_first_name)
	  elsif example.metadata[:user_with_no_attributes]

	  end 	
	end

	describe User, user_with_all_valid: true do
		subject { @user }

		context "all valid attributes"	do
			subject { @user }

			it { should be_valid }
			its(:first_name) { should == "Jimmy" }
			its(:last_name) { should == "Thehat" }
			its(:profile_name) { should == "Jimbohatboy893" }
			its(:email) { should == "awesomedog@hotmail.co.uk" }
			its(:password) { should == "thisisasupersecretpassword12234234" }
			its(:password_confirmation) { should == "thisisasupersecretpassword12234234" }
		end

    
    context "with invalid credentials" do
      authorization_header = ActionController::HttpAuthentication::Basic.encode_credentials("123456", nil)
      env_headers['HTTP_AUTHORIZATION'] = authorization_header

      it "should fail" do
        get '/tasks', nil, env_headers
        response.status.should eq(401)
      end
    end

		# validations 
		context "blank first_name", user_with_blank_first_name: true do
			subject { @user }

			it { should_not be_valid }
		end
		context "blank last_name" do
			let (:last_name) {""}
			it { should_not be_valid }
		end
		context "blank profile_name" do
			let (:profile_name) {""}
			it { should_not be_valid }
		end
		context "blank email" do
			let (:email) {""}
			it { should_not be_valid }
		end
		context "blank password" do
			let (:password) {""}
			it { should_not be_valid }
		end
		context "blank password_confirmation" do
			let (:password_confirmation) {""}
			it { should_not be_valid }
		end
		context "mismatched password_confirmation" do
			let(:password_confirmation) { "thisisasupersecretpassword12234234____and_some_extra_strings" }
			it { should_not be_valid }
		end
		

		context "incorrectly formated profile_name" do
			let(:profile_name) { "Jimbohatboy893" }
			it { should be_valid }
		end


	end

end
=end