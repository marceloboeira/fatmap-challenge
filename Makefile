.PHONY: install
install:
	bundle install

.PHONY: run
run:
	bundle exec rackup -p 1994

.PHONY: test
test:
	bundle exec rspec
