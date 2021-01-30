MODULE_SRC0=Modules/Network/Sources/Network
openapi-generator generate -i recipepuppy.yaml -g swift5 -o api-mobile
rm -r $MODULE_SRC0""*
cp -R api-mobile/OpenAPIClient/Classes/OpenAPIs/. $MODULE_SRC0
rm -r api-mobile

MODULE_SRC1=Modules/Crypto/Sources/Crypto
openapi-generator generate -i orderCrypto.yaml -g swift5 -o api-mobile
rm -r $MODULE_SRC1""*
cp -R api-mobile/OpenAPIClient/Classes/OpenAPIs/. $MODULE_SRC1
rm -r api-mobile

