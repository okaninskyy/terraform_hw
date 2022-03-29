#
KEY_NAME="key_name"
echo $KEY_NAME

test -f ${KEY_NAME} && chmod 600 ${KEY_NAME}
test -f ${KEY_NAME} && rm -f ${KEY_NAME}
test -f ${KEY_NAME} && rm -f ${KEY_NAME}.pub
ssh-keygen -t rsa -N '' -C "your_email@example.com" -f ${KEY_NAME}
chmod 400 ${KEY_NAME}
ls -la ${KEY_NAME} && ls -la ${KEY_NAME}.pub
