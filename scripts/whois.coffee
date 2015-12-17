{spawn} = require 'child_process'

module.exports = (robot) ->
	robot.respond /whois ([a-z]{3}[0-9]{3})/i, (res) ->
		uid = res.match[1]	
		# ldapsearch -x '(uid=saw562)' cn mail
		search = spawn 'ldapsearch',['-x', '(uid='+uid+')', 'cn', '-LLL']
		search.stdout.on 'data', (data) ->
			lines = data.toString().split '\n'
			groups = (line.replace /^cn:\s*/,"" for line in lines when line.match /^cn:/)
			res.reply groups.join ", "

	robot.respond /groups ([a-z]{3}[0-9]{3})/i, (res) ->
		uid = res.match[1]	
		# ldapsearch -x 'memberUid=saw562' cn -LLL
		search = spawn 'groups',[uid]
		search.stdout.on 'data', (data) ->
			res.reply data
		
