
default: validate
	@echo use \"make install\" to install all profiles
	@echo or copy them manually to "~/.phoronix-test-suite/test-{profiles,suites}/local"

install:

install: install-base
install-base:
	@echo installing local/mgbench-base
	@mkdir -p ~/.phoronix-test-suite/test-profiles/local/mgbench-base
	@cp mgbench-base/{downloads.xml,test-definition.xml,install.sh,results-definition.xml} ~/.phoronix-test-suite/test-profiles/local/mgbench-base

install: install-validate
install-validate: validate
	@echo installing local/mgbench-validate
	@mkdir -p ~/.phoronix-test-suite/test-profiles/local/mgbench-validate
	@cp mgbench-validate/{test-definition.xml,install.sh,results-definition.xml} ~/.phoronix-test-suite/test-profiles/local/mgbench-validate

validate:
	@echo building mgbench-validate/install.sh
	@cp mgbench-validate/install.sh.template mgbench-validate/install.sh
	@echo "cat > mgbench-validate <<'EOF'" >> mgbench-validate/install.sh
	@cat mgbench-validate/mgbench-validate.sh >> mgbench-validate/install.sh
	@echo "EOF" >> mgbench-validate/install.sh
	@echo "chmod +x mgbench-validate" >> mgbench-validate/install.sh
