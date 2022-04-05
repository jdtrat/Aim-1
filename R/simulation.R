
#' Simulate the Peak Interval Procedure (PIP)
#'
#' This function is for simulating number of trials and cues present in the PIP.
#'
#'
#'
#'
#'
#
expand_grid(
  interval,
  reinforcement
) %>%
  mutate(
    cue_id = row_number(),
    .before = 1
  ) %>%
  slice_sample(
    n = 144,
    replace = TRUE
  ) %>%
  mutate(
    trial = row_number(),
    .before = 1
  )
