# Copyright (C) 2017 The Pure Nexus Project
# Copyright (C) 2018-2019 The Dirty Unicorns Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
LOCAL_DEVICE := $(lastword $(subst _, ,$(TARGET_PRODUCT)))

# App
PRODUCT_PACKAGES += \
    Chrome \
    GoogleContacts \
    GoogleContactsSyncAdapter \
    GoogleTTS \
    LatinIMEGooglePrebuilt \
    Photos \
    PrebuiltBugle \
    PrebuiltDeskClockGoogle \
    TrichromeLibrary \
    talkback \
    WebViewGoogle

# Framework
PRODUCT_PACKAGES += \
    com.google.android.maps \
    com.google.android.dialer.support

ifneq ($(filter coral flame,$(LOCAL_DEVICE)),)
# Pixel 4 - Next Generation Assistant
PRODUCT_PACKAGES += \
    NgaResources

PRODUCT_PRODUCT_PROPERTIES += \
    setupwizard.enable_assist_gesture_training=true
endif

# Overlays
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/pixelgapps/overlay/

# Priv-app
PRODUCT_PACKAGES += \
    AdsDynamite \
    AndroidMigratePrebuilt \
    AndroidPlatformServices \
    CarrierSetup \
    ConfigUpdater \
    ConnMetrics \
    CronetDynamite \
    DynamiteLoader \
    DynamiteModulesA \
    DynamiteModulesC \
    GoogleCertificates \
    GoogleDialer \
    GoogleFeedback \
    GoogleOneTimeInitializer \
    GooglePartnerSetup \
    GoogleServicesFramework \
    MapsDynamite \
    MatchmakerPrebuiltPixel4 \
    OTAConfigPrebuilt \
    Phonesky \
    PixelSetupWizard \
    PrebuiltGmsCore \
    SetupWizardPrebuilt \
    TurboPrebuilt \
    Velvet \
    WellbeingPrebuilt

# RRO Overlays
PRODUCT_PACKAGES += \
    PixelLauncherOverlay \
    PixelSetupWizardOverlay

# Google Assistant prop
PRODUCT_PRODUCT_PROPERTIES += \
    ro.opa.eligible_device=true

# Setup Wizard props
PRODUCT_PRODUCT_PROPERTIES += \
    setupwizard.theme=glif_v3_light \
    setupwizard.feature.skip_button_use_mobile_data.carrier1839=true \
    setupwizard.feature.show_pai_screen_in_main_flow.carrier1839=false \
    setupwizard.feature.show_pixel_tos=true \
    setupwizard.feature.baseline_setupwizard_enabled=true \
    ro.setupwizard.esim_cid_ignore=00000001

$(call inherit-product, vendor/pixelgapps/pixel-gapps-blobs.mk)
