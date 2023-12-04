namespace :users do
  desc "Sign out all users"
  task sign_out_all: :environment do
    User.all.each do |user|
      # Sign out the user
      user.reset_session_token! if user.respond_to?(:reset_session_token!)
    end

    puts "All users have been signed out."
  end
end
