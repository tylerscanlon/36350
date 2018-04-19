generate_data = function(n, p){
  covariates = matrix(rnorm(n*p, mean = 0, sd = 1), nrow = n, ncol = p)
  responses = vector(length = n)
  for (i in 1:length(responses)) {
    responses[i] = rnorm(1, mean = 0, sd = 1)
  }
  return(list(covariates = covariates, responses = responses))
}

model_select = function(covariates, responses, cutoff){
  retained.covariates = lm(responses ~ covariates[p-value <= cutoff])
  final.regression = lm(responses ~ retained.covariates)
  return(final.regression[p-values])
}

run_simulation = function(n_trials, n, p, cutoff){
  generate_data(n,p) 
  model_select(responses = generate_data$responses, covariates = generate_data$covariates)
  sim.objs = vector(length=n_trials, mode="list")
  for (i in 1:n_trials) {
    sim.objs[i] = (model_select[p-values])[i]
    hist(sim.objs[i])
  }
}

datapath = saveRDS(run_simulation(n = c(100, 1000, 10000), p = 10, 20, 50, cutoff = 0.05))

make_plot = function(datapath){
  hist(datapath)
}
