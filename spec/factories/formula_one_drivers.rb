FactoryBot.define do
  factory :formula_one_driver do
    Name { "Lewis Hamilton" }
    Country { "Great Britain" }
    Team { "Mercedes" }
    Number { 44 }
    Position { 1 }
    points { 100 }
    year { 2022 }
    number_img { 'hamilton_logo.png' }
    photo_img { 'hamilton_photo.img' }
  end
end
