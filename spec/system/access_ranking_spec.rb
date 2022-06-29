require 'rails_helper'

describe 'Usuário ascessa página de ranking das apostas' do
  it 'e vê ranking de uma corrida' do
    user1 = create(:user)
    user2 = create(:user, email: 'email2@email.com')
    user3 = create(:user, email: 'email3@email.com')
    
    circuit = create(:f1_circuit)
    allow(F1Circuit).to receive(:last_race).and_return(circuit)
    for i in 1..10 do
      create(:f1_driver, :"fdriver#{i}")
    end
    bet1 = create(:bet, user: user1, result_points: 120, validated: true)
    bet2 = create(:bet, user: user2, result_points: 168, validated: true)
    bet3 = create(:bet, user: user3, result_points: 144, validated: true)
    
    visit root_path
    click_on 'Ranking'
    click_on 'Última corrida'

    within("tr#bet-#{bet1.id}") do
      expect(page).to have_css('td', text: '3')
      expect(page).to have_css('td', text: '120 pts')
      expect(page).to have_css('td', text: 'ID: 1')
      expect(page).to have_css('td', text: user1.email)
    end

    within("tr#bet-#{bet2.id}") do
      expect(page).to have_css('td', text: '1')
      expect(page).to have_css('td', text: '168 pts')
      expect(page).to have_css('td', text: 'ID: 2')
      expect(page).to have_css('td', text: user2.email)
    end
    
    within("tr#bet-#{bet3.id}") do
      expect(page).to have_css('td', text: '2')
      expect(page).to have_css('td', text: '144 pts')
      expect(page).to have_css('td', text: 'ID: 3')
      expect(page).to have_css('td', text: user3.email)
    end


  end

  it 'e vê o ranking do campeonato'

  it 'e não existem apostas na última corrida'
  
  it 'e não existe nenhuma aposta no campeonato atual'
end