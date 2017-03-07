# encoding: UTF-8
#
# Copyright (c) 2017 Tomas Korcak <korczis@gmail.com>. All rights reserved.
# This source code is licensed under the MIT-style license found in the
# LICENSE file in the root directory of this source tree.

require_relative '../../commands/kubectl'

module Cluster
  module CLI
    desc 'kubectl wrapper'
    command :kubectl do |c|
      c.action do
        Cluster::Command::Kubectl.kubectl
      end
    end
  end
end
