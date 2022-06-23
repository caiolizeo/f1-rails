FactoryBot.define do
  factory :bet do
    user { nil }
    circuit { 'interlagos' }
    year { 2022 }
    pole { 'LEC' }
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
    result_points { 0 }
    validated { false }
  end
end
