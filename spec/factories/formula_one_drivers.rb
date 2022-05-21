FactoryBot.define do
  factory :formula_one_driver do
    trait :fdriver1 do
      name { "Charles" }
      last_name { "Leclerc" }
      full_name { "Charles Leclerc" }
      country { "Monegasque" }
      team { "Ferrari" }
      number { 16 }
      year { 2022 }
      logo_img { '2022/leclerc_logo.png' }
      photo_img { '2022/leclerc_photo.png' }
      code { "LEC" }
    end

    trait :fdriver2 do
      name { "Lewis" }
      last_name { "Hamilton" }
      full_name { "Lewis Hamilton" }
      country { "Great Britain" }
      team { "Mercedes" }
      number { 44 }
      year { 2022 }
      logo_img { '2022/hamilton_logo.png' }
      photo_img { '2022/hamilton_photo.png' }
      code { "HAM" }
    end

    trait :fdriver3 do
      name { "Max" }
      last_name { "Verstappen" }
      full_name { "Max Verstappen" }
      country { "Dutch" }
      team { "Red Bull" }
      number { 33 }
      year { 2022 }
      logo_img { '2022/max_verstappen_logo.png' }
      photo_img { '2022/max_verstappen_photo.png' }
      code { "VER" }
    end

    trait :fdriver4 do
      name { "Sergio" }
      last_name { "Pérez" }
      full_name { "Sergio Pérez" }
      country { "Mexican" }
      team { "Red Bull" }
      number { 11 }
      year { 2022 }
      logo_img { '2022/perez_logo.png' }
      photo_img { '2022/perez_photo.png' }
      code { "PER" }
    end

    trait :fdriver5 do
      name { "George" }
      last_name { "Russell" }
      full_name { "George Russell" }
      country { "Great Britain" }
      team { "Mercedes" }
      number { 63 }
      year { 2022 }
      logo_img { '2022/russell_logo.png' }
      photo_img { '2022/russell_photo.png' }
      code { "RUS" }
    end

    trait :fdriver6 do
      name { "Carlos" }
      last_name { "Sainz" }
      full_name { "Carlos Sainz" }
      country { "Spanish" }
      team { "Ferrari" }
      number { 55 }
      year { 2022 }
      logo_img { '2022/sainz_logo.png' }
      photo_img { '2022/sainz_photo.png' }
      code { "SAI" }
    end

    trait :fdriver7 do
      name { "Lando" }
      last_name { "Norris" }
      full_name { "Lando Norris" }
      country { "Great Britain" }
      team { "McLaren" }
      number { 4 }
      year { 2022 }
      logo_img { '2022/norris_logo.png' }
      photo_img { '2022/norris_photo.png' }
      code { "NOR" }
    end

    trait :fdriver8 do
      name { "Valtteri" }
      last_name { "Bottas" }
      full_name { "Valtteri Bottas" }
      country { "Finnish" }
      team { "Alfa Romeo" }
      number { 77 }
      year { 2022 }
      logo_img { '2022/bottas_logo.png' }
      photo_img { '2022/bottas_photo.png' }
      code { "BOT" }
    end

    trait :fdriver9 do
      name { "Esteban" }
      last_name { "Ocon" }
      full_name { "Esteban Ocon" }
      country { "French" }
      team { "Alpine" }
      number { 31 }
      year { 2022 }
      logo_img { '2022/ocon_logo.png' }
      photo_img { '2022/ocon_photo.png' }
      code { "OCO" }
    end

    trait :fdriver10 do
      name { "Kevin" }
      last_name { "Magnussen" }
      full_name { "Kevin Magnussen" }
      country { "Danish" }
      team { "Haas" }
      number { 20 }
      year { 2022 }
      logo_img { '2022/kevin_magnussen_logo.png' }
      photo_img { '2022/kevin_magnussen_photo.png' }
      code { "MAG" }
    end
  end
end
