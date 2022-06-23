FactoryBot.define do
  factory :f1_circuit do
    name { 'Autódromo José Carlos Pace' }
    code { 'interlagos' }
    country { 'Brazil' }
    latitude { '-23.7036' }
    longitude { '-46.6997' }
    local { 'São Paulo' }
    round { 21 }
    fp1 { '2022-11-11 12:30:00' }
    fp2 { '2022-11-12 12:30:00' }
    fp3 { nil }
    qualifying { '2022-11-11 16:00:00' }
    sprint { '2022-11-12 16:30:00' }
    race { '2022-11-13 15:00:00' }
    year { 2022 }
    photo_path { '2022/interlagos.png' }
  end
end
