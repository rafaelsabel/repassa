# frozen_string_literal: true

class User < ApplicationRecord
  has_many :given_avaliations, class_name: Avaliation.to_s, foreign_key: :evaluated_id, dependent: :destroy
  has_many :received_avaliations, class_name: Avaliation.to_s, foreign_key: :evaluator_id, dependent: :nullify

  devise :database_authenticatable, :confirmable, :validatable

  enum role: { administrator: 1, employee: 2 }, _prefix: true

  validates :name, length: { maximum: 200 }, presence: true
  validates :email, length: { maximum: 100 }, presence: true
  validates :role, presence: true
end
