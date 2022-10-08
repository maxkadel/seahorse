# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:password) { '123456' }

  context 'with a valid email' do
    let(:email) { "max-#{srand}@testdomain.com" }

    it 'creates a new user' do
      expect do
        user = described_class.create(email: email, password: password)
        expect(user.valid?).to be true
      end.to change(User, :count).by(1)
    end
  end
  context 'with an invalid email' do
    let(:email) { "max-#{srand}" }

    it 'does not create a new user' do
      expect do
        user = described_class.create(email: email, password: password)
        expect(user.valid?).to be false
      end.not_to change(User, :count)
    end
  end
end
