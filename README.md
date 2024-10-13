# LearnCMake

Following the [Professional CMake: A Practical Guide](https://crascit.com/professional-cmake/) book, this repository contains training workshops with the aim of learning the CMake tool.

Workshops include custom projects and exercises to practice the concepts learned in the book. The workshops are written in modern CMake following the best practices and idioms.

Each chapter from the book will have a corresponding workshop as a CMake project.

## 🎯 Workshops

- **[Chapter 01:](./Chapter01/README.md)** Introduction
- **[Chapter 02:](./Chapter02/README.md)** Setting Up A Project
- **[Chapter 03:](./Chapter03/README.md)** A Minimal Project
- **[Chapter 04:](./Chapter04/README.md)** Building Simple Targets
- **[Chapter 05:](./Chapter05/README.md)** Basic Testing And Deployment
- **[Chapter 06:](./Chapter06/README.md)** Variables
- **[Chapter 07:](./Chapter07/README.md)** Flow Control
- **[Chapter 08:](./Chapter08/README.md)** Using Subdirectories
- **[Chapter 09:](./Chapter09/README.md)** Functions And Macros
- **[Chapter 10:](./Chapter10/README.md)** Properties
- **[Chapter 11:](./Chapter11/README.md)** Generator Expressions
- **[Chapter 12:](./Chapter12/README.md)** Modules

## ❓ How to use this repository?

### 📋 Prerequisites

- Ensure you have CMake installed on your system (version 3.30 or later recommended).
- Familiarity with basic C++ programming is assumed.
- Access to the [Professional CMake: A Practical Guide](https://crascit.com/professional-cmake/) book is highly recommended.

### 📁 Repository structure

Each chapter has its own directory (e.g., `Chapter01`, `Chapter02`, etc.)

Within each chapter directory, you'll find:

- A `README.md` file containing:
  - Part 1: Summary of key concepts from the book chapter
  - Part 2: Workshop explanation and instructions
- Project files and directories for the workshop

### 📝 Working through the workshops

Start with Chapter 01 and progress sequentially.

For each chapter:

1. Read the corresponding chapter in the [Professional CMake: A Practical Guide](https://crascit.com/professional-cmake/) book.
2. Attempt to complete the exercises on your own.
3. If you're stuck, review the chapter's `README.md` in this repository for a summary of key points.
4. Use the provided workshop as a reference solution for comparison with your own work.

### 🔨 Building the projects

Each workshop can be built using the provided build scripts:

> **Remark:** The build scripts are written in Fish shell for Linux/macOS and PowerShell for Windows.

- On Linux or macOS:
  ```shell
  ./tools/build.fish
  ```
- On Windows:
  ```PowerShell
  .\tools\build.ps1
  ```

Workshops can also be built using standard CMake commands:

```shell
mkdir build
cd build
cmake ..
cmake --build .
```

Specific build instructions, if different, will be provided in the chapter's README.

### 🚨 Getting Help

If you encounter issues or have questions, check the following resources:

- The chapter's README for any troubleshooting tips
- The official [CMake documentation](https://cmake.org/documentation/)
- Open an issue in this repository for project-specific problems

### 🫱🏼‍🫲🏽 Contributing

Feedback and contributions are welcome! If you find errors or have suggestions for improvements, please open an issue or submit a pull request.
