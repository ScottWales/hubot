# Description:
#   Respond to greetings

greet = (res) ->
    res.send 'Hello ' + res.envelope.user.name
salutare = (res) ->
    res.send 'Ciao ' + res.envelope.user.name
bonjour = (res) ->
    res.send 'Bonjour ' + res.envelope.user.name
hallo = (res) ->
    res.send 'Hallo ' + res.envelope.user.name
gutenmorgen = (res) ->
    res.send 'Guten morgen ' + res.envelope.user.name
farewell = (res) ->
    res.send 'Bye ' + res.envelope.user.name
arrivederci = (res) ->
    res.send 'Arrivederci ' + res.envelope.user.name
addio = (res) ->
    res.send 'Addio ' + res.envelope.user.name
aurevoir = (res) ->
    res.send 'Aurevoir ' + res.envelope.user.name
tchuss = (res) ->
    res.send 'Tschüss ' + res.envelope.user.name
aufwiedersehen = (res) ->
    res.send 'Auf Wiedersehen ' + res.envelope.user.name
street = (res) ->
    res.send 'Sup ' + res.envelope.user.name
maori = (res) ->
    res.send 'Tēnā koutou tēnā koutou tēnā tātou katoa. Haere mai haere mai haere mai ' + res.envelope.user.name
approval = (res) ->
    res.send 'Sweet as ' + res.envelope.user.name + '\nWe are totally a family friendly workplace'

module.exports = (robot) ->
    limit = false

    robot.listenerMiddleware (context, next, done) ->
        if limit
            # Do nothing
            done()
        else
            # Set the limit timer
            limit = true
            setTimeout () ->
                limit = false
            , 5*60*1000 # 5 min
            # Write output
            next ->
                done()

    robot.hear /^hello( hubot)?$/i, greet
    robot.hear /^ciao( hubot)?$/i, salutare
    robot.hear /^salut( hubot)?$/i, bonjour
    robot.hear /^bonjour( hubot)?$/i, bonjour
    robot.hear /^hi( hubot)?$/i, greet
    robot.hear /^hallo( hubot)?$/i, hallo
    robot.hear /^Guten morgen( hubot)?$/i, gutenmorgen
    robot.hear /^(good )?morning( hubot)?$/i, greet
    robot.hear /^Buongiorno( hubot)?$/i, salutare
    robot.hear /^(good )?afternoon( hubot)?$/i, greet
    robot.hear /^kia ora( hubot)?$/i, maori
    robot.hear /^sup( hubot)?$/i, street
    robot.hear /^bye( hubot)?$/i, farewell
    robot.hear /^arrivederci( hubot)?$/i, arrivederci
    robot.hear /^addio( hubot)?$/i, addio
    robot.hear /^au revoir( hubot)?$/i, aurevoir
    robot.hear /^bonsoir( hubot)?$/i, aurevoir
    robot.hear /^bonne nuit( hubot)?$/i, aurevoir
    robot.hear /^(good ?)?night( hubot)?$/i, farewell
    robot.hear /^Tschüss( hubot)?$/i, tchuss
    robot.hear /^Auf Wiedersehen( hubot)?$/i, aufwiedersehen
    robot.hear /work from home/i, approval
