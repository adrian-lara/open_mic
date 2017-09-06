class Joke

  attr_reader :info

  def initialize(info)
    @info = info
  end

  def id
    @info[:id]
  end

  def question
    @info[:question]
  end

  def answer
    @info[:answer]
  end

end
