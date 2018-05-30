
iris %>% select(names(iris[1:3])) %>% head

names(iris)
iris %>% select(-Petal.Length, -Petal.Width) %>% head

iris %>% select(starts_with("P")) %>% head

iris %>% filter(Sepal.Length >= 4.6 & Petal.Width >= 0.5) %>% head

iris %>% select(Sepal.Width, Sepal.Length) %>% head

iris %>% arrange(Sepal.Width) %>% head

iris %>%
    select(names(iris)[1:3]) %>%
    arrange(Sepal.Length, Sepal.Width) %>%
    head

iris %>%
    mutate(proportion = Sepal.Length / Sepal.Width) %>%
    mutate(avg_slength = mean(Sepal.Length)) %>%
    head

iris %>%
    summarise(avg_slength = mean(Sepal.Length)) %>%
    head

iris %>%
    group_by(Sepal.Length) %>%
    summarise(avg_slength = mean(Sepal.Length),
              min_slength = min(Sepal.Length),
              max_slength = max(Sepal.Length),
              total = n()) %>%
head
