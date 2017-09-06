require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'

class JokeTest < Minitest::Test

  attr_reader :joke

  def setup
    @joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
  end

  def test_joke_class_exists
    assert_instance_of Joke, @joke
  end

  def test_joke_has_hash_called_info_with_id_question_answer
    assert_equal 1, @joke.info[:id]
    assert_equal "Why did the strawberry cross the road?", @joke.info[:question]
    assert_equal "Because his mother was in a jam.", @joke.info[:answer]
  end

  def test_calling_the_key_string_of_the_info_hash_returns_the_value_of_that_key
    assert_equal 1, @joke.id
    assert_equal "Why did the strawberry cross the road?", @joke.question
    assert_equal "Because his mother was in a jam.", @joke.answer
  end

end
