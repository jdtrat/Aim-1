pip <- gen_task_structure()

trial_1 <- pip[1,]

ready_screen_duration <- 1000 # milliseconds
trial_black_screen_durations <- rpois(2, 1500) # milliseconds
outcome_duration <- 500 # milliseconds

# First we see passive cue
passive_cue_duration <- trial_1$intervals
# Immediately followed by the first black screen
trial_black_screen_durations[1]
# Ready, set, player one!
ready_screen_duration
# Second trial black screen
trial_black_screen_durations[2]
# Active cue presentation,
# Cue Pops up again, I need to press a button indicating the trial ends!!!
# This cue is on for twice as long as passive cue duration
# If you don't press button within that time, you get nothing and or lose everything
outcome_duration


c(
  passive_cue_duration,
  trial_black_screen_durations[1],
  ready_screen_duration,
  trial_black_screen_durations[2],
  outcome_duration
)

a <- matrix(0, 144, 20000)

a[1,seq_len(passive_cue_duration)] <- 1

