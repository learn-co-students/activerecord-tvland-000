require_relative 'spec_helper'

describe "Actor" do
  #TODO: implement the tests as described in the it blocks,
  #      and implement the class and migrations required to pass them

  # HINTS: look at show_spec.rb and network_spec.rb and character_spec.rb for guidance

  let(:actor) { Actor.new }
  
  it "has a first and last name" do
    # TODO set up the basic data model for actor
	actor.first_name = "John"
	actor.last_name = "Doe"
	expect(actor.first_name).to eq("John")
	expect(actor.last_name).to eq("Doe")
  end

  it "has associated characters in an array" do
    # Hint: think about what migration you'll need to write so that an actor can have many characters.
    # Where will the association foreign key go?
    # TODO set up the appropriate association for characters and add characters through the array push
	characters = [
	  Character.new(name: "Man"),
	  Character.new(name: "Woman")
	]
	actor.characters << characters
	expect(actor.characters.size).to eq(2)
  end

  it "can build its associated characters" do
    # TODO add a character to an actor with a build method
	actor.characters.build(name: "Cat")
	cats = actor.characters.select { |char| char.name == "Cat" }
	expect(cats.size).to eq(1)
  end

  it "can build its associated shows through its characters" do
    # TODO in one line, build a show and a character for this actor
	actor.characters.build(name: "Char").build_show(name: "Show")
    expect(actor.characters.size).to eq(1)
    expect(actor.characters[0].show.name).to eq("Show")
  end

  it "can list its full name" do
    # TODO create an instance method on actor called .full_name to return first and last name together
	expect(Actor.new(first_name: "John", last_name: "Doe").full_name).to eq("John Doe")
  end

  it "can list all of its shows and characters" do
    # TODO create a list_roles method
    # TODO: build a method on actor that will return a string in the form of
    # character name - show name\n and test the results
	characters = [
	  Character.new(name: "Man"),
	  Character.new(name: "Woman"),
	  Character.new(name: "Cat"),
	  Character.new(name: "Dog")
	]
	actor.characters << characters
	
	characters[0].build_show(name: "People")
	characters[1].show = characters[0].show
	characters[2].build_show(name: "Pets")
	characters[3].show = characters[2].show
	
	str = "Man - People\nWoman - People\nCat - Pets\nDog - Pets\n"
	expect(actor.list_roles).to eq(str)
  end
end
