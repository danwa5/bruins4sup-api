FactoryGirl.define do
  factory :user do
    provider { 'twitter' }
    uid { Faker::Twitter.send(:id).to_s }
    name { Faker::Name.name }
    token { Faker::Crypto.md5 }
    secret { Faker::Crypto.md5 }
  end

  factory :tweeter do
    uid { Faker::Twitter.send(:id).to_s }
    name { Faker::Name.name_with_middle }
    screen_name do
      names = name.gsub("'", "").split(' ')
      "#{names[0][0]}_#{names[1][0]}_#{names[2]}".downcase
    end
    description { Faker::Hipster.sentence }
    profile_image_url { Faker::Internet.url('example.com', '/profile.jpg') }
  end
end
