# frozen_string_literal: true

FactoryBot.define do
  factory :avaliation do
    association :evaluator
    association :evaluated

    organization { 'satisfactory' }
    responsibility { 'satisfactory' }
    proactivity { 'satisfactory' }
    team_work { 'satisfactory' }
    creativity { 'satisfactory' }
    focus { 'satisfactory' }
  end
end
