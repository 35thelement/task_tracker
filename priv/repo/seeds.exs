# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TaskTracker.Repo.insert!(%TaskTracker.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias TaskTracker.Repo
alias TaskTracker.Users.User
alias TaskTracker.Tasks.Task

Repo.insert!(%User{email: "m.sakurai@nintendo.net", name: "Masahiro Sakurai"})
Repo.insert!(%User{email: "buyskyrimpls@bethesda.org", name: "Todd Howard"})
Repo.insert!(%Task{name: "Create Skyrim for Toasters", desc: "Make a version of Skyrim that is playable on a toaster oven.", done: false})
