# Automation Steps

Follow the steps below to set up and execute the automation process:

## 1. Prerequisites
- Ensure you have the required tools installed:
    - [Android SDK](https://developer.android.com/studio)
    - [Java Development Kit (JDK)](https://www.oracle.com/java/technologies/javase-downloads.html)
    - [Gradle](https://gradle.org/install/)
    - [Node.js](https://nodejs.org/)
- Verify environment variables are properly configured:
    - `ANDROID_HOME`
    - `JAVA_HOME`
    - `PATH` includes Gradle and Node.js binaries.

## 2. Clone the Repository
```bash
git clone https://github.com/your-repo/Mob-Android-Scripts.git
cd Mob-Android-Scripts
```

## 3. Install Dependencies
```bash
npm install
```

## 4. Configure Environment
- Update the `config.json` file with the required parameters:
    - API keys
    - Device configurations
    - Test credentials

## 5. Build the Project
```bash
./gradlew assembleDebug
```

## 6. Run Tests
- Execute the automation scripts:
```bash
npm run test
```

## 7. Generate Reports
- View the test results:
```bash
npm run generate-report
```

## 8. Debugging
- Check logs in the `logs/` directory for troubleshooting.

## 9. CI/CD Integration (Optional)
- Add the automation steps to your CI/CD pipeline (e.g., GitHub Actions, Jenkins).

## 10. Cleanup
- Remove temporary files:
```bash
npm run clean
```

## Notes
- Ensure devices/emulators are connected and accessible.
- Update dependencies regularly for compatibility.
