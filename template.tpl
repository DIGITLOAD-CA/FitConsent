___TERMS_OF_SERVICE___
# Copyright 2024 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

___INFO___
# The official Google Tag Manager Community Template for FitConsent CMP.
# This template simplifies the integration of the FitConsent consent banner.
#
# It provides two main functionalities:
# 1. A tag to load the FitConsent banner script.
# 2. A tag to set the default Google Consent Mode state.

___TAG___

// Global functions for creating script elements
const createScript = (url, id, onLoad) => {
  const script = document.createElement('script');
  script.async = true;
  script.defer = true;
  script.src = url;
  if (id) {
    script.id = id;
  }
  if (onLoad) {
    script.onload = onLoad;
  }
  return script;
};

// Main logic for the FitConsent Banner Loader
if (data.type === 'bannerLoader') {
  const bannerUrl = 'https://fitconsent.com/api/banner?websiteId=' + data.websiteId;
  const script = createScript(bannerUrl, 'fitconsent-banner-script', data.gtmOnSuccess);
  
  injectScript(script, data.gtmOnSuccess, data.gtmOnFailure, bannerUrl);
}

// Logic for setting the default consent state
if (data.type === 'consentDefault') {
  const code = `
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('consent', 'default', {
      'ad_storage': 'denied',
      'ad_user_data': 'denied',
      'ad_personalization': 'denied',
      'analytics_storage': 'denied'
    });
  `;

  const script = document.createElement('script');
  script.id = 'fitconsent-consent-default';
  script.text = code;

  // Since this is just setting a default state, we can use a simpler injection.
  const head = document.head || document.getElementsByTagName('head')[0];
  head.insertBefore(script, head.firstChild);
  data.gtmOnSuccess();
}

___ROUTINES___

___SANDBOXED_JS_FOR_ROUTINES___

___SERVER_PERMISSIONS___

___PERMISSIONS___
inject_script:
  - https://fitconsent.com/*
logging:
  - blacklist:
    - '.*'

___TESTS___
- name: Banner Loader Test
  code: |-
    const mockInjectScript = copyPojso(injectScript);
    const mockData = {
      type: 'bannerLoader',
      websiteId: 'test-website-id',
      gtmOnSuccess: () => {},
      gtmOnFailure: () => {}
    };

    // Run the template code
    runCode(mockData, {
      injectScript: (script, success, failure, url) => {
        assertThat(script.src).isEqualTo('https://fitconsent.com/api/banner?websiteId=test-website-id');
        assertThat(script.async).isTrue();
        assertThat(script.defer).isTrue();
        success();
      }
    });

- name: Consent Default Test
  code: |-
    const mockData = {
      type: 'consentDefault',
      gtmOnSuccess: () => {}
    };

    // Run the template code
    runCode(mockData);

    const scriptElement = document.getElementById('fitconsent-consent-default');
    assertThat(scriptElement).isNotNull();
    assertThat(scriptElement.text).contains("gtag('consent', 'default'");
    assertThat(scriptElement.text).contains("'analytics_storage': 'denied'");
    assertThat(document.head.firstChild).isEqualTo(scriptElement);


___NOTES___
# v1.0.0
# Initial Release of the FitConsent CMP Tag.
# Provides templates for both loading the banner and setting the default consent state.
# This template is designed to work with Google Consent Mode v2.
# Please refer to our documentation for full GTM integration instructions.