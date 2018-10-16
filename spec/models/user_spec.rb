require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    subject {
      described_class.new(password: "Password", password_confirmation: "Password", email: "Unique@gmail.com", first_name: "John", last_name: "Doe")
    }

    it "is invalid without a first name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it "is invalid without a last name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it "is invalid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "is invalid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "should have matching password and password confirmation fields" do
      expect(subject.password).to eql(subject.password_confirmation)
    end

    it "should not have conflicting password and password confirmation fields" do
      subject.password_confirmation = "password"
      expect(subject.password).to_not eql(subject.password_confirmation)
    end

    it "should have a unique email" do
      subject.save
      subject2 = described_class.new(password: "Password", password_confirmation: "Password", email: "Unique@gmail.com", first_name: "John", last_name: "Doe")
      expect(subject2).to_not be_valid
    end

    it "should have a non case sensitive unique email" do
      subject.save
      subject2 = described_class.new(password: "Password", password_confirmation: "Password", email: "UniQuE@gmail.com", first_name: "John", last_name: "Doe")
      expect(subject2).to_not be_valid
    end

    it "is invalid with a password shorter then 6 characters" do
      subject.password = "Passw"
      subject.password_confirmation = "Passw"
      expect(subject).to_not be_valid
    end

    it "is valid with a password of 6 characters or longer" do
      expect(subject).to be_valid
    end

  end

  describe ".authenticate_with_credentials" do

    # before(:all) do
    #   described_class.new(first_name: "John", last_name: "Doe", email: "JohnDoeTest@gmail.com", password: "passWord17", password_confirmation: "passWord17").save!
    # end

    it "should be able to log in with the proper credentials" do
      @authenticate_subject_2 = User.authenticate_with_credentials('JohnDoeTest@gmail.com', 'passWord17')
      expect(@authenticate_subject_2).to eql(User.find_by(email: 'JohnDoeTest@gmail.com'))
    end

    it "is valid with blank spaces written around the email" do
      @authenticate_subject_2 = User.authenticate_with_credentials('  JohnDoeTest@gmail.com   ', 'passWord17')
      expect(@authenticate_subject_2).to eql(User.find_by(email: 'JohnDoeTest@gmail.com'))
    end

    it "is not case sensitive" do
      @authenticate_subject_2 = User.authenticate_with_credentials('  johndoetest@gmail.com   ', 'passWord17')
      expect(@authenticate_subject_2).to eql(User.find_by(email: 'JohnDoeTest@gmail.com'))
    end

  end

end
