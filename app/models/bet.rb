class Bet < ApplicationRecord
  belongs_to :user
  before_validation :verify_bet, on: :create
  enum validated: { validated: true, invalidated: false }

  def self.update_all
    resp = Faraday.get('http://ergast.com/api/f1/current/last/results.json')
    circuit_id = JSON.parse(resp.body)['MRData']['RaceTable']['Races'][0]['Circuit']['circuitId']
    circuit_season = JSON.parse(resp.body)['MRData']['RaceTable']['season']

    bets = Bet.where(year: circuit_season, circuit: circuit_id, validated: 'invalidated')

    puts '=== NENHUMA APOSTA PARA ATUALIZAR ===' if bets.empty?
    return nil if bets.empty?
    
    q_resp = Faraday.get('http://ergast.com/api/f1/current/last/qualifying.json')
    pole = JSON.parse(q_resp.body)['MRData']['RaceTable']['Races'][0]['QualifyingResults'][0]['Driver']['code']

    dvr = F1Driver.where(year: circuit_season)
    drivers = {}

    resp_result = JSON.parse(resp.body)['MRData']['RaceTable']['Races'][0]['Results']

    resp_result.each do |r|
      drivers[r['Driver']['code']] = r['position']
    end

    bets.each do |bet|
      points = 0

      points += 20 if pole == bet.pole

      points += calculate_points((1 - drivers[bet.first].to_i).abs)
      points += calculate_points((2 - drivers[bet.second].to_i).abs)
      points += calculate_points((3 - drivers[bet.third].to_i).abs)
      points += calculate_points((4 - drivers[bet.fourth].to_i).abs)
      points += calculate_points((5 - drivers[bet.fifth].to_i).abs)
      points += calculate_points((6 - drivers[bet.sixth].to_i).abs)
      points += calculate_points((7 - drivers[bet.seventh].to_i).abs)
      points += calculate_points((8 - drivers[bet.eighth].to_i).abs)
      points += calculate_points((9 - drivers[bet.ninth].to_i).abs)
      points += calculate_points((10 - drivers[bet.tenth].to_i).abs)

      bet.result_points = points 
      bet.validated!
      bet.save
    end
    
    return nil
  end

  def self.calculate_points(position)
    return 20 if position == 0
    return 18 if position == 1
    return 16 if position == 2
    return 14 if position == 3
    return 12 if position == 4
    return 10 if position == 5
    return 8 if position == 6
    return 6 if position == 7
    return 4 if position == 8
    return 2 if position == 9
    return 1 if position == 10
    return 0
  end

  private

  def verify_bet
    next_race = F1Circuit.next_race

    duplicated_bet = Bet.where(user_id: self.user_id, circuit: self.circuit, year: self.year)
    
    errors.add(:base, 'Você não pode fazer outra aposta para essa corrida') unless duplicated_bet.empty?
    
    errors.add(:base, "Corrida ou ano inválido") unless next_race.code == self.circuit || next_race.year == self.year
    
    driver_codes = [self.first, self.second, self.third, self.fourth, self.fifth, self.sixth, self.seventh, self.eighth, self.ninth, self.tenth]
    errors.add(:base, "Não são permitidos pilotos duplicados ou em branco") if driver_codes.detect{ |e| driver_codes.count(e) > 1 } != nil || self.pole == ''
   
    driver_codes.each do |code|
      driver = F1Driver.find_by(code: code, year: next_race.year)
      errors.add(:base, "Um ou mais pilotos inválidos") if driver == nil
    end
  end

end
