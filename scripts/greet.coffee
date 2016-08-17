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
parrot = (res) ->
    res.send ':parrot: :parrot: :parrot:'
hal9000 = (res) ->
    res.send "I'm sorry, " + res.envelope.user.name + ". I'm afraid I can't do that"


module.exports = (robot) ->
    limit = false

    robot.listenerMiddleware (context, next, done) ->
        # Should we limit this message?
        if not (context.listener.options?.limit? or false)
            next ->
                done()
        else if limit
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

    robot.hear /^hello( hubot)?$/i, limit: true,  greet
    robot.hear /^ciao( hubot)?$/i, limit: true,  salutare
    robot.hear /^salut( hubot)?$/i, limit: true,  bonjour
    robot.hear /^bonjour( hubot)?$/i, limit: true,  bonjour
    robot.hear /^hi( hubot)?$/i, limit: true,  greet
    robot.hear /^hallo( hubot)?$/i, limit: true,  hallo
    robot.hear /^Guten morgen( hubot)?$/i, limit: true,  gutenmorgen
    robot.hear /^(good )?morning( hubot)?$/i, limit: true,  greet
    robot.hear /^Buongiorno( hubot)?$/i, limit: true,  salutare
    robot.hear /^(good )?afternoon( hubot)?$/i, limit: true,  greet
    robot.hear /^kia ora( hubot)?$/i, limit: true,  maori
    robot.hear /^sup( hubot)?$/i, limit: true,  street
    robot.hear /^bye( hubot)?$/i, limit: true,  farewell
    robot.hear /^arrivederci( hubot)?$/i, limit: true,  arrivederci
    robot.hear /^addio( hubot)?$/i, limit: true,  addio
    robot.hear /^au revoir( hubot)?$/i, limit: true,  aurevoir
    robot.hear /^bonsoir( hubot)?$/i, limit: true,  aurevoir
    robot.hear /^bonne nuit( hubot)?$/i, limit: true,  aurevoir
    robot.hear /^(good ?)?night( hubot)?$/i, limit: true,  farewell
    robot.hear /^Tschüss( hubot)?$/i, limit: true,  tchuss
    robot.hear /^Auf Wiedersehen( hubot)?$/i, limit: true,  aufwiedersehen
    robot.hear /work from home/i, limit: true,  approval
    robot.hear /party on( hubot)?/i, limit: true,  parrot
    robot.hear /see you later/i, limit: true,  farewell
    robot.hear /Open the pod bay doors hubot/i, limit: true,  hal9000
