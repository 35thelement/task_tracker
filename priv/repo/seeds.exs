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

Repo.insert!(%User{email: "m.sakurai@nintendo.net", name: "Masahiro Sakurai"})
Repo.insert!(%User{email: "buyskyrimpls@bethesda.org", name: "Todd Howard"})
