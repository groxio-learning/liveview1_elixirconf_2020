# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Remembrall.Repo.insert!(%Remembrall.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
Repo.insert! %Passage{
    title: "IT Crowd",
    text: "Have you tried turning it off and on again?",
    steps: 3
  }

Repo.insert! %Passage{
  title: "LOTR",
  text: "One does not simply walk into Mordor",
  steps: 4
}

Repo.insert! %Passage{
  title: "StarWars",
  text: "I am your father",
  steps: 2
}
  
