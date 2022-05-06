require 'rails_helper'

describe 'Usuário se cadastra' do
  it 'Com sucesso' do
    visit root_path

    click_on 'Entrar'
    click_on 'Inscrever-se'
    save_page
    fill_in 'E-mail', with: 'email@email.com'
    fill_in 'Senha', with: '123456'
    fill_in 'Confirme sua senha', with: '123456'
    click_on 'Inscrever-se'

    expect(current_path).to eq root_path 
  end

  it 'senha com menos de 6 caracteres' do
    visit root_path

    click_on 'Entrar'
    click_on 'Inscrever-se'
    save_page
    fill_in 'E-mail', with: 'email@email.com'
    fill_in 'Senha', with: '12345'
    fill_in 'Confirme sua senha', with: '12345'
    click_on 'Inscrever-se'

    expect(current_path).not_to eq root_path 
    expect(page).to have_content 'Senha é muito curto (mínimo: 6 caracteres)'
  end


  it 'confirmação de senha incorreta' do
    visit root_path

    click_on 'Entrar'
    click_on 'Inscrever-se'
    save_page
    fill_in 'E-mail', with: 'email@email.com'
    fill_in 'Senha', with: '123456'
    fill_in 'Confirme sua senha', with: '12345'
    click_on 'Inscrever-se'

    expect(page).to have_content 'Confirme sua senha'
  end
end