# encoding: UTF-8
#
# Copyright (c) 2017 Tomas Korcak <korczis@gmail.com>. All rights reserved.
# This source code is licensed under the MIT-style license found in the
# LICENSE file in the root directory of this source tree.

require 'gli'
require 'pp'

module Cluster
  module CLI
    # Require shared part of GLI::App - flags, meta, etc
    require_relative 'shared.rb'

    # Require Hooks
    require_relative 'hooks.rb'

    commands_from(File.join(File.dirname(__FILE__), 'commands'))

    def self.main(args = ARGV)
      run(args)
    end
  end
end

Cluster::CLI.main(ARGV) if __FILE__ == $PROGRAM_NAME
