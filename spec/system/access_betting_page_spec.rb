require 'rails_helper'

describe 'Usuário faz apostas' do

  it 'e acessa página de apostas sucesso' do
    user = create(:user)

    login_as(user)   
    visit root_path
    click_on 'Apostar'
    
    expect(page).to have_field 'Pole position'

    for i in 1..10 do
      expect(page).to have_field "#{i}ª posição"
    end

    expect(page).to have_button 'Apostar'
  end

  it 'e não está logado' do

    visit new_bet_path
    expect(current_path).to eq user_session_path

  end

  it 'e faz uma aposta' do
    user = create(:user)

    for i in 1..10 do
      create(:formula_one_driver, :"fdriver#{i}")
    end

    login_as(user)   
    visit root_path
    click_on 'Apostar'

    select 'Charles Leclerc', from: 'Pole position'
    select 'Charles Leclerc', from: '1ª posição'
    select 'Sergio Pérez', from: '2ª posição'
    select 'George Russell', from: '3ª posição'
    select 'Carlos Sainz', from: '4ª posição'
    select 'Lewis Hamilton', from: '5ª posição'
    select 'Lando Norris', from: '6ª posição'
    select 'Valtteri Bottas', from: '7ª posição'
    select 'Esteban Ocon', from: '8ª posição'
    select 'Kevin Magnussen', from: '9ª posição'
    select 'Max Verstappen', from: '10ª posição'
    within('div#bet-btn') do
      click_on 'Apostar'
    end

    expect(page).to have_content 'Aposta realizada com sucesso'
  end

  it 'e tenta fazer uma segunda aposta mas nao consegue' do
    user = create(:user)
    for i in 1..10 do
      create(:formula_one_driver, :"fdriver#{i}")
    end
    bet = create(:bet, user: user)

    login_as(user)   
    visit root_path
    click_on 'Apostar'

    expect(current_path).to eq bet_path(bet)
  end

  it 'e tenta acessar a aposta de outro usuário' do
    user1 = create(:user)
    user2 = create(:user, email: 'email2@email.com')

    for i in 1..10 do
      create(:formula_one_driver, :"fdriver#{i}")
    end
    bet1 = create(:bet, user: user1)
    bet2 = create(:bet, user: user2)


    login_as(user1)   
    visit bet_path(bet2)

    expect(current_path).to eq root_path
  end
end