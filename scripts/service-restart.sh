#!/bin/bash
# chmod 700 api-restart.sh

if [[ "$1" == "master" ]]; then
	npm install --prefix /srv/nodejs/senti/services/dsc/production
	systemctl restart senti-dsc.service
	# Senti Slack Workspace
	curl -X POST -H 'Content-type: application/json' --data '{
	"blocks": [
		{
			"type": "header",
			"text": {
				"type": "plain_text",
				"text": "Senti Dsc updated",
				"emoji": true
			}
		},
		{
			"type": "section",
			"text": {
				"type": "mrkdwn",
				"text": "*Branch:*\n'$1'"
			},
			"accessory": {
				"type": "button",
				"text": {
					"type": "plain_text",
					"text": "Travis",
					"emoji": true
				},
				"value": "travis-link",
				"url": "http://travis-ci.com/github/senti-iot/senti-dsc",
				"action_id": "button-action"
			}
		}
	]
}' $2
	echo
	exit 0
fi

if [[ "$1" == "dev" ]]; then
	npm install --prefix /srv/nodejs/senti/services/dsc/development
	systemctl restart senti-dsc-dev.service
	# Senti Slack Workspace
	curl -X POST -H 'Content-type: application/json' --data '{
	"blocks": [
		{
			"type": "header",
			"text": {
				"type": "plain_text",
				"text": "Senti Dsc updated",
				"emoji": true
			}
		},
		{
			"type": "section",
			"text": {
				"type": "mrkdwn",
				"text": "*Branch:*\n'$1'"
			},
			"accessory": {
				"type": "button",
				"text": {
					"type": "plain_text",
					"text": "Travis",
					"emoji": true
				},
				"value": "travis-link",
				"url": "http://travis-ci.com/github/senti-iot/senti-dsc",
				"action_id": "button-action"
			}
		}
	]
}' $2
	echo
	exit 0
fi

exit 0
