
default:
	@echo
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


install: install-performance
install-performance: performance
	@echo installing local/mgbench-performance
	@mkdir -p ~/.phoronix-test-suite/test-profiles/local/mgbench-performance
	@cp mgbench-performance/{test-definition.xml,install.sh,results-definition.xml} ~/.phoronix-test-suite/test-profiles/local/mgbench-performance

default: performance
performance:
	@echo building mgbench-performance/install.sh
	@cp mgbench-performance/install.sh.template mgbench-performance/install.sh
	@echo "cat > mgbench-performance <<'EOF'" >> mgbench-performance/install.sh
	@cat mgbench-performance/mgbench-performance.sh >> mgbench-performance/install.sh
	@echo "EOF" >> mgbench-performance/install.sh
	@echo "chmod +x mgbench-performance" >> mgbench-performance/install.sh


install: install-scaling
install-scaling: scaling
	@echo installing local/mgbench-scaling
	@mkdir -p ~/.phoronix-test-suite/test-profiles/local/mgbench-scaling
	@cp mgbench-scaling/{test-definition.xml,install.sh,results-definition.xml} ~/.phoronix-test-suite/test-profiles/local/mgbench-scaling

default: scaling
scaling:
	@echo building mgbench-scaling/install.sh
	@cp mgbench-scaling/install.sh.template mgbench-scaling/install.sh
	@echo "cat > mgbench-scaling <<'EOF'" >> mgbench-scaling/install.sh
	@cat mgbench-scaling/mgbench-scaling.sh >> mgbench-scaling/install.sh
	@echo "EOF" >> mgbench-scaling/install.sh
	@echo "chmod +x mgbench-scaling" >> mgbench-scaling/install.sh
