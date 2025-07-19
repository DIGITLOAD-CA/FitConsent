___INFO___

{
  "type": "TAG",
  "id": "FitConsent_GTM_Template",
  "version": "1.0.0",
  "name": "FitConsent Banner Loader",
  "description": "Loads the FitConsent banner script to manage user consent on your website.",
  "brand": {
    "id": "FitConsent_Brand",
    "name": "FitConsent",
    "url": "https://fitconsent.com",
    "vendor": "DIGITLOAD"
  },
  "categories": [
    "Miscellaneous"
  ],
  "tags": [
    "Consent Management",
    "GDPR",
    "CCPA",
    "Privacy"
  ],
  "entry_point": "main"
}

___TEMPLATE_PARAMETERS___

[
  {
    "name": "websiteId",
    "type": "TEXT",
    "display_name": "FitConsent Website ID",
    "simple_value_type": true,
    "help": "Enter the Website ID from your FitConsent dashboard.",
    "validators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  }
]

___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const injectScript = require('injectScript');
const log = require('logToConsole');

const websiteId = data.websiteId;

if (!websiteId) {
  log('FitConsent Error: Website ID is not set.');
  data.gtmOnFailure();
  return;
}

const scriptUrl = 'https://fitconsent.com/api/banner?websiteId=' + encodeUriComponent(websiteId);

log('FitConsent: Injecting script for Website ID:', websiteId);

injectScript(scriptUrl, data.gtmOnSuccess, data.gtmOnFailure, 'fitconsent-banner-script');


___PERMISSIONS___

[
  {
    "instance": {
      "key": "inject_script",
      "value": "https://fitconsent.com/*"
    },
    "client_id": "sandboxed_js",
    "type": "INJECT_SCRIPT"
  }
]

___NOTES___

v1.0.0: Initial release of the FitConsent Banner Loader tag.
