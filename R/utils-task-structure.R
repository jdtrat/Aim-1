#' Generate PIP Structure
#'
#' @description Generate a task structure where each trial is a random sample of nine trial types, including three different interval durations with either areward, punishment, or no reinforcement presented following interval reproduction.
#'
#'
#' @param num_trials The number of trials presented during the task (144 with 16 trials of each type)
#' @param intervals The duration of the presented intervals (1000,3000,5000ms)
#' @param reinforcements The reinforcement type presented on each trial (reward, punishment, or neutral (no reinforcement))
#'
#' @return A tibble with columns 'trial' representing the trial number, 'cue_id'
#'   corresponding to the fractal image cue, 'interval' representing the
#'   cued duration and 'reinforcement' representing the presented reward,
#'   punishment, or neural (no reinforcement).
#' @export
#'
#' @examples
gen_task_structure <- function(
  num_trials = 144,
  intervals = c(1000, 3000, 5000),
  reinforcements = c("punishment", "neutral", "reward")
) {

  # Make sure num trials is a multiple of the interval/reinforcement structure
  stopifnot(num_trials %% (length(intervals) * length(reinforcements)) == 0)

  tidyr::expand_grid(
    intervals,
    reinforcements
  ) %>%
    dplyr::mutate(
      cue_id = dplyr::row_number(),
      .before = 1
    ) %>%
    dplyr::slice_sample(
      n = num_trials,
      replace = TRUE
    ) %>%
    dplyr::mutate(
      trial = dplyr::row_number(),
      .before = 1
    )

}
