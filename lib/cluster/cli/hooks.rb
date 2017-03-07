# encoding: UTF-8
#
# Copyright (c) 2017 Tomas Korcak <korczis@gmail.com>. All rights reserved.
# This source code is licensed under the MIT-style license found in the
# LICENSE file in the root directory of this source tree.

require 'gli'
require 'pp'

Cluster::CLI.module_eval do
  pre do |global, _command, _options, _args|
    # Pre logic here
    # Return true to proceed; false to abort and not call the
    # chosen command
    # Use skips_pre before a command to skip this block
    # on that command only
    true
  end

  post do |_global, _command, _options, _args|
    # Post logic here
    # Use skips_post before a command to skip this
    # block on that command only
  end

  on_error do |_exception|
    # Error logic here
    # return false to skip default error handling
    # pp exception.backtrace
    # pp exception
    true
  end
end
