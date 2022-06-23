require 'rails_helper'

describe 'Usuário faz login' do
  it 'Com sucesso' do
    user = create(:user)
    create(:f1_circuit)

    visit root_path
    click_on 'Entrar'
    fill_in 'E-mail', with: 'email@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'Login'

    expect(current_path).to eq root_path
    expect(page).not_to have_content 'Entrar'
  end

  it 'email ou senha incorreta' do
    user = create(:user)
    create(:f1_circuit)

    visit root_path
    click_on 'Entrar'
    fill_in 'E-mail', with: 'email@email.com'
    fill_in 'Senha', with: '12345'
    click_on 'Login'

    expect(current_path).not_to eq root_path
    expect(page).to have_content 'E-mail ou senha inválidos'
  end

  it 'faz logout' do
    user = create(:user)
    create(:f1_circuit)

    visit root_path
    click_on 'Entrar'
    fill_in 'E-mail', with: 'email@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'Login'
    click_on 'Sair'

    expect(current_path).to eq root_path
    expect(page).to have_content 'Entrar'

  end
end