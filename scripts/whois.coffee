{spawn} = require 'child_process'

realname = (uid) ->
        # ldapsearch -x '(uid=saw562)' cn mail
        search = spawn 'ldapsearch',['-x', '(uid='+uid+')', 'cn', '-LLL']
        result = ''
        search.stdout.on 'data', (data) ->
                lines = data.toString().split '\n'
                cns = (line.replace /^cn:\s*/,"" for line in lines when line.match /^cn:/)
                result += cns.join ", "
        result

groups = (uid) ->
        search = spawn 'groups',[uid]
        result = ''
        search.stdout.on 'data', (data) ->
                result += data
        result

module.exports = (robot) ->
	robot.respond /whois ([a-z]{3}[0-9]{3})/i, (res) ->
		uid   = res.match[1]	
                name  = realname uid
                mail  = uid + '@nci.org.au'
                group = groups uid
                res.reply name + ' <' + mail + '>' + '\n' + groups

	robot.respond /groups ([a-z]{3}[0-9]{3})/i, (res) ->
		uid = res.match[1]	
                res.reply groups uid
		
