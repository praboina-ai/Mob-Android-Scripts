fastlane_version "2.0"

default_platform(:android)

platform :android do
    desc "Build and deploy Android app"
    lane :build_and_deploy do
        gradle(task: "clean assembleRelease") # Build the release APK

        # Define the path to the APK
        apk_path = "./app/build/outputs/apk/release/app-release.apk"

        # Ensure the APK exists
        if File.exist?(apk_path)
            UI.message("APK built successfully at #{apk_path}")

            # Deploy the APK (e.g., upload to Firebase App Distribution or Play Store)
            # Uncomment and configure the desired deployment method below:

            # Example: Upload to Firebase App Distribution
            # firebase_app_distribution(
            #   app: "your-firebase-app-id",
            #   apk_path: apk_path,
            #   groups: "your-tester-group"
            # )

            # Example: Upload to Google Play Store
            # supply(
            #   track: "internal",
            #   apk: apk_path
            # )
        else
            UI.user_error!("APK not found at #{apk_path}")
        end
    end
end