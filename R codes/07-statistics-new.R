## ---- echo = FALSE, message = FALSE--------------------------------------
library(MASS)
library(dplyr)
library(ggplot2)


## ---- echo = FALSE, message = FALSE--------------------------------------

library(dplyr)
library(ggplot2)

cats <- read.csv('data/herding-cats.csv') %>% tbl_df

ggplot(cats, aes(x = weight, y = wander_dist)) + 
  geom_point() + 
  geom_smooth(method = 'lm', formula = y ~ x, se = FALSE, size = 3) + 
  theme_bw(base_size = 18)


## ------------------------------------------------------------------------
weight_fit <- lm(formula = wander_dist ~ weight, data = cats)
summary(weight_fit)


## ------------------------------------------------------------------------
wander_fit <- lm(formula = wander_dist ~ weight + age , data = cats)
summary(wander_fit)


## ------------------------------------------------------------------------
wander_fit <- lm(formula = wander_dist ~ weight + age + fixed, data = cats)
summary(wander_fit)


## ------------------------------------------------------------------------
wander_fit <- lm(formula = wander_dist ~ weight + age + factor(coat) + sex, data = cats)
summary_fit <- summary(wander_fit)
summary_fit['coefficients']


## ------------------------------------------------------------------------
wander_fit <- lm(formula = wander_dist ~ weight * age, data = cats)
summary(wander_fit)


## ------------------------------------------------------------------------
ggplot(cats, aes(x = roamer, y = wander_dist)) + 
  geom_boxplot(width = 0.5)


## ------------------------------------------------------------------------
roamer_fit <- glm(formula = roamer ~ wander_dist, data = cats, family = binomial )


## ------------------------------------------------------------------------
glm_summary <- summary(roamer_fit)
glm_summary


## ------------------------------------------------------------------------
roamer_fit <- glm(formula = roamer ~ wander_dist + weight, data = cats, family = binomial )
summary(roamer_fit)


## ------------------------------------------------------------------------
ggplot(cats, aes(x = weight, y = wander_dist, color = roamer)) + 
  geom_point(size = 2) +
  geom_smooth(method = 'lm', se = FALSE, size = 3) +
  theme_bw(base_size = 18)

# cats$roamer <- relevel(cats$roamer, ref = 'yes')
roamer_fit <- glm(formula = roamer ~ wander_dist + weight, data = cats, family = binomial )
glm_summary <- summary(roamer_fit)
glm_summary

names(glm_summary)
glm_summary$coefficients
glm_summary$null.deviance
glm_summary$deviance
glm_summary$aic


## ------------------------------------------------------------------------
new_cats <- data.frame(wander_dist = c(0.15, 0.10, 0.05),
                       weight = c(2, 6, 12))
new_cats

predicted_logit <- predict(object = roamer_fit, newdata = new_cats)
predicted_logit

predicted_probs <- predict(object = roamer_fit, newdata = new_cats, type = 'response')
predicted_probs


## ------------------------------------------------------------------------
new_cats$predicted_prob <- predicted_probs
new_cats <- new_cats %>% mutate(roamer = ifelse(predicted_prob > 0.5, 'yes', 'no'))

ggplot(cats, aes(x = weight, y = wander_dist, color = roamer, group = roamer)) + 
  geom_point(size = 2) +
  geom_point(data = new_cats, aes(x = weight, y = wander_dist, color = roamer), size = 8) +
  theme_bw(base_size = 18)


## ------------------------------------------------------------------------
cats <- cats %>% 
  mutate(scale_weight = scale(weight),
         scale_wander = scale(wander_dist),
         scale_age = scale(age))


## ------------------------------------------------------------------------
cats_cluster <- 
  kmeans(x = cats %>% select(scale_weight, scale_wander, scale_age), 
         centers = 3,
         nstart = 20)
str(cats_cluster)
cats_cluster$centers


## ------------------------------------------------------------------------
cats$cluster <- factor(cats_cluster$cluster)
cluster_centers <- as.data.frame(cats_cluster$centers)

ggplot(data = cats) + 
  geom_point(aes(x = scale_age, y = scale_weight, color = cluster), size = 4) + 
  geom_point(data = cluster_centers, aes(x = scale_age, y = scale_weight), color = 'black', size  = 8) +
  theme_bw(base_size = 18)

ggplot(data = cats) + 
  geom_point(aes(x = scale_age, y = scale_wander, color = cluster), size = 4) + 
  geom_point(data = cluster_centers, aes(x = scale_age, y = scale_wander), color = 'black', size  = 8) +
  theme_bw(base_size = 18)

ggplot(data = cats) + 
  geom_point(aes(x = scale_weight, y = scale_wander, color = cluster), size = 4) + 
  geom_point(data = cluster_centers, aes(x = scale_weight, y = scale_wander), color = 'black', size  = 8) +
  theme_bw(base_size = 18)

