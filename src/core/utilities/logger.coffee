# OAuth daemon
# Copyright (C) 2013 Webshell SAS
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

fs = require 'fs'

module.exports = (env) ->
	class Logger
		constructor: (@name) ->

		log: ->
			prepend = "### " + (new Date).toUTCString() + "\n"
			args = []
			for arg in arguments
				try
					args.push JSON.stringify arg
				catch e
					args.push '[[JSON str error]]'
			fs.appendFile __dirname + '/../logs/' + @name + '.log', prepend + args.join(' ') + "\n", 'utf8', ->

	Logger