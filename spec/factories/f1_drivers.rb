FactoryBot.define do
  factory :f1_driver do
    trait :fdriver1 do
      first_name { 'Charles' }
      last_name { 'Leclerc' }
      full_name { 'Charles Leclerc' }
      code { 'LEC' }
      country { 'Monegasque' }
      team { 'Ferrari' }
      number { 16 }
      year { 2022 }
      logo_img { '2022/leclerc_logo.png' }
      photo_img { '2022/leclerc_photo.png' }
    end

    trait :fdriver2 do
      first_name { 'Lewis' }
      last_name { 'Hamilton' }
      full_name { 'Lewis Hamilton' }
      code { 'HAM' }
      country { 'Great Britain' }
      team { 'Mercedes' }
      number { 44 }
      year { 2022 }
      logo_img { '2022/hamilton_logo.png' }
      photo_img { '2022/hamilton_photo.png' }
    end

    trait :fdriver3 do
      first_name { 'Max' }
      last_name { 'Verstappen' }
      full_name { 'Max Verstappen' }
      code { 'VER' }
      country { 'Dutch' }
      team { 'Red Bull' }
      number { 33 }
      year { 2022 }
      logo_img { '2022/max_verstappen_logo.png' }
      photo_img { '2022/max_verstappen_photo.png' }
    end

    trait :fdriver4 do
      first_name { 'Sergio' }
      last_name { 'Pérez' }
      full_name { 'Sergio Pérez' }
      code { 'PER' }
      country { 'Mexican' }
      team { 'Red Bull' }
      number { 11 }
      year { 2022 }
      logo_img { '2022/perez_logo.png' }
      photo_img { '2022/perez_photo.png' }
    end

    trait :fdriver5 do
      first_name { 'George' }
      last_name { 'Russell' }
      full_name { 'George Russell' }
      code { 'RUS' }
      country { 'Great Britain' }
      team { 'Mercedes' }
      number { 63 }
      year { 2022 }
      logo_img { '2022/russell_logo.png' }
      photo_img { '2022/russell_photo.png' }
    end

    trait :fdriver6 do
      first_name { 'Carlos' }
      last_name { 'Sainz' }
      full_name { 'Carlos Sainz' }
      code { 'SAI' }
      country { 'Spanish' }
      team { 'Ferrari' }
      number { 55 }
      year { 2022 }
      logo_img { '2022/sainz_logo.png' }
      photo_img { '2022/sainz_photo.png' }
    end

    trait :fdriver7 do
      first_name { 'Lando' }
      last_name { 'Norris' }
      full_name { 'Lando Norris' }
      code { 'NOR' }
      country { 'Great Britain' }
      team { 'McLaren' }
      number { 4 }
      year { 2022 }
      logo_img { '2022/norris_logo.png' }
      photo_img { '2022/norris_photo.png' }
    end

    trait :fdriver8 do
      first_name { 'Valtteri' }
      last_name { 'Bottas' }
      full_name { 'Valtteri Bottas' }
      code { 'BOT' }
      country { 'Finnish' }
      team { 'Alfa Romeo' }
      number { 77 }
      year { 2022 }
      logo_img { '2022/bottas_logo.png' }
      photo_img { '2022/bottas_photo.png' }
    end

    trait :fdriver9 do
      first_name { 'Esteban' }
      last_name { 'Ocon' }
      full_name { 'Esteban Ocon' }
      code { 'OCO' }
      country { 'French' }
      team { 'Alpine' }
      number { 31 }
      year { 2022 }
      logo_img { '2022/ocon_logo.png' }
      photo_img { '2022/ocon_photo.png' }
    end

    trait :fdriver10 do
      first_name { 'Kevin' }
      last_name { 'Magnussen' }
      full_name { 'Kevin Magnussen' }
      code { 'MAG' }
      country { 'Danish' }
      team { 'Haas' }
      number { 20 }
      year { 2022 }
      logo_img { '2022/kevin_magnussen_logo.png' }
      photo_img { '2022/kevin_magnussen_photo.png' }
    end
  end
end
