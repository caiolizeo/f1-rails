class Bet < ApplicationRecord
  belongs_to :user
  validate :verify_bet


  def self.update_all
    resp = Faraday.get('http://ergast.com/api/f1/current/last/results.json')
    resp_result = JSON.parse(resp.body)['MRData']['RaceTable']['Races'][0]['Results']
    circuit_id = JSON.parse(resp.body)['MRData']['RaceTable']['Circuit']['circuitId']
    circuit_season = JSON.parse(resp.body)['MRData']['RaceTable']['season']

    bets = Bet.where("year = '#{circuit_season}' and circuit = '#{circuit_id}' and validated = false")

    return nil if bets.empty?

    # criar logica de pontuação
    # ===============================
    # pole: 20pts

    # Pontos por piloto
    # acertou a posição piloto: 20pts
    # 1 posição acima/abaixo: 18pts
    # 2 posições acima/abaixo: 16pts
    # 3 posições acima/abaixo: 14pts
    # 4 posições acima/abaixo: 12pts
    # 5 posições acima/abaixo: 10pts
    # 6 posições acima/abaixo: 8pts
    # 7 posições acima/abaixo: 6pts
    # 8 posições acima/abaixo: 4pts
    # 9 posições acima/abaixo: 2pts
    # 10 posições acima/abaixo: 1pt
    # 11 posições ou mais: 0pts
    # ===============================

  end

  private

  def verify_bet
    duplicated_bet = Bet.where("user_id = '#{self.user_id}' and circuit ='#{self.circuit}' and year ='#{self.year}'")
    
    errors.add(:base, 'Você não pode fazer outra aposta para essa corrida!') unless duplicated_bet.empty?
    
    errors.add(:base, "Corrida ou ano inválido!") unless Circuit.next_race.id == self.circuit || Circuit.next_race.date.last(4) == self.year
    
    driver_codes = [self.first, self.second, self.third, self.fourth, self.fifth, self.sixth, self.seventh, self.eighth, self.ninth, self.tenth]
    errors.add(:base, "Não são permitidos pilotos duplicados ou em branco!") if driver_codes.detect{ |e| driver_codes.count(e) > 1 } != nil
   

    driver_codes.each do |code|
      driver = FormulaOneDriver.find_by(code: code, year: Circuit.next_race.date.last(4))
      errors.add(:base, "Um ou mais pilotos inválidos!") if driver == nil
    end
  end

end
