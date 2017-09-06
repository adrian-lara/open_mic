require './lib/joke'
require 'csv'

class User
  attr_reader :name, :jokes

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    @jokes << joke
  end

  def tell(recipient, joke)
    recipient.jokes << joke
  end

  def perform_routine_for(recipient)
    @jokes.each { |joke| tell(recipient, joke) }
  end

  def learn_routine(jokes_file)
    CSV.foreach(jokes_file, :headers => :first_row) do |line|
      each_line = line.join('')
      num, q_and_a = each_line.split(', ', 2)
      q, a = q_and_a.split('?, ', 2)
      learn(Joke.new({id: num, question: q, answer: a}))
    end
  end

end
