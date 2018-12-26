#!/usr/bin/env bash

defaultTheme='github';
theme=${1:-$defaultTheme};
## List of the theme's
## https://github.com/tajmone/highlight/tree/master/themes

## https://github.com/sindresorhus/quick-look-plugins
# qlcolorcode   - Preview source code files with syntax highlighting
# qlstephen     - Preview plain text files without or with unknown file extension. Example: README, CHANGELOG, index.styl, etc.
# qlmarkdown    - Preview Markdown files
# webpquicklook - Preview WebP images (*.webp)
# suspicious-package - Preview the contents of a standard Apple installer package (*.pkg)
# quicklook-json     - Preview JSON files
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json  webpquicklook \
&& defaults write org.n8gray.QLColorCode extraHLFlags --kw-case=lower \
&& defaults write org.n8gray.QLColorCode extraHLFlags '-l -W' \
&& defaults write org.n8gray.QLColorCode hlTheme $theme \
&& qlmanage -r \
