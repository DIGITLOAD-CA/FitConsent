
___INFO___
// The ___INFO___ block contains metadata about the template.
{
  "type": "TAG",
  "name": "FitConsent CMP",
  "version": 1,
  "description": "Loads the FitConsent banner script to manage user consent.",
  "official": false,
  "containerContext": [
    "WEB"
  ]
}

___TEMPLATE_PARAMETERS___
// The ___TEMPLATE_PARAMETERS___ block defines the fields that will be displayed in the GTM UI.
[
  {
    "name": "websiteId",
    "type": "TEXT",
    "displayName": "FitConsent Website ID",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "help": "Enter the Website ID from your FitConsent dashboard."
  }
]

___SANDBOXED_JS_FOR_WEB_TEMPLATE___
// This is the sandboxed JavaScript that will be executed.
// It uses GTM APIs to inject the FitConsent script.
const injectScript = require('injectScript');
const log = require('logToConsole');

const scriptUrl = 'https://fitconsent.com/api/banner?websiteId=' + data.websiteId;

log('FitConsent: Injecting banner script for Website ID:', data.websiteId);

injectScript(
  scriptUrl,
  data.gtmOnSuccess,
  data.gtmOnFailure,
  data.websiteId // This serves as the cache key for the script injection.
);


___PERMISSIONS___
// The ___PERMISSIONS___ block declares what the template is allowed to do.
{
  "inject_script": [
    {
      "url": "https://fitconsent.com/api/banner*"
    }
  ]
}


___NOTES___
// Use this section for any notes about the template.
"Initial release. Loads the FitConsent banner script."
