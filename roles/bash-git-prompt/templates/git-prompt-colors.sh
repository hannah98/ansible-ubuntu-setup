# This is the custom theme template for gitprompt.sh

override_git_prompt_colors() {
  GIT_PROMPT_THEME_NAME="Custom"
  PathShort="\w";
  GIT_PROMPT_START_USER="${Blue}\u@\h:${Green}${PathShort}${ResetColor}"
  GIT_PROMPT_END_USER="${ResetColor} ➤ "
  GIT_PROMPT_START_ROOT="${Blue}\u@\h:${Green}${PathShort}${ResetColor}"
  GIT_PROMPT_END_ROOT=" "
}

reload_git_prompt_colors "Custom"
