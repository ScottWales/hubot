# Description:
#   Respond to greetings

greet = (res) ->
    res.send 'Hello ' + res.envelope.user.name
farewell = (res) ->
    res.send 'Bye ' + res.envelope.user.name
street = (res) ->
    res.send 'Sup ' + res.envelope.user.name
maori = (res) ->
    res.send 'Tēnā koutou tēnā koutou tēnā tātou katoa. Haere mai haere mai haere mai ' + res.envelope.user.name

module.exports = (robot) ->
    robot.hear /^hello( hubot)?$/i, greet
    robot.hear /^hi( hubot)?$/i, greet
    robot.hear /^(good )?morning( hubot)?$/i, greet
    robot.hear /^(good )?afternoon( hubot)?$/i, greet
    robot.hear /^kia ora( hubot)?$/i, maori
    robot.hear /^sup( hubot)?$/i, street
    robot.hear /^bye hubot$/i, farewell
    robot.hear /^(good ?)?night hubot$/i, farewell
