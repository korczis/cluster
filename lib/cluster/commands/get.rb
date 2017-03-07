# encoding: UTF-8
#
# Copyright (c) 2017 Tomas Korcak <korczis@gmail.com>. All rights reserved.
# This source code is licensed under the MIT-style license found in the
# LICENSE file in the root directory of this source tree.

require_relative '../kubectl/kubectl'
require_relative '../kube_aws/kube_aws'

module Cluster
  module Command
    class Get
      class << self
        def kubectl
          Cluster::Kubectl.get
        end

        def kube_aws
          Cluster::KubeAws.get
        end
      end
    end
  end
end
