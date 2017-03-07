# encoding: UTF-8
#
# Copyright (c) 2017 Tomas Korcak <korczis@gmail.com>. All rights reserved.
# This source code is licensed under the MIT-style license found in the
# LICENSE file in the root directory of this source tree.

require 'tempfile'

module Cluster
  class Helpers
    class << self
      def get_temp_path(prefix)
        t = ::Tempfile.new(prefix)
        temp_path = t.path
        t.close
        t.unlink
        temp_path
      end
    end
  end
end

