require 'rails_helper'

describe 'usuário acessa sua página de perfil' do
  it 'e vê suas apostas' do
    user = create(:user)
    circuit = create(:f1_circuit)
    allow(F1Circuit).to receive(:next_race).and_return(circuit)
    bet1 = create(:bet, user: user)
    bet2 = create(:bet, user: user, circuit: 'catalunya', result_points: 120, pole: 'VER', validated: true)

    login_as(user)
    visit root_path
    click_on user.email

    expect(page).to have_css('h1', text: 'Minhas Apostas')
    within("tr#bet-#{bet1.id}") do
      expect(page).to have_css('td', text: bet1.id)
      expect(page).to have_css('td', text: 'interlagos')
      expect(page).to have_css('td', text: '2022')
      expect(page).to have_css('td', text: 'LEC').twice
      expect(page).to have_css('td', text: 'Aguardando resultados')
      expect(page).to have_link('Detalhes')
    end

    within("tr#bet-#{bet2.id}") do
      expect(page).to have_css('td', text: bet2.id)
      expect(page).to have_css('td', text: 'catalunya')
      expect(page).to have_css('td', text: 'VER')
      expect(page).to have_css('td', text: 'LEC')
      expect(page).to have_css('td', text: '120 pontos')
      expect(page).to have_link('Detalhes')
    end
    
  end

  it 'e vê os detalhes de uma aposta' do
    user = create(:user)
    for i in 1..10 do
      create(:f1_driver, :"fdriver#{i}")
    end
    circuit = create(:f1_circuit)
    allow(F1Circuit).to receive(:next_race).and_return(circuit)
    bet = create(:bet, user: user, pole: 'VER', result_points: 116, validated: true)

    login_as(user)
    visit root_path
    click_on user.email
    within("tr#bet-#{bet.id}") do
      click_on 'Detalhes'
    end

    within('div#pole') do
      expect(page).to have_css('h2', text: 'Pole position')
      expect(page).to have_css('h3', text: 'Max Verstappen')
    end

    within('div#race') do
      expect(page).to have_css('h2', text: 'Corrida')
      expect(page).to have_css('p', text: 'Charles Leclerc')
      expect(page).to have_css('p', text: 'Max Verstappen')
      expect(page).to have_css('p', text: 'Sergio Pérez')
      expect(page).to have_css('td', text: 'George Russell')
      expect(page).to have_css('td', text: 'Carlos Sainz')
      expect(page).to have_css('td', text: 'Lando Norris')
      expect(page).to have_css('td', text: 'Lewis Hamilton')
      expect(page).to have_css('td', text: 'Valtteri Bottas')
      expect(page).to have_css('td', text: 'Esteban Ocon')
      expect(page).to have_css('td', text: 'Kevin Magnussen')
    end

    expect(page).to have_css('h3', text: 'Resultado da aposta: 116 pontos')    
  end

  it 'e não possui nenhuma aposta' do
    user = create(:user)
    circuit = create(:f1_circuit)
    allow(F1Circuit).to receive(:next_race).and_return(circuit)

    login_as(user)
    visit root_path
    click_on user.email

    expect(page).to have_css('h3', text: 'Você não possui nenhuma aposta')
  end

  it 'e não consegue acessar a página de outro usuário' do
    user = create(:user)
    circuit = create(:f1_circuit)
    allow(F1Circuit).to receive(:next_race).and_return(circuit)
    bet = create(:bet, user: user)

    visit bet_path(bet.id)

    expect(current_path).to eq root_path
  end
end
