# frozen_string_literal: true

User.create!(name: 'Ivan', email: 'ivan@email.com', password: '123456', role: 'administrator', confirmed_at: DateTime.now)
User.create!(name: 'Jair', email: 'jair@email.com', password: '123456', role: 'administrator', confirmed_at: DateTime.now)
User.create!(name: 'Kaio', email: 'kaio@email.com', password: '123456', role: 'employee', confirmed_at: DateTime.now)
User.create!(name: 'José', email: 'jose@email.com', password: '123456', role: 'employee', confirmed_at: DateTime.now)
User.create!(name: 'Raul', email: 'raul@email.com', password: '123456', role: 'employee', confirmed_at: DateTime.now)
User.create!(name: 'Ruan', email: 'ruan@email.com', password: '123456', role: 'employee', confirmed_at: DateTime.now)
