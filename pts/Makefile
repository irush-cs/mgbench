
default:
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

default: validate
validate:
	@echo building mgbench-validate/install.sh
	@cp mgbench-validate/install.sh.template mgbench-validate/install.sh
	@echo "cat > mgbench-validate <<'EOF'" >> mgbench-validate/install.sh
	@cat mgbench-validate/mgbench-validate.sh >> mgbench-validate/install.sh
	@echo "EOF" >> mgbench-validate/install.sh
	@echo "chmod +x mgbench-validate" >> mgbench-validate/install.sh

install: install-suite
install-suite:
	@echo installing local/mgbench
	@mkdir -p  ~/.phoronix-test-suite/test-suites/local/mgbench
	@cp mgbench/suite-definition.xml ~/.phoronix-test-suite/test-suites/local/mgbench

install: install-bandwidth
install-bandwidth: bandwidth
	@echo installing local/mgbench-bandwidth
	@mkdir -p ~/.phoronix-test-suite/test-profiles/local/mgbench-bandwidth
	@cp mgbench-bandwidth/{test-definition.xml,install.sh,results-definition.xml} ~/.phoronix-test-suite/test-profiles/local/mgbench-bandwidth

default: bandwidth
bandwidth:
	@echo building mgbench-bandwidth/install.sh
	@cp mgbench-bandwidth/install.sh.template mgbench-bandwidth/install.sh
	@echo "cat > mgbench-bandwidth <<'EOF'" >> mgbench-bandwidth/install.sh
	@cat mgbench-bandwidth/mgbench-bandwidth.pl >> mgbench-bandwidth/install.sh
	@echo "EOF" >> mgbench-bandwidth/install.sh
	@echo "chmod +x mgbench-bandwidth" >> mgbench-bandwidth/install.sh
