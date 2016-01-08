# Description:
#   Respond to greetings

greet = (res) ->
    res.send 'Hello ' + res.envelope.user.name
farewell = (res) ->
    res.send 'Bye ' + res.envelope.user.name

module.exports = (robot) ->
    robot.hear /^hello( hubot)?$/i, greet
    robot.hear /^hi( hubot)?$/i, greet
    robot.hear /^(good )?morning( hubot)?$/i, greet
    robot.hear /^(good )?afternoon( hubot)?$/i, greet
    robot.hear /^bye hubot$/i, farewell
    robot.hear /^(good ?)?night hubot$/i, farewell
