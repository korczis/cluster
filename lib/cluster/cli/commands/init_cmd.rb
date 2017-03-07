# encoding: UTF-8
#
# Copyright (c) 2017 Tomas Korcak <korczis@gmail.com>. All rights reserved.
# This source code is licensed under the MIT-style license found in the
# LICENSE file in the root directory of this source tree.

require_relative '../../commands/init'

module Cluster
  module CLI
    desc 'Initialize'
    command 'init' do |c|
      c.action do
        Cluster::Command::Init.init
      end
    end
  end
end
