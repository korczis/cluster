# encoding: UTF-8
#
# Copyright (c) 2017 Tomas Korcak <korczis@gmail.com>. All rights reserved.
# This source code is licensed under the MIT-style license found in the
# LICENSE file in the root directory of this source tree.

require_relative '../../commands/get'

module Cluster
  module CLI
    desc 'Get tools'
    command :get do |c|
      c.desc 'Get kubectl'
      c.command :kubectl do |subcommand|
        subcommand.action do |_global_options, _options, _args|
          Cluster::Command::Get.kubectl
        end
      end

      c.desc 'Get kube-aws'
      c.command 'kube-aws' do |subcommand|
        subcommand.action do |_global_options, _options, _args|
          Cluster::Command::Get.kube_aws
        end
      end
    end
  end
end
