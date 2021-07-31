FactoryBot.define do
  factory :user do
    nickname              {"tarou"}
    email                 {"sample@gmail.com"}
    password              {"123456"}
    encrypted_password    {"123456"}
    family_name           {"山田"}
    read_family           {"ヤマダ"}
    first_name            {"太郎"}
    read_first            {"タロウ"}
    birth                 {"2000-01-01"}
  end
end