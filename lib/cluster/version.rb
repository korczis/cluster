# encoding: UTF-8
#
# Copyright (c) 2017 Tomas Korcak <korczis@gmail.com>. All rights reserved.
# This source code is licensed under the MIT-style license found in the
# LICENSE file in the root directory of this source tree.

# GoodData Module
module Cluster
  VERSION = '0.1.0'
  SUMMARY = 'CLI for running your own CoreOS/Kubernetes cluster'
  DESCRIPTION = 'CLI for running your own CoreOS/Kubernetes cluster'

  class << self
    # Version
    def version
      VERSION
    end

    # Summary
    def summary
      SUMMARY
    end

    # Description
    def description
      DESCRIPTION
    end
  end
end
