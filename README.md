# Flutter State Management Package

This package offers efficient state management utilities for Flutter applications, providing developers with tools to manage and update application states with ease.

## Features

- **`Manager` Class**: A flexible state management class utilizing `ValueNotifier` for managing and updating application states.
- **`StateBuilder` Widget**: A customizable widget that efficiently rebuilds parts of the UI based on state changes.

## Installation

To use this package in your Flutter project, follow these steps:

1. Add this package to your `pubspec.yaml` file:

   ```yaml
   dependencies:
     simple_state_manager: ^1.0.0 

# Usage

## Manager Class

The Manager class allows you to manage and manipulate the application state. Example usage:
```
// Create a Manager instance with an initial state
final PaymentManager manager = PaymentManager();

// Update the state
manager.setLoadingTrue();
```

# StateBuilder Widget

The StateBuilder widget efficiently rebuilds parts of the UI based on state changes. Example usage:

```
StateBuilder(
  manager: manager,
  builder: (context, state) {
    return Visibility(
      visible: state.isLoading,
      child: CircularProgressIndicator(),
    );
  },
),
```


# Example

An example implementation of state management using the PaymentManager class is included, demonstrating state updates and UI changes in a PaymentScreen.

# License

This project is licensed under the BSD 3-Clause License - see the LICENSE file for details.
