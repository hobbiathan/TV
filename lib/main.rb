require 'discordrb'
require 'pry'

bot = Discordrb::Commands::CommandBot.new token: "", prefix: '.'

bot.message(with_text: "ping") do |event|
  event.respond "pong"
end

bot.command(:exit, help_available: false) do |event|
  # This is a check that only allows a user with a specific ID to execute this command. Otherwise, everyone would be
  # able to shut your bot down whenever they wanted.
  break unless event.user.id == 869065622439493694 # Replace number with your ID

  bot.send_message(event.channel.id, 'Bot is shutting down')
  exit
end

bot.command :flowers do |event|
  # The `pm` method is used to send a private message (also called a DM or direct message) to the user who sent the
  # initial message.
  event.user.send_file(File.open("assets/voices/flowers.txt", 'r'))
  # event.user.send_file(File.open("assets/images/flowers.JPG", 'r'))
  event.user.add_role(915110881837334530, "grow")
end

bot.run
