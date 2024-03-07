if [[ "$ENABLE_CORRECTION" == "true" ]]; then
  alias cp='nocorrect cp'
  alias man='nocorrect man'
  alias mkdir='nocorrect mkdir'
  alias mv='nocorrect mv'
  alias sudo='nocorrect sudo'
  alias su='nocorrect su'
  alias git status='nocorrect git status'
  alias cordova plugin='nocorrect cordova plugin'

  setopt correct_all
fi
