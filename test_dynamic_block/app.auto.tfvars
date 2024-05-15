applications = [
  { name = "APP-vwcv-retailer-api",resources = ["arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/retailer/geolocation-service-XnlOdq", "arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/retailer/database-mongodb-6yQTF0"] },
  { name = "APP-vw-address-lookup-api",resources = ["arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/address-lookup/lookup-service-jj9i0S"] },
  { name = "APP-vwg-capcode-api",resources = ["arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/capcode/database-mongodb-aC9KV0", "arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/capcode/oauth2.clients-lDmaG4"] },
  { name = "APP-vwg-encryption-api",resources = ["arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/encryption/aes.encryption-aDqV93"] },
  { name = "APP-vwcv-finance-api",resources = ["arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/finance/database-mongodb-hNpgWB", "arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/finance/vwfs-iGJss4"] },
  { name = "APP-vwg-image-api",resources = ["arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/image/okapi-6B94S3", "arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/image/relas-aC9KV0"] },
  { name = "APP-vw-pcs-api",resources = ["arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/pcs/database-SQOFxa"] },
  { name = "APP-vw-product-api2",resources = ["arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/product2/database-mongodb-BFCft6"] },
  { name = "APP-vwg-service-api",resources = ["arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/service/database-mongodb-NFyt25", "arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/service/vwfs-wlbuTp", "arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/service/rtc-MnryGp", "arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/service/modulus-COAAH9"] },
  { name = "APP-vw-stock-api",resources = ["arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/stock/database-mysql-lHKMYy", "arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/stock/database-mongodb-tLmutA"] },
  { name = "APP-vwg-vrm-lookup-api",resources = ["arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/vrm-lookup/experian-xA0c10"] },
  { name = "APP-vwcv-irc-importer",resources = ["arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/irc-importer/database-mongodb-wlbuTp", "arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/irc-importer/importer-hz3kp2"] },
  { name = "APP-vwcv-pcs-processor",resources = ["arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/pcs-processor/activemq-UBcQj4", "arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/pcs-processor/database-mongodb-FLgI2A"] },
  { name = "APP-vwg-stock-importer",resources = ["arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/stock-importer/database-mongodb-FLgI2A"] },
  { name = "APP-vw-product-etl-data-validator",resources = ["arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/product-etl-data-validator/database-mongodb-QLdYzz"] },
  { name = "APP-rch-data-exporter",resources = ["arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/rch-data-exporter/exporter-codeweavers-dJ6pGz"] },
  { name = "APP-vwcv-retailer-importer",resources = ["arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/retailer-importer/database-mongodb-4jZbwn"] },
  { name = "APP-vw-product-etl",resources = ["arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/product-etl/database-mongodb-JAXpzZ", "arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/product-etl/vw.okapi-Hl8Hqo"] },
  { name = "APP-vwg-rch-filter-persister",resources = ["arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/rch-filter-persister/database-mysql-tyHlLY", "arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/rch-filter-persister/database-mongodb-aC9KV0"] },
  { name = "APP-vw-stock-archive",resources = ["arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/stock-archive/database-mysql-IFDg5x"] },
  { name = "APP-vw-stock-archive-archiver",resources = ["arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/stock-archive-archiver/iib-cv-vilma-client-L6vfLK"] },
  { name = "APP-vwcv-lead-api",resources = ["arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/lead-api/aws-logging-JAXpzZ", "arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/lead-api/iib-oss-client-http-headers-hz3kp2", "arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/lead-api/iib-oss-client-wlbuTp", "arn:aws:secretsmanager:eu-west-1:594630546012:secret:qa/vwcv/lead-api/google-recaptcha-dJ6pGz"] }
]