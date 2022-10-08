# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User login', driver: :chrome_headless, type: :system, js: true do
  describe 'new user creation' do
    let(:email) { "max-#{srand}@testdomain.com" }
    let(:password) { '123456' }

    it 'allows new user registration' do
      expect do
        visit '/users/sign_up'
        fill_in('Email', with: email)
        fill_in('Password', with: password)
        fill_in('Password confirmation', with: password)
        click_button('Sign up')
        expect(page).to have_content('Welcome! You have signed up successfully.')
      end.to change(User, :count).by(1)
    end
  end
end
