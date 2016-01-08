# Description:
#   Respond to greetings

greet = (res) ->
    res.send 'Hello ' + res.envelope.user.name

module.exports = (robot) ->
    robot.hear /^hello( hubot)?$/i, greet
    robot.hear /^hi( hubot)?$/i, greet
    robot.hear /^(good )?morning( hubot)?$/i, greet
    robot.hear /^(good )?afternoon( hubot)?$/i, greet
