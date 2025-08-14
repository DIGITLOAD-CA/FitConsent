# FitConsent CMP Google Tag Manager Template

This repository contains the Google Tag Manager (GTM) Community Template for FitConsent, a Consent Management Platform.

## Overview

This template simplifies the integration of the FitConsent banner and the management of Google Consent Mode v2 on your website. It provides two main tag types:

1.  **FitConsent Banner Loader**: This tag injects the FitConsent JavaScript library onto your page, which displays the consent banner to your users.
2.  **Google Consent Default**: This tag sets the default, denied consent state for Google Consent Mode. This is crucial for ensuring that no tracking occurs before a user has given their consent.

## How to Use

1.  Add this template to your Google Tag Manager workspace.
2.  Create a "Google Consent Default" tag and set it to fire on the "Consent Initialization - All Pages" trigger.
3.  Create a "FitConsent Banner Loader" tag, add your **FitConsent Website ID** from your dashboard, and also set it to fire on the "Consent Initialization - All Pages" trigger.
4.  Ensure your other tags (like Google Analytics) are configured to respect the consent state.

For detailed, step-by-step instructions, please visit our official [Documentation Page](https://fitconsent.com/index.php/documentation/).

## Parameters

-   **Tag Type**: Choose between "FitConsent Banner Loader" and "Google Consent Default".
-   **FitConsent Website ID**: Your unique website identifier, found in your FitConsent dashboard. This is required for the Banner Loader tag.
