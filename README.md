# What is this for?
Script to install and configure my terminal profile using my own dotfiles.

## My terminal configuration
It's a very simple setup, it consists of:
- [tilix](https://github.com/gnunn1/tilix)
- [zsh](https://www.zsh.org/)
- [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
- [powerlevel10k](https://github.com/romkatv/powerlevel10k)

## To run the script
Make sure you run it as root (the script checks for it though, so no worries if you forget to)

Also, you need to give the script execution permission:
```
chmod 755 runme.sh
```
Then, run the script using:
```
sudo ./runme.sh
```
The tilix, zsh and powerlevel10k config files are located in the `conf` folder, so copy your dotfiles in there if you want to use the script with your own config files.