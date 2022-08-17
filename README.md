# individual-assignment-2-alhuri
# Red Wine Quality EDA

## Dataset Information
The dataset of red "Vinho Verde" wine is used for EDA task. For further information,
refer to [Cortez et al., 2009]. The data contains physicochemical variables and quality as a target variable.
The data [link](https://archive.ics.uci.edu/ml/datasets/wine+quality) .

- [Wine Report Page](https://Misk-DSI.github.io/individual-assignment-2-alhuri/)


| Variable            | Description                                            |
|---------------------|--------------------------------------------------------|
| fixed acidity       | most acids involved with wine or fixed or nonvolatile. |
| volatile acidity    | the amount of acetic acid in wine.                     |
| citric acid         | citric acid can add ‘freshness’ to wines.              |
| residual sugar      | the amount of sugar remaining after fermentation stops.|
| chlorides           | the amount of salt in the wine.                        |
| free sulfur dioxide | the free form of SO2 exists in equilibrium between molecular SO2.|
| density             | the density of water is close to that of water depending on the percent alcohol and sugar content.|
| pH                  | describes how acidic or basic a wine is on a scale from 0 to 14.|
| sulphates           | a wine additive which can contribute to sulfur dioxide gas (S02) levels.|
| alcohol             | the percent alcohol content.                           |
| quality             | score between 0 and 10.                                |


## Description

Using a simple R script, the dataset is explored to present the most interesting and useful insights along with the questions they answer.
### Goals
- Presenting findings gathered from analysis in a report format.
- Discovering packages and functions in R for data manipulation and EDA.

## Content 

```bash
./
│   README.md
│   wine_report.html    
│   individual-assignment-2-alhuri.Rproj
│
└───archive/
│   │   assignment.md
│   
└───data/
│   │   winequality-red.csv
│   
└───src/
    │   wine_EDA.R
    │   wine_report.Rmd
```

## Used Libraries
- tidyr
- ggpubr
- tidyverse
- ggplot2
- dplyr
- cluster
- factoextra
- corrplot
- janitor
- here
- reactable
