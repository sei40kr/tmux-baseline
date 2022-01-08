# tmux-baseline

Fully customizable status line for tmux.

## Install

### Installation with tpm (recommended)

Add the following line to your `tmux.conf`, **BEFORE** the part where the other
plugins are loaded. (since [tmux-cpu](https://github.com/tmux-plugins/tmux-cpu),
[tmux-battery](https://github.com/tmux-plugins/tmux-battery), and such plugins
do interpolation in `status-{left,right}`)

```tmux
set -g @plugin 'sei40kr/tmux-baseline'
```

## Customizations

These customizations should be done **BEFORE** the part where tmux-baseline
loaded.

```
set-option -g status-justify absolute-centre
set-option -g status-style "fg=#a9b1d6,bg=#1f2335"
set-option -g @baseline-section-a-style "fg=#15161e,bg=#7aa2f7"
set-option -g @baseline-section-b-style "fg=#7aa2f7,bg=#3b4261"
set-option -g @baseline-section-c-style "fg=#a9b1d6,bg=#1f2335"
set-option -g @baseline-current-window-style "fg=#15161e,bg=#7aa2f7"
set-option -g @baseline-window-style "fg=#3b4261,bg=#1f2335"
set-option -g @baseline-section-x-style "fg=#a9b1d6,bg=#1f2335"
set-option -g @baseline-section-y-style "fg=#7aa2f7,bg=#3b4261"
set-option -g @baseline-section-z-style "fg=#15161e,bg=#7aa2f7"

set -g @plugin 'sei40kr/tmux-baseline'
```

| Variable                          | Default value                               | Description                                                                        |
| :-------------------------------- | :------------------------------------------ | :--------------------------------------------------------------------------------- |
| `@baseline-section-a-format`      | `"#{session_name}"`                         | Set the format in section A. See the `FORMATS` and `STYLES` sections in `tmux(1)`. |
| `@baseline-section-a-style`       | `''`                                        | Set the style for section A. See the `STYLES` section in `tmux(1)`.                |
| `@baseline-section-b-format`      | `''`                                        | Set the format in section B.                                                       |
| `@baseline-section-b-style`       | `''`                                        | Set the style for section B.                                                       |
| `@baseline-section-c-format`      | `''`                                        | Set the format in section C.                                                       |
| `@baseline-section-c-style`       | `''`                                        | Set the style for section C.                                                       |
| `@baseline-window-format`         | `'#I:#W#{?window_flags,#{window_flags}, }'` | Set the format in which the window is displayed in the status line window list.    |
| `@baseline-window-style`          | `''`                                        | Set the status line style for a window.                                            |
| `@baseline-current-window-format` | `'#I:#W#{?window_flags,#{window_flags}, }'` | Set the format for the currently active window in the status line window list.     |
| `@baseline-current-window-style`  | `''`                                        | Set the status line style for the currently active window.                         |
| `@baseline-section-x-format`      | `''`                                        | Set the format in section X.                                                       |
| `@baseline-section-x-style`       | `''`                                        | Set the style for section X.                                                       |
| `@baseline-section-y-format`      | `"#{=21:pane_title}"`                       | Set the format in section Y.                                                       |
| `@baseline-section-y-style`       | `''`                                        | Set the style for section Y.                                                       |
| `@baseline-section-z-format`      | `"%H:%M %d-%b-%y"`                          | Set the format in section Z.                                                       |
| `@baseline-section-z-style`       | `''`                                        | Set the style for section Z.                                                       |
| `@baseline-padding`               | `' '`                                       | The padding in each section                                                        |

## TODOs

- [ ] Add example screenshots
- [ ] Add options to customize separators (`powerline`, `slant`, etc)
- [ ] Write a tip to extract styles from a Vim colorscheme
- [ ] Implement unit tests
