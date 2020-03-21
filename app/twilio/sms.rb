
@client = Twilio::REST::Client.new(Rails.application.credentials.dig(:twilio, :account_sid), Rails.application.credentials.dig(:twilio, :auth_token))

message = @client.messages.create(
                             body: 'Hi there!',
                             from: '+12312250904',
                             to: '+13124681623'
                           )

puts message.sid