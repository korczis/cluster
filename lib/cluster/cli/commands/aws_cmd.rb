# encoding: UTF-8
#
# Copyright (c) 2017 Tomas Korcak <korczis@gmail.com>. All rights reserved.
# This source code is licensed under the MIT-style license found in the
# LICENSE file in the root directory of this source tree.

require_relative '../../commands/aws'

module Cluster
  module CLI
    desc 'aws wrapper'
    command 'aws' do |c|
      c.action do |_global_options, _options, args|
        Cluster::Command::Aws.aws(args)
      end
    end
  end
end
