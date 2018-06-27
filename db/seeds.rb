# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Talk.delete_all
Speaker.delete_all
Comment.delete_all
Tag.delete_all
Spectator.delete_all


Talk.create(title: 'The Future of Rails 6: Scalable by Default', speaker: Speaker.create(name: 'Eileen M. Uchitelle'))
Talk.create(title: 'Less code, more confidence', speaker: Speaker.create(name: 'Lucas Tolchinsky'))
Talk.create(title: 'Building Serverless Ruby Bots', speaker: Speaker.create(name: 'Damir Svrtan'))
Talk.create(title: 'Food, Wine and Machine Learning: Teaching a Bot to Taste', speaker: Speaker.create(name: 'Mai Nguyen'))
Talk.create(title: 'How to onboard a junior developer', speaker: Speaker.create(name: 'Christophe Philemotte'))
Talk.create(title: 'It\'s Rubies All The Way Down!', speaker: Speaker.create(name: 'Kirk Haines'))
Talk.create(title: 'GraphQL-DDD on Rails architecture', speaker: Speaker.create(name: 'Paul-Armand Assus'))
Talk.create(title: 'Ruby and Art: The Earliest Stage', speaker: Speaker.create(name: 'Koichiro Eto'))
Talk.create(title: 'Writing a Command Line Utility in Ruby - Automation is Not Just For Your Users', speaker: Speaker.create(name: 'Keith Bennett'))
Talk.create(title: 'Living on Rails edge', speaker: Speaker.create(name: 'Rafael França'))
Talk.create(title: 'Event Sourcing for Everyone', speaker: Speaker.create(name: 'Jenna Blumenthal'))
Talk.create(title: 'Human Errors', speaker: Speaker.create(name: 'Olivier Lacan'))
Talk.create(title: 'RubyGems 3 & 4', speaker: Speaker.create(name: 'Hiroshi Shibata'))
Talk.create(title: 'Clean code lessons from messy humans', speaker: Speaker.create(name: 'Sylvain Abélard'))
Talk.create(title: 'Crystal: How using a compiled language made me write better Ruby', speaker: Speaker.create(name: 'Luis Lavena'))
Talk.create(title: '99 problems of slow tests', speaker: Speaker.create(name: 'Vladimir Dementyev'))
Talk.create(title: 'Ruby 4.0: To Infinity and Beyond', speaker: Speaker.create(name: 'Bozhidar Batsov'))
Talk.create(title: 'Aesthetics and the Evolution of Code', speaker: Speaker.create(name: 'Coraline Ehmke'))
100.times do
  Comment.create(spectator: Spectator.find_or_create_by(name: Faker::Name.first_name), talk: Talk.order('RANDOM()').first, body: Faker::TheITCrowd.quote)
end
