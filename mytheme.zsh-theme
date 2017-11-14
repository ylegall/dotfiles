
# prompts: ⚡❯→➤

# make some aliases for the colours: (could use normal escape sequences too)
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
    eval PR_$color='%{$fg[${(L)color}]%}'
done

eval PR_NO_COLOR="%{$reset_color%}"
eval PR_BOLD="%{$terminfo[bold]%}"

local return_code="%(?..$PR_RED)"
local user_host='$PR_GREEN%n@%m$PR_NO_COLOR'
local current_dir='$PR_BLUE %2~$PR_NO_COLOR'
#local git_branch='$PR_BOLD$(git_prompt_info)$(git_prompt_status)$PR_NO_COLOR'
local git_branch='$PR_BOLD$(git_prompt_info)$PR_NO_COLOR'


# Check the UID
if [[ $UID -ne 0 ]]; then # normal user
  local PR_PROMPT='$return_code➤ $PR_NO_COLOR'
else # root
  local PR_PROMPT='$return_code⚡ $PR_NO_COLOR'
fi

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}[%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[magenta]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%}*"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%}>>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%}="
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%}?"

PROMPT="${user_host}${current_dir}${git_branch}
%B${PR_PROMPT}%b"

# the right side prompt
RPROMPT='${return_code}[%T]%{$reset_color%}'

