require 'rails_helper'

describe 'Testando o rspec' do
    it 'acessa página inicial' do
        visit root_path

        expect(current_path).to eq current_path
    end
end
