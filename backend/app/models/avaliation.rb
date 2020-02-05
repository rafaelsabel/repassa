# frozen_string_literal: true

class Avaliation < ApplicationRecord
  belongs_to :evaluator, class_name: User.to_s, optional: true
  belongs_to :evaluated, class_name: User.to_s

  enum organization: { below_expected: 1, satisfactory: 2, above_expected: 3 }, _prefix: true
  enum responsibility: { below_expected: 1, satisfactory: 2, above_expected: 3 }, _prefix: true
  enum proactivity: { below_expected: 1, satisfactory: 2, above_expected: 3 }, _prefix: true
  enum team_work: { below_expected: 1, satisfactory: 2, above_expected: 3 }, _prefix: true
  enum creativity: { below_expected: 1, satisfactory: 2, above_expected: 3 }, _prefix: true
  enum focus: { below_expected: 1, satisfactory: 2, above_expected: 3 }, _prefix: true

  validates :evaluator, presence: true, on: :create

  validates :organization, presence: true
  validates :responsibility, presence: true
  validates :proactivity, presence: true
  validates :team_work, presence: true
  validates :creativity, presence: true
  validates :focus, presence: true
end
