# Video Game Data Cleaning Project

## Project Overview

This project focuses on cleaning and analyzing a messy video game dataset.
The dataset contains inconsistent formats, missing values, and mixed data types.

The goal is to transform raw data into a clean and structured dataset for analysis.

---

## Dataset Description

The dataset includes the following columns:

* `game_name` → Name of the video game
* `platform` → Platform (PC, PS4, Xbox, etc.)
* `release_year` → Year of release (in multiple formats)
* `genre` → Game genre (inconsistent capitalization)
* `publisher` → Game publisher (some missing values)
* `price` → Game price (mixed formats like "$59.99", "free")
* `user_score` → User ratings (numbers and text values)
* `downloads` → Number of downloads (e.g., "1M", "500k")

---

## Data Cleaning Steps

The following steps were performed:

* Standardized text values (e.g., genre and platform)
* Converted `price` to numeric format
* Cleaned `user_score` and handled invalid values
* Transformed `downloads` into numeric values
* Converted `release_year` into a consistent datetime format
* Handled missing values using mean, median, or default values
* Removed duplicate rows

---

## Data Analysis

Some basic analysis performed:

* Most common game genres
* Average price per platform
* Top publishers by total downloads

---

## Visualization

a Basic visualizations was created using Matplotlib:


* Distribution of game prices

---

## Tools Used

* Python 🐍
* Pandas
* Matplotlib

---

## Conclusion

The dataset was successfully cleaned and prepared for analysis.
This project demonstrates key data cleaning and preprocessing techniques used in real-world data analysis.

---


