provider "android" {
    # Configuration options for the Android provider
    version = "1.0.0" # Replace with the required version
}

resource "android_emulator" "example" {
    name       = "example-emulator"
    api_level  = 30
    abi        = "x86_64"
    device     = "pixel_4"
    skin       = "pixel_4"
    sdcard     = "512M"
    force_stop = true
}

resource "android_avd" "example" {
    name       = "example-avd"
    api_level  = 30
    abi        = "x86_64"
    device     = "pixel_4"
    skin       = "pixel_4"
    sdcard     = "512M"
}