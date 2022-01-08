#!/usr/bin/env bash

section_a_format_default="#{session_name}"
section_a_style_default=""
section_b_format_default=""
section_b_style_default=""
section_c_format_default=""
section_c_style_default=""
window_format_default="#I:#W#{?window_flags,#{window_flags}, }"
window_style_default=""
current_window_format_default="#I:#W#{?window_flags,#{window_flags}, }"
current_window_style_default=""
section_x_format_default=""
section_x_style_default=""
section_y_format_default="#{=21:pane_title}"
section_y_style_default=""
section_z_format_default="%H:%M %d-%b-%y"
section_z_style_default=""
padding_default=" "

main() {
  local section_a_format
  local section_a_style
  local section_b_format
  local section_b_style
  local section_c_format
  local section_c_style
  local current_window_format
  local current_window_style
  local window_format
  local window_style
  local section_x_format
  local section_x_style
  local section_y_format
  local section_y_style
  local section_z_format
  local section_z_style
  local padding
  local status_left
  local status_right
  local window_status_current_format
  local window_status_format

  section_a_format="$(get_tmux_option "@baseline-section-a-format" "$section_a_format_default")"
  section_a_style="$(get_tmux_option "@baseline-section-a-style" "$section_a_style_default")"
  section_b_format="$(get_tmux_option "@baseline-section-b-format" "$section_b_format_default")"
  section_b_style="$(get_tmux_option "@baseline-section-b-style" "$section_b_style_default")"
  section_c_format="$(get_tmux_option "@baseline-section-c-format" "$section_c_format_default")"
  section_c_style="$(get_tmux_option "@baseline-section-c-style" "$section_c_style_default")"
  window_format="$(get_tmux_option "@baseline-window-format" "$window_format_default")"
  window_style="$(get_tmux_option "@baseline-window-style" "$window_style_default")"
  current_window_format="$(get_tmux_option "@baseline-current-window-format" "$current_window_format_default")"
  current_window_style="$(get_tmux_option "@baseline-current-window-style" "$current_window_style_default")"
  section_x_format="$(get_tmux_option "@baseline-section-x-format" "$section_x_format_default")"
  section_x_style="$(get_tmux_option "@baseline-section-x-style" "$section_x_style_default")"
  section_y_format="$(get_tmux_option "@baseline-section-y-format" "$section_y_format_default")"
  section_y_style="$(get_tmux_option "@baseline-section-y-style" "$section_y_style_default")"
  section_z_format="$(get_tmux_option "@baseline-section-z-format" "$section_z_format_default")"
  section_z_style="$(get_tmux_option "@baseline-section-z-style" "$section_z_style_default")"
  padding="$(get_tmux_option "@baseline-padding" "$padding_default")"

  status_left="${section_a_style:+#[${section_a_style}]}"
  status_left+="${section_a_format:+${padding}${section_a_format}${padding}}"
  status_left+="${section_b_style:+#[${section_b_style}]}"
  status_left+="${section_b_format:+${padding}${section_b_format}${padding}}"
  status_left+="${section_c_style:+#[${section_c_style}]}"
  status_left+="${section_c_format:+${padding}${section_c_format}${padding}}"

  window_status_current_format="${current_window_format:+${padding}${current_window_format}${padding}}"
  window_status_format="${window_format:+${padding}${window_format}${padding}}"

  status_right="${section_x_style:+#[${section_x_style}]}"
  status_right+="${section_x_format:+${padding}${section_x_format}${padding}}"
  status_right+="${section_y_style:+#[${section_y_style}]}"
  status_right+="${section_y_format:+${padding}${section_y_format}${padding}}"
  status_right+="${section_z_style:+#[${section_z_style}]}"
  status_right+="${section_z_format:+${padding}${section_z_format}${padding}}"

  tmux set-option -gq status-left "${status_left}" \; \
    set-option -gq status-right "${status_right}" \; \
    set-option -wgq window-status-current-format "${window_status_current_format}" \; \
    set-option -wgq window-status-current-style "$current_window_style" \; \
    set-option -wgq window-status-format "${window_status_format}" \; \
    set-option -wgq window-status-style "$window_style" \; \
    set-option -wgq window-status-separator ""
}

get_tmux_option() {
  local option="$1"
  local default_value="$2"

  local value
  value="$(tmux show-option -gqv "$option")"
  if [[ -z "$value" ]]; then
    echo "$default_value"
  else
    echo "$value"
  fi
}

set_tmux_option() {
  local option="$1"
  local value="$2"
  tmux set-option -gq "$option" "$value"
}

main

# vim:set ft=bash:
