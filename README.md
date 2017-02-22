# Create keys

## .p12 format keys

### Private key

`keytool -genkeypair -keystore jwtsig-test-prv-ks.p12 -storetype pkcs12 -alias jwtsigtest -keyalg RSA -keysize 2048 -sigalg SHA384withRSA -dname "CN=jwtsigtest,OU=Auth Test,O=private purpose,L=Cologne,ST=NRW,C=DE" -validity 3652`

### Public key

`keytool -exportcert -alias jwtsigtest -file jwtsig-test-pub.cert -storetype pkcs12 -keystore jwtsig-test-prv-ks.p12 -rfc`

`keytool -importcert -alias jwtsigtest -file jwtsig-test-pub.cert -storetype pkcs12 -keystore jwtsig-test-pub-ks.p12`

`rm jwtsig-test-pub.cert`

## .pem format from p12 format:

### private key

`openssl pkcs12 -in jwtsig-test-prv-ks.p12 -nocerts -out jwtsig-test-prv-ks.pem -nodes`

### public key

Generate certificate:

`openssl pkcs12 -in jwtsig-test-pub-ks.p12 -out jwtsig-test-pub-cert.pem`

Determine public key from certificate file:

`openssl x509 -in jwtsig-test-pub-cert.pem -pubkey -noout > jwtsig-test-pub-ks.pem`
