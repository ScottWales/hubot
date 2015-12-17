{spawnSync} = require 'child_process'

realname = (uid) ->
    # ldapsearch -x '(uid=saw562)' cn mail
    search = spawnSync 'ldapsearch',['-x', '(uid='+uid+')', 'cn', '-LLL']
    lines  = search.stdout.toString().split '\n'
    cns    = (line.replace /^cn:\s*/,"" for line in lines when line.match /^cn:/)
    result = cns.join ", "

groups = (uid) ->
    search = spawnSync 'groups',[uid]
    search.stdout

module.exports = (robot) ->
    robot.respond /whois ([a-z]{3}[0-9]{3})/i, (res) ->
        uid   = res.match[1]
        name  = realname uid
        mail  = uid + '@nci.org.au'
        group = groups uid
        res.reply name + ' ' + mail + '\n' + group

    robot.respond /groups ([a-z]{3}[0-9]{3})/i, (res) ->
        uid = res.match[1]
        res.reply groups uid

