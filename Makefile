all:
	chmod +x install_scripts/install.sh
	./install_scripts/install.sh

test:
	chmod +x install_scripts/test.sh
	./install_scripts/test.sh

pre-commit:
	pre-commit run --all-files
