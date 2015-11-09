# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Patient.create(
               ssn: 1111111111,
               name: "Donna Noble",
               gender: 1,
               date_of_birth: "1963-04-05")
Patient.create(
               ssn: 2222222221,
               name: "Nate Ford",
               gender: 0,
               date_of_birth: "1967-07-18")
Patient.create(
               ssn: 3333333331,
               name: "Parker",
               gender: 1,
               date_of_birth: "1976-03-10")
Patient.create(
               ssn: 4444444441,
               name: "Bill Adama",
               gender: 0,
               date_of_birth: "1982-10-03")
Patient.create(
               ssn: 5555555551,
               name: "Sophie Devereaux",
               gender: 1,
               date_of_birth: "1992-03-15")
Patient.create(
               ssn: 6666666661,
               name: "Susan Ivanova",
               gender: 1,
               date_of_birth: "1998-02-09")
Patient.create(
               ssn: 7777777771,
               name: "Alec Hardison",
               gender: 0,
               date_of_birth: "2004-11-06")
Patient.create(
               ssn: 8888888881,
               name: "Jean Luc Picard",
               gender: 0,
               date_of_birth: "2007-03-16")
Patient.create(
               ssn: 9999999991,
               name: "Uzumaki Naruto",
               gender: 0,
               date_of_birth: "2011-07-07")
Patient.create(
               ssn: 1234567891,
               name: "Joan Watson",
               gender: 1,
               date_of_birth: "2012-10-17")