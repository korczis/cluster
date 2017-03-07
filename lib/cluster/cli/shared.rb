# encoding: UTF-8
#
# Copyright (c) 2017 Tomas Korcak <korczis@gmail.com>. All rights reserved.
# This source code is licensed under the MIT-style license found in the
# LICENSE file in the root directory of this source tree.

require 'gli'

require_relative '../version'

module Cluster
  module CLI
    extend GLI::App

    program_desc Cluster::DESCRIPTION

    version Cluster::VERSION
  end
end
