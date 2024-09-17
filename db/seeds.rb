# Criar usuários
user1 = User.create!(name: "Alice", email: "alice@example.com", password: "password")
user2 = User.create!(name: "Bob", email: "bob@example.com", password: "password")

# Criar hotéis
hotel1 = Hotel.create!(name: "Hotel Central", cnpj: "12345678901", phone: "12345678", manager: "Alice", user: user1)
hotel2 = Hotel.create!(name: "Hotel Riverside", cnpj: "98765432109", phone: "87654321", manager: "Bob", user: user2)

# Criar classes financeiras (Receitas e Despesas)
revenue_class = FinancialClass.create!(name: "Receita", abbreviation: "REC", is_revenue: true, user: user1)
expense_class = FinancialClass.create!(name: "Despesa", abbreviation: "DESP", is_revenue: false, user: user1)

# Criar contas financeiras
financial_account1 = FinancialAccount.create!(bank: "Banco A", account_name: "Conta Corrente A", account_number: "123456", agency: "001", description: "Conta principal", hotel: hotel1, user: user1)
financial_account2 = FinancialAccount.create!(bank: "Banco B", account_name: "Conta Corrente B", account_number: "654321", agency: "002", description: "Conta secundária", hotel: hotel2, user: user2)

# Criar métodos de pagamento
payment_method1 = PaymentMethod.create!(name: "Cartão de Crédito", financial_account: financial_account1, rate: 2.5)
payment_method2 = PaymentMethod.create!(name: "Boleto", financial_account: financial_account2, rate: 1.5)

# Criar quartos aleatórios
def create_rooms_for_hotel(hotel, user, count)
  count.times do |i|
    Room.create!(
      name: "#{Faker::Commerce.product_name} #{i + 1}",
      description: Faker::Lorem.sentence,
      price: Faker::Commerce.price(range: 100.0..500.0),
      hotel: hotel,
      user: user
    )
  end
end

# Criar vários quartos para cada hotel
puts "Criando quartos para o primeiro hotel..."
create_rooms_for_hotel(hotel1, user1, 10)  # 10 quartos para o primeiro hotel
puts "Criando quartos para o segundo hotel..."
create_rooms_for_hotel(hotel2, user2, 10)  # 10 quartos para o segundo hotel

# Criar endereços e hóspedes aleatórios
def create_guests_with_address(user, count)
  count.times do
    address = Address.create!(
      street: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::Address.state,
      zip: Faker::Address.zip_code,
      country: Faker::Address.country,
      neighborhood: 'Bairro exemplo'
    )
    
    Guest.create!(
      name: Faker::Name.name,
      phone: Faker::PhoneNumber.phone_number,
      address: address,  # Associar com o endereço
      user: user
    )
  end
end

# Criar vários hóspedes com endereços
puts "Criando hóspedes com endereços..."
create_guests_with_address(user1, 45)  # 10 hóspedes para o primeiro usuário
create_guests_with_address(user2, 30)  # 10 hóspedes para o segundo usuário

# Função para gerar ordens, pagamentos e transações aleatórios
def generate_random_orders_payments_transactions(user, hotel, financial_class, payment_method, room, guests, count)
  statuses = ['Confirmado', 'Pendência', 'Cancelado', 'Em Processamento']

  count.times do
    entry_date = Faker::Date.between(from: 1.year.ago, to: Date.today)
    execution_date = entry_date + rand(1..30).days
    total_value = Faker::Commerce.price(range: 100.0..5000.0)
    check_in_date = Faker::Date.between(from: 5.days.ago, to: Date.today)
    check_out_date = check_in_date + rand(1..14).days  # Checkout entre 1 a 14 dias após o check-in

    # Criar ordem com status aleatório
    order = Order.create!(
      user: user,
      hotel: hotel,
      room: room,
      check_in_date: check_in_date,
      check_out_date: check_out_date,
      financial_class: financial_class,
      guest: guests.sample  # Associar com um guest aleatório
    )

    # Criar pagamento associado à ordem
    payment = Payment.create!(
      entry_date: entry_date,
      execution_date: execution_date,
      price: total_value,
      financial_class: financial_class,
      user: user,
      hotel: hotel,
      order: order  # Associação com a ordem
    )

    # Criar transação associada ao pagamento
    transaction_type = financial_class.is_revenue ? :income : :expense

    Transaction.create!(
      execution_date: execution_date,
      description: Faker::Commerce.product_name,
      payment_method: payment_method,
      price: total_value,
      transaction_type: transaction_type,  # Usando enum :income ou :expense
      financial_class: financial_class,
      user: user,
      entry_date: entry_date,
      payment: payment  # Associação com o pagamento
    )
  end
end

# Gerar ordens, pagamentos e transações para o primeiro usuário e hotel
puts "Gerando ordens, pagamentos e transações para o primeiro usuário e hotel..."
rooms = Room.where(hotel: hotel1)
generate_random_orders_payments_transactions(user1, hotel1, revenue_class, payment_method1, rooms.sample, Guest.where(user: user1), 100) # 100 receitas
generate_random_orders_payments_transactions(user1, hotel1, expense_class, payment_method2, rooms.sample, Guest.where(user: user1), 80)  # 80 despesas

# Gerar ordens, pagamentos e transações para o segundo usuário e hotel
puts "Gerando ordens, pagamentos e transações para o segundo usuário e hotel..."
rooms = Room.where(hotel: hotel2)
generate_random_orders_payments_transactions(user2, hotel2, revenue_class, payment_method1, rooms.sample, Guest.where(user: user2), 120) # 120 receitas
generate_random_orders_payments_transactions(user2, hotel2, expense_class, payment_method2, rooms.sample, Guest.where(user: user2), 90)  # 90 despesas

puts "Seed concluído!"