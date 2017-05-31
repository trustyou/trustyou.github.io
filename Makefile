# trustyou.github.io

# Setup the shell and python version.
# It's necessary to set this because some environments don't link sh -> bash.
SHELL := /bin/bash
PYTHON := python3

# Constants
VENV_DIR := venv


.PHONY: clean venv install


#################################
# CLEAN-UP                  	#
#################################
clean-temp-files:
	@echo "####################################################"
	@echo "# CLEANING UP CACHED AND TMP FILES                 #"
	@echo "####################################################"
	@find . -name "*.pyc" -delete
	@find . -name "*.pyo" -delete
	@find . -name "__pycache__" -exec rm -rf {} \; || echo "";
	@echo "Done!"


clean-venv:
	@echo "####################################################"
	@echo "# CLEANING UP THE VIRTUAL ENVIRONMENT              #"
	@echo "####################################################"
	@rm -rf $(VENV_DIR)
	@echo "Done!"


clean: clean-temp-files clean-venv


#################################
# VIRTUAL ENVIRONMENT       	#
#################################
venv:
	@echo "####################################################"
	@echo "# CREATING THE VIRTUAL ENVIRONMENT                 #"
	@echo "####################################################"
	@test -d $(VENV_DIR) || virtualenv --always-copy --python $(PYTHON) $(VENV_DIR);
	@echo "Done!"


#################################
# INSTALLATION					#
#################################
install: venv
	@echo "####################################################"
	@echo "# ACTIVATING VENV & RESOLVING DEPENDENCIES         #"
	@echo "####################################################"
	@. $(VENV_DIR)/bin/activate && pip install -r requirements.txt
	@. $(VENV_DIR)/bin/activate && nikola build
	@echo "Done!"

