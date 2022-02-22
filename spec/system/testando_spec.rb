require 'rails_helper'

describe "Testando o rspec" do
    it 'vamo ve' do
        visit root_path

        expect(page).to have_content 'web'
    end
end
