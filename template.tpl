/**
 * @fileoverview The sandboxed JavaScript code for the FitConsent GTM template.
 * This code determines which action to take based on the user's selection in the GTM UI.
 */

const setDefaultConsentState = require('setDefaultConsentState');
const injectScript = require('injectScript');
const log = require('logToConsole');
const data = require('copyFromDataLayer');

const tagType = data.tagType;

if (tagType === 'CONSENT_DEFAULT') {
  log('FitConsent GTM: Setting default consent state.');

  setDefaultConsentState({
    'ad_storage': 'denied',
    'ad_user_data': 'denied',
    'ad_personalization': 'denied',
    'analytics_storage': 'denied',
    'functionality_storage': 'denied',
    'personalization_storage': 'denied',
    'security_storage': 'granted'
  });

  data.gtmOnSuccess();

} else if (tagType === 'BANNER_LOADER') {
  log('FitConsent GTM: Loading banner script.');

  const websiteId = data.websiteId;
  if (!websiteId) {
    log('FitConsent GTM Error: Website ID is not set. Banner will not load.');
    data.gtmOnFailure();
    return;
  }

  const scriptUrl = 'https://fitconsent.com/api/banner?websiteId=' + websiteId;
  injectScript(scriptUrl, data.gtmOnSuccess, data.gtmOnFailure, scriptUrl);

} else {
  log('FitConsent GTM Error: Unknown tag type selected.');
  data.gtmOnFailure();
}
