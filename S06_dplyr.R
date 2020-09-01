library(dplyr)
fast_food=read.csv('data/FastFoodRestaurants.csv')
fast_food_tibble = as_tibble(fast_food)

#quelles sont les 5 villes qui ont les plus de fast food aux USA ?
fast_food_tibble  %>% group_by(city) %>% 
                      count() %>% 
                      arrange(desc(n)) %>%
                      head(5)

#quels sont les fast food les plus présents dans ces 5 villes ?
city_list = fast_food_tibble  %>% group_by(city) %>% 
  count() %>% 
  arrange(desc(n)) %>%
  head(5) %>%
  pull(city)


fast_food_tibble  %>% filter(city %in% city_list) %>%
                      group_by(name) %>%
                      count() %>%
                      arrange((desc(n))) %>%
                      head(10)

#quels sont les fast foods avec le plus de restaurants aux USA ?
fast_food_tibble  %>% 
  group_by(name) %>%
  summarise(nbre_fasts_foods = length(name), pct_fast_foods = length(name)*100/dim(fast_food_tibble)[1]) %>%
  arrange((desc(nbre_fasts_foods))) %>%
  head(10)

# Dans quelle ville, y at'il le plus de McDonalds ?
fast_food_tibble  %>% filter(name=="McDonald's") %>%
  group_by(city) %>%
  count() %>%
  arrange((desc(n))) %>%
  head(10)


#Où se situe NY par rapport aux 5 tops ?
fast_food_tibble  %>% filter(city=="New York") %>%
  group_by(city) %>%
  count() 

#Fast foods les plus présents à NY ?
fast_food_tibble  %>%
  filter(city=="New York") %>%
  group_by(name) %>%
  summarise(nbre_fasts_foods = length(name), pct_fast_foods = length(name)*100/dim(fast_food_tibble)[1]) %>%
  arrange((desc(nbre_fasts_foods))) %>%
  head(10)
