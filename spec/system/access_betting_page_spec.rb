require 'rails_helper'

describe 'Usuário acessa página de apostas' do

  it 'Com sucesso' do
    user = create(:user)

    login_as(user)   
    visit root_path
    save_page
    click_on 'Apostar'
    
    expect(page).to have_field 'Pole position'

    for i in 1..10 do
      expect(page).to have_field "#{i}ª posição"
    end

    expect(page).to have_button 'Apostar'
  end

  it 'Não está logado'

end