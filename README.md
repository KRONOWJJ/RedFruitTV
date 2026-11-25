# RedFruitTV

A native SwiftUI tvOS starter app for Apple TV.

## Build in GitHub Actions

Pushes to `main` and pull requests run the `Build tvOS` workflow on a macOS GitHub-hosted runner. The workflow builds the app for the tvOS Simulator without code signing.

## Important

This starter contains sample catalogue data only. It does not include Red Fruit (红果) content, account login, playback URLs, DRM integration, or any third-party service credentials. Real content playback requires an authorized API/SDK and playback entitlement from the service or rights holder.

## Local build

Open `RedFruitTV.xcodeproj` in Xcode, select the `RedFruitTV` scheme, and build for an Apple TV simulator.
