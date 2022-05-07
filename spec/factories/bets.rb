FactoryBot.define do
  factory :bet do
    user { nil }
    circuit { 'Miami' }
    year { 2022 }
    pole_position { 'LEC' }
    first { 'LEC' }
    second { 'VER' }
    third { 'PER' }
    fourth { 'RUS' }
    fifth { 'SAI' }
    sixth { 'NOR' }
    seventh { 'HAM' }
    eighth { 'BOT' }
    ninth { 'OCO' }
    tenth { 'MAG' }
  end
end
