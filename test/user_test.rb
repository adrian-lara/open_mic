require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/user'
require './lib/joke'


class UserTest < Minitest::Test

  def test_it_exists
    sal = User.new("Sal")

    assert_instance_of User, sal
  end

  def test_it_has_a_name
    sal = User.new("Sal")

    assert_equal "Sal", sal.name
  end

  def test_it_can_have_another_name
    ali = User.new("Ali")

    assert_equal "Ali", ali.name
  end

  attr_reader :sal

  def setup
    @sal = User.new("Sal")
    @ali = User.new("Ali")
  end

  def test_user_has_a_jokes_array_defaulted_as_empty
    assert_equal [], @sal.jokes
  end

  def test_learn_gives_user_instance_of_joke_class_and_inputs_it_into_jokes_array
    assert_equal [], @sal.jokes
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    @sal.learn(joke)

    assert_equal 1, @sal.jokes.count
    assert_instance_of Joke, @sal.jokes[0]
  end

  def test_tell_inserts_joke_from_second_users_jokes_array_into_recipients_jokes_array
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    @sal.learn(joke)

    assert_equal [], @ali.jokes
    @sal.tell(@ali, @sal.jokes[0])

    assert_equal 1, @ali.jokes.count
    assert_instance_of Joke, @ali.jokes[0]
    assert_equal @sal.jokes[0], @ali.jokes[0]
  end

  def test_perform_routine_for_gives_recipient_all_jokes_in_users_jokes_array
    joke_1 = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    joke_2 = Joke.new({id: 2, question: "How do you keep a lion from charging?", answer: "Take away its credit cards."})
    @sal.learn(joke_1)
    @sal.learn(joke_2)

    assert_equal [], @ali.jokes
    @sal.perform_routine_for(@ali)

    assert_equal 2, @ali.jokes.count
    assert_equal @sal.jokes, @ali.jokes
  end

  def test_learn_routines_allows_users_to_learn_jokes_from_CSV
    assert_equal [], @sal.jokes
    @sal.learn_routine('./jokes.csv')

    assert_equal 100,@sal.jokes.count
  end

end
