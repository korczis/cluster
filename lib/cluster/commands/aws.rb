# encoding: UTF-8
#
# Copyright (c) 2017 Tomas Korcak <korczis@gmail.com>. All rights reserved.
# This source code is licensed under the MIT-style license found in the
# LICENSE file in the root directory of this source tree.

require_relative '../kube_aws/kube_aws'

module Cluster
  module Command
    class Aws
      class << self
        def aws(args = [])
          Cluster::Aws.execute(args)
        end
      end
    end
  end
end
