# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{leankitkanban}
  s.version = "0.1.4"
  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Marc Lainez}]
  s.date = %q{2013-06-11}
  s.description = %q{Ruby Wrapper around LeanKitKanban Api (forked to scrumalliance)}
  s.email = %q{ml@theotherguys.be}
  s.extra_rdoc_files = [%q{LICENSE}, %q{README.md},
                        %q{lib/leankit_request.rb},
                        %q{lib/leankitkanban.rb},
                        %q{lib/leankitkanban/archive.rb},
                        %q{lib/leankitkanban/backlog.rb},
                        %q{lib/leankitkanban/board.rb},
                        %q{lib/leankitkanban/card.rb},
                        %q{lib/leankitkanban/config.rb}]
  s.files = [%q{Gemfile}, %q{Gemfile.lock}, %q{LICENSE}, %q{Manifest},
             %q{README.md}, %q{Rakefile}, %q{lib/leankit_request.rb},
             %q{lib/leankitkanban.rb}, %q{lib/leankitkanban/archive.rb},
             %q{lib/leankitkanban/backlog.rb}, %q{lib/leankitkanban/board.rb},
             %q{lib/leankitkanban/card.rb}, %q{lib/leankitkanban/config.rb},
             %q{spec/leankitkanban/archive_spec.rb},
             %q{spec/leankitkanban/backlog_spec.rb},
             %q{spec/leankitkanban/board_spec.rb},
             %q{spec/leankitkanban/card_spec.rb},
             %q{spec/leankitkanban/config_spec.rb}, %q{spec/spec_helper.rb},
             %q{spec/support/config_helper.rb}, %q{leankitkanban.gemspec}]
  s.homepage = %q{http://github.com/mlainez/leankitkanban}
  s.rdoc_options = [%q{--line-numbers}, %q{--inline-source}, %q{--title}, %q{Leankitkanban}, %q{--main}, %q{README.md}]
  s.require_paths = [%q{lib}]
  s.rubyforge_project = %q{leankitkanban}
  s.rubygems_version = %q{1.8.4}
  s.summary = %q{Ruby Wrapper around LeanKitKanban Api}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
