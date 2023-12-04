require 'rails_helper'

RSpec.describe User, type: :model do
    let(:password) { 'password123' }
    
    
    describe 'validations' do
        it 'requires a password' do
            user = User.new(email: 'user@example.com', password: password, password_confirmation: password)
            expect(user).to be_valid
            
            user.password = ''
            expect(user).not_to be_valid
            expect(user.errors[:password]).to include("can't be blank")
        end
    end
    
    
    
    describe User do
        describe ".from_google" do
            context "when given valid Google info" do
                let(:info) do { uid: "12345", email: "test@example.com"} end
                
                it "creates a new user with the given info" do
                    expect do
                        User.from_google(info)
                    end.to change { User.count }.by(1)
                    
                    user = User.find_by(email: info[:email])
                    expect(user.uid).to eq(info[:uid])
                    expect(user.provider).to eq("google")
                end
            end
        end
    end
end
