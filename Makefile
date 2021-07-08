backup:
	cp $$HOME/.bash_profile $$HOME/.bash_profile_shplit_bak
	cp $$HOME/.bashrc $$HOME/.bashrc_shplit_bak
	
install: backup
	mkdir $$HOME/.config/shplit
	cp configs/* $$HOME/.config/shplit
	cp bash/bash_profile $$HOME/.bash_profile
	cp bash/bashrc $$HOME/.bashrc

uninstall:
	cp $$HOME/.bash_profile_shplit_bak $$HOME/.bash_profile
cp $$HOME/.bashrc_shplit_bak $$HOME/.bashrc
