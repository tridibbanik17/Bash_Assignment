<div align="center">

<h3 align="center">Baby Names Ranking Utility</h3>

  <p align="center">
    A Bash utility to search U.S. baby name rankings by year and gender.
    <br />
     <a href="https://github.com/tridibbanik17/bash_assignment">github.com/tridibbanik17/bash_assignment</a>
  </p>
</div>

## Table of Contents

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#key-features">Key Features</a></li>
      </ul>
    </li>
    <li><a href="#architecture">Architecture</a></li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
        <li><a href="#usage">Usage</a></li>
      </ul>
    </li>
    <li><a href="#testing">Testing</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

## About The Project

This project provides a Bash utility, `bn`, that allows users to search for the rankings of baby names in the United States from 1880 to 2022. The utility uses freely available data from the Social Security Administration (SSA) and is implemented entirely in Bash, utilizing standard input and output, pipes and filters, and regular expressions with the `grep` utility.

### Key Features

*   **Name Ranking Lookup:** Determines the ranking of a given baby name for a specific year and gender.
*   **Gender Specification:** Supports searching for male, female, or both genders.
*   **Data Validation:** Checks for valid year and gender inputs, as well as the existence of data files for the specified year.
*   **Error Handling:** Provides informative error messages for invalid inputs and missing data.
*   **CI Pipeline:** A CI pipeline is configured with a testing script that runs on every push, ensuring code quality and reliability.

## Architecture

The `bn` utility is a Bash script that processes user input to search through text files containing baby name data. The script utilizes the following components:

*   **`bn`:** The main Bash script that handles argument parsing, input validation, and calls the `rank` function.
*   **`rank()` function:** This function searches for the provided name in the appropriate data file (`us_baby_names/yobYYYY.txt`) and calls the `rank_single_gender()` function.
*   **`rank_single_gender()` function:** This function determines the ranking of the name within the specified gender and outputs the result.
*   **Data Files:** The `us_baby_names/` directory contains text files (`yobYYYY.txt`) with comma-separated data for each name, gender, and count.
*   **`test_script`:** A Bash script that tests the functionality of the `bn` utility with various inputs and expected outputs.
*   **.github/workflows/test.yml:** A GitHub Actions workflow file that defines the CI pipeline for automated testing.

## Getting Started

To use the `bn` utility, you need to have Bash installed on your system. No other dependencies are required.

### Prerequisites

*   Bash

### Installation

1.  Clone the repository:

```sh
git clone https://github.com/tridibbanik17/bash_assignment.git
cd tridibbanik17-bash_assignment
```

2.  Make the `bn` script executable:

```sh
chmod +x bn
```

### Usage

To search for the ranking of a baby name, use the following syntax:

```sh
./bn <year> <gender>
```

where:

*   `<year>` is a four-digit integer representing the year (1880-2022).
*   `<gender>` is one of the following:
    *   `f` or `F` for female names
    *   `m` or `M` for male names
    *   `b` or `B` for both genders

Provide the baby names as whitespace-separated input via standard input.

Example:

```sh
./bn 2022 m <<< "Sam"
```

This will output the ranking of the name "Sam" among male names in 2022.

To search for multiple names:

```sh
./bn 2021 b <<< "Olivia Emma Noah"
```

## Testing

The repository includes a `test_script` for verifying the functionality of the `bn` utility. To run the tests:

1.  Make the `test_script` executable:

```sh
chmod +x test_script
```

2.  Run the test script:

```sh
./test_script
```

The test results will be displayed in the console. A GitHub Actions workflow is also configured to run the tests automatically on every push to the `main` branch. The test results are uploaded as an artifact.

## Acknowledgments

*   This baby names utility uses data that is freely available at https://www.ssa.gov/oact/babynames/limits.html.
*   This README was created using [gitreadme.dev](https://gitreadme.dev) — an AI tool that looks at your entire codebase to instantly generate high-quality README files.
