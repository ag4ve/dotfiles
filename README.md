DOTFILES

This is (most of) the configuration I currently use on my desktop (x86 Ubuntu) machine. I have other things I've yet to include, but do intend to include them over time (maybe in a more production ready state).

### Caveats

As this is my configuration, I wouldn't expect everything to work for you is you just clone this repo and run chezmoi apply. As an example of this, my gpg key ID is in both my gpg config and gitconfig. This key is a Yubikey sitting in front of me - you won't have the same ID even if you setup your own Yubikey. I've also started installing things using run_onchange_*.toml files, however I've just started doing this, so it's very very incomplete.

I eventually intend to make this work on OSX and Android (Termux) as I use them both on a regular basis too. At this point, this will not work on either (I specifically download x86 binaries). There's also a bug in lima I asked about but need to file a Github issue for which iss why I'm not downloading that yet (it breaks). I thought about using dunst for notifications instead of notify-send and dunst will display svg icons with the message. So I went looking for (and found) a nice repo of svg icons. I'm not sure that I want to ensure build tools are installed and build dunst though, so this large svg archive isn't currently being used for anything.

## What's here?

I've been using URXVT for the past decade or so and that configuration has been left (just a few lines in Xresources). However I've now moved over to Alacritty, and have a configuration that seems to work fairly well. I've also been using zsh for a decade, and I've split that config into parts and moved away from OMZ (Oh My Zsh) and am now using a zsh plugin manager (that should be pretty easy to replace if you don't like my choice) and am letting chezmoi download the plugins I want, so the plugin manager's job is just to load plugins. I use NeoVim, but have a fairly extensive vimrc - I haven't done much to break that up or clean it up for this repo - it's pretty much as is. I use i3 (i3wm) desktop with some fairly light configuration and that's in here.

I bring in my misc scripts repos as this contains scripts I've written (that I probably like to use) and put them in my PATH. I use asdf but I haven't gotten chezmoi to do anything with it.

## Install

git clone https://github.com/ag4ve/dotfiles ~/.local/share/chezmoi
chezmoi apply -v

