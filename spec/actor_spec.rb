require_relative 'spec_helper'

describe "Actor" do
  let(:actor) {Actor.new}
  #TODO: implement the tests as described in the it blocks,
  #      and implement the class and migrations required to pass them

  # HINTS: look at show_spec.rb and network_spec.rb and character_spec.rb for guidance

  it "has a first and last name" do
    bob_newhart = Actor.create(:first_name => "Bob", :last_name => "Newhart")
    expect(bob_newhart.first_name).to eq("Bob")
    expect(bob_newhart.last_name).to eq("Newhart")
  end

  it "has associated characters in an array" do
    actor.first_name = "Arnold"
    characters = [
      Character.new(:name => "Terminator"),
      Character.new(:name => "Action hero")
    ]
    actor.characters << characters
    actor.save
    expect(actor.characters.count).to eq(2)
    expect(actor.characters.collect { |s| s.name }).to include("Terminator")
    # Hint: think about what migration you'll need to write so that an actor can have many characters.
    # Where will the association foreign key go?
    # TODO set up the appropriate association for characters and add characters through the array push
  end

  it "can build its associated characters" do
    # we can access the characters collection and call build there to build one
    actor.characters.build(:name => "Snoopy")
    actor.save
    expect(actor.characters.count).to eq(1)
    # TODO add a character to an actor with a build method
  end

  it "can build its associated shows through its characters" do
    actor.characters.build(:name => "Bugs Bunny").show = Show.create(name: "Looney Tunes")
    actor.save
    expect(actor.characters.count).to eq(1)
    expect(actor.shows.count).to eq(1)
    # TODO in one line, build a show and a character for this actor
  end

  it "can list its full name" do
    don = Actor.create(first_name: "Don", last_name: "Rickles")
    expect(don.full_name).to eq("Don Rickles")
  end

  it "can list all of its shows and characters" do
    actor.characters.build(:name => "Bugs Bunny").show = Show.create(name: "Looney Tunes")
    actor.characters.build(:name => "David Letterman").show = Show.create(name: "The Late Show")
    actor.save
    expect(actor.list_roles).to eq("Bugs Bunny - Looney Tunes\nDavid Letterman - The Late Show\n")
    # TODO create a list_roles method
    # TODO: build a method on actor that will return a string in the form of
    # character name - show name\n and test the results
  end
end
