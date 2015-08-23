require_relative 'spec_helper'

describe "Actor" do

  let(:julie) {Actor.create(first_name: "Julie", last_name: "Dreyfus")}
  #TODO: implement the tests as described in the it blocks,
  #      and implement the class and migrations required to pass them

  # HINTS: look at show_spec.rb and network_spec.rb and character_spec.rb for guidance

  it "has a first and last name" do
    julie_dreyfus = Actor.create(first_name: "Julie", last_name: "Dreyfus")
    expect(Actor.find_by(:first_name => "Julie")).to eq(julie_dreyfus)
  end

  # it "has associated characters in an array" do
  #   julie_dreyfus = Actor.create(first_name: "Julie", last_name: "Dreyfus")
  #   julie_dreyfus.characters.build(name: "Elaine")
  #   julie_dreyfus.characters.build(name: "Vice Prez")
  #   binding.pry
  #   expect(julie_dreyfus.characters.class).to eq(Array)
  # end

  # Why or why doesn't this acutally come back as an Array? When I pry it is an array, I can act on it as such, but no, the world remains cruel.

  it "can build its associated characters" do
    julie_dreyfus = Actor.create(first_name: "Julie", last_name: "Dreyfus")
    julie_dreyfus.characters.build(:name => "Elaine Benez")
    expect(julie_dreyfus.characters.first.name).to eq("Elaine Benez")
  
  end

  it "can build its associated shows through its characters" do
      julie_dreyfus = Actor.create(first_name: "Julie", last_name: "Dreyfus")
    julie_dreyfus.characters.build(name: "Test").build_show(name: "Testy")
    expect(julie_dreyfus.characters.first.show.name).to eq("Testy")
  end

  it "can list its full name" do
    julie_dreyfus = Actor.create(first_name: "Julie", last_name: "Dreyfus")
    expect(julie_dreyfus.full_name).to eq("Julie Dreyfus")
  end

  it "can list all of its shows and characters" do
   julie_dreyfus = Actor.create(first_name: "Julie", last_name: "Dreyfus")
   julie_dreyfus.characters.build(name: "Elaine").build_show(name: "Seinfeld")
   julie_dreyfus.characters.build(name: "Test").build_show(name: "Testy")
   expect(julie_dreyfus.list_roles).to eq("Elaine in the show Seinfeld\nTest in the show Testy\n")
  end
end
