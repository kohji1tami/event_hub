FactoryGirl.define do
  factory :event do
    owner
    sequence(:name) { |i| "name#{i}" }
    sequence(:place) { |i| "place#{i}" }
    sequence(:content) { |i| "content#{i}" }
    start_time { rand(1..30).days.from_now }
    end_time { start_time + rand(1..30).hours }
  end

end
