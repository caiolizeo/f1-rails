class Bet < ApplicationRecord
  belongs_to :user


  validate :verify_bet

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
