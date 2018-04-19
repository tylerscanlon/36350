generate_data = function(n, p){
  covariates = matrix(rnorm(n*p, mean = 0, sd = 1), nrow = n, ncol = p)
  responses = vector(length = n)
  for (i in 1:length(responses)) {
    responses[i] = rnorm(1, mean = 0, sd = 1)
  }
  return(list(covariates = covariates, responses = responses))
}