# Ritika Iyer, GUID: 842099468 
# February 14, 2020
# Data Science for Public Policy, Assignment 3
# Data Visualization - Young Lives Data


## The data used in this assignment is from the Young Lives: an International Study of Childhood Poverty project, collected by the U.K. Data Service. 
## This is a longitudinal dataset following two cohorts of children every 3-4 years from 2002 to 2016 in India. The specific data used in this project is from 2006.
## The project’s key objectives are to “improve the understanding of causes and consequences of childhood poverty and to inform and the development and implementation of future policies and practices that will reduce childhood poverty” (Young Lives). 
## This project will discuss a few of the key variables and relationships relevant to childhood poverty in India. 

## This first visualization looks at the relationship between household expenditure on food and their children's Body Mass Index (BMI). I would expect that children with higher BMIs are from households that spend more on food.
## In the context of poor, often rural Indian households, increased expenditure on food can imply more purchases of healthier and fresher foods which are usually more expensive. 
## We see that in this sample, most children's BMI is between 10 and 16. According to BMI standards, children with a BMI below 18.5 is considered to be "underweight". 
## Though this visualization only considers two variables, it does establish a potential relationship to consider in addressing children's health related to improving households' ability to increase food spending versus non-food spending. 


## Visualization 1 - Child BMI and Household Food Expenditures
library (tidyverse)
library(readxl)
younglives_data <- read_excel("younglives-data.xlsx")
View(younglives_data)

ggplot(data = younglives_data, 
       mapping = aes(x=bmi_r2, 
                     y=foodexp_r2)) +
  geom_point(size = 0.4, color = "orange") +
  scale_y_continuous(limits = c(0, 5000)) +
  scale_x_continuous(limits = c(10, 18), breaks = c(10, 14, 18)) +
  theme_minimal() +
  theme(plot.margin = unit(c(1,1,1,1), "cm"),
        legend.position = "bottom",
        legend.title=element_blank()) +
  labs(title =
         paste("Household Food Expenditures and Body Mass Index are positively, but not strongly correlated"),
       subtitle = "Despite variation in spending on food, all children sampled are considered to be in underweight BMI category",
       caption = "Source: Young Lives Survey, 2006",
       x = "Body Mass Index (BMI)",
       y = "Annual Food Expenditures (in Rupees)")


## This next visualization looks at the differences in the relationship between a wealth index and housing quality index in rural versus urban areas. 
## We see that in rural areas, the slope of the fitted line is steeper than that of urban areas - this may imply that the impact of an increase in wealth has a much larger potential impact on housing quality (and vice versa) than the same increase in wealth for an urban household. 
## Additionally, the graph shows that urban households are overall slightly richer and live in higher quality housing than rural households. This is noted by the higher concentration of points in the lower left sections of the rural graph, as compared to the urban graph. 
## When considering policy programs at a state- or country-level, it is important to keep in mind that livelihoods and the potential impact of a policy in improving those livelihoods can be very different across rural and urban areas. 

## Visualization 2 - Wealth and Housing Quality in Rural versus Urban areas
younglives_data <- read_excel("younglives-data.xlsx")
View(younglives_data)

ggplot(data = younglives_data,
       mapping = aes(x = wi_r2, y = hq_r2)) +
  geom_smooth(method="loess", size = 0.5, linetype="longdash",
              color = "blue", se = FALSE) +
  geom_point(alpha = 0.2, color = "orange", size=1) +
  facet_wrap(~typesite_r2, ncol=2) +
  labs(y = "Housing Quality Index", x = "Wealth Index") +
  theme_minimal() +
  theme(plot.margin = unit(c(1,1,1,1), "cm")) +
  labs(title = 
         paste("Wealth and housing quality varies across rural, urban areas in India"),
       subtitle = "Telangana parents have slightly higher expectations for children to attend university than those from Coastal Andhra Pradesh",
       caption = "Source: Young Lives Survey, 2006",
       x = "Wealth Index",
       y = "Housing Quality Index")


## The visualization below seeks to gain insight on how parents view their childrens' educational future across regions in East India. 
## We see that most parents in all regions want their children to attend University. However, the second highest group in all regions is that parents hope their children will complete at least up till 10th grade. 
## Comparatively, parents in Telangana seem to have more confidence that their children will attend University. Coastal Andhra Pradesh seems more split. 
## This type of visualization is important from a policy perspective because it shows differences in culture and attitudes across seemingly similar geographic locations. The regions presented are relatively close to each other, but still show different outcomes. 
## In considering the targeting of a policy solution, it is critical to take into account regional variation in the scope and extremity of the policy problem itself. 

## Visualization 3 - Educational Aspirations by Region
younglives_data <- read_excel("younglives-data.xlsx")
View(younglives_data)

ggplot(data = younglives_data, 
         aes(gradlike)) +
  geom_bar() +
  coord_flip() + 
  facet_wrap(~region_r2, ncol=3) +
  labs(title = 
         paste("Parental attitudes on children's future educational attainment vary by region"),
       subtitle = "Telangana parents have slightly higher expectations for children to attend university than those from Coastal Andhra Pradesh",
       caption = "Source: Young Lives Survey, 2006",
       x = "Projected Children's Educational Attainment",
       y = "Number of Households")


## The final visualization presented below plots student test scores on two different tests - a Cognitive Test on the x-axis and the Peabody Picture Vocabulary Test (PPVT) on the y-axis. 
## It shows the test scores for two groups of students - the left panel shows educational outcomes for students that have never experienced a natural disaster shock (like a drought, flood, or crop failure).
## The right panel shows educational outcomes for students that have reported experiencing an adverse climate shock. Looking at the slopes of the fitted lines, we see a slightly steeper and higher line on the left panel for the non-exposed students.
## As we might expect, students exposed to a natural disaster shock perform worse on both test, on average, than their otherwise similar peers who have not experienced a natural disaster shock. 
## This is important from a policy perspective because it highlights the short- and potentially long-term negative impacts of disasters on schooling and learning outcomes. 
## In India, as natural disasters become increasingly common in vulnerable areas due to climate change, utilizing policy to protect children from falling behind in school is especially important from a human capital development perspective. 

## Visualization 4 - Cognitive and PPVT Test Scores by Shock Exposure
younglives_data <- read_excel("younglives-data.xlsx")
View(younglives_data)

ggplot(data = younglives_data, 
       mapping = aes(x=r2cog_rasch, 
                     y=r2ppvt_rasch)) +
  geom_point(size = 0.4, color = "black") +
  geom_smooth(method="lm", size = 0.5, color = "red", se = FALSE) +
  facet_wrap(~r2_shock_all, ncol=2) +
  labs(title = 
         paste("Cognitive and PPVT Test Scores by Natural Disaster Shock Exposure"),
       subtitle = "Shock-Exposed students perform worse on both test, on average, than otherwise similar non-exposed peers.",
       caption = "Source: Young Lives Survey, 2006",
       x = "Adjusted Scores, Cognitive Test",
       y = "Adjusted Scores, Peabody Picture Vocabulary Test") +
  theme(legend.position = "bottom",
        legend.title=element_blank()) 
  