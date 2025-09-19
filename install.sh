#!/bin/bash

apk add python3 py3-pip
python3 -m venv vnev
source venv/bin/activate
pip3 install --no-cache-dir -r requirements.txt
deactivate

python3 -m http.server:7200

#Verify user existence and correct shell
if ! id peaches >/dev/null 2>&1; then
	echo "user not found" >&2
	exit 1
fi

mkdir -p /dookie && cd /dookie
cat << EOF > /dookie/config.json
{
	"terminal": "bash",
	"port": 7681,
	"debug": true
}
EOF
chown -R peaches:userz
#ensure dir exists
if [! -f /dookie/config.json] then
	echo "/dookie/config.json not found" >&2
	exit 1
fi



 
