users_data = [
  {
    id: 1,
    first_name: 'Jon',
    last_name: 'Snow',
    email: 'northboy@westeros.com'
  }, {
    id: 2,
    first_name: 'Sherlock',
    last_name: 'Holmes',
    email: 'john@watson.com'
  }
]

users_info = {}

result = users_data.map do |user_data|
  info = user_data.select { |key, value| [:email, :last_name].include?(key) }
  users_info.merge(info)
end

p result
