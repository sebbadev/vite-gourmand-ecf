#!/bin/bash
# scripts/generate_shortcuts.sh - Creates localized aliases for the project
#This script is for project initialization. Don't use to to modify shortcuts. 
#Instead, edit project_aliases.sh directly with pj_sh.
#Then run pj_src to refresh them.

PROJECT_ROOT=$(realpath .)
SHORTCUTS_FILE="$PROJECT_ROOT/scripts/project_aliases.sh"

echo "--- Generating Project Shortcuts ---"

cat <<INNER_EOF > "$SHORTCUTS_FILE"
# Vite & Gourmand Project Aliases
alias pj='cd $PROJECT_ROOT'
alias pjb='cd $PROJECT_ROOT/backend'
alias pjf='cd $PROJECT_ROOT/frontend'
alias pjd='cd $PROJECT_ROOT/docs'
alias pjs='cd $PROJECT_ROOT/scripts'
alias pjx='cd $PROJECT_ROOT/secrets'
alias pj_sh='nano $PROJECT_ROOT/scripts/project_aliases.sh'
alias pj_src='source $PROJECT_ROOT/scripts/generate_shortcuts.sh && source $PROJECT_ROOT/scripts/project_aliases.sh && echo "Shortcuts regenerated and reloaded!"'

echo "Project shortcuts loaded! (pj, pjb, pjf, pjd, pjs, pjx, pj_src(source refresh), pj_sh( open shortcuts))"
INNER_EOF

# Add instructions for the user
echo "Shortcuts generated in $SHORTCUTS_FILE"
echo "---"
echo "Senior Tip: Add 'source $SHORTCUTS_FILE' to your ~/.bashrc to make them permanent."
