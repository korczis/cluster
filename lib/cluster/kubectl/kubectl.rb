# encoding: UTF-8
#
# Copyright (c) 2017 Tomas Korcak <korczis@gmail.com>. All rights reserved.
# This source code is licensed under the MIT-style license found in the
# LICENSE file in the root directory of this source tree.

require 'os'

module Cluster
  class Kubectl
    class << self
      def get_version
        res = `curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`
        res.strip
      end

      def get_url
        version = Kubectl.get_version
        if OS.mac?
          "https://storage.googleapis.com/kubernetes-release/release/#{version}/bin/darwin/amd64/kubectl"
        elsif OS.linux?
          "curl -LO https://storage.googleapis.com/kubernetes-release/release/#{version}/bin/linux/amd64/kubectl"
        elsif OS.windows?
          "https://storage.googleapis.com/kubernetes-release/release/#{version}/bin/windows/amd64/kubectl.exe"
        end
      end

      def get_filename
        if OS.windows?
          'kubectl.exe'
        elsif OS.mac? || OS.linux?
          'kubectl'
        end
      end

      def get_target_path
        File.expand_path("../../../../tools/#{Kubectl.get_filename}", __FILE__)
      end

      def get
        url = get_url
        target_path = get_target_path

        cmd = "curl -o #{target_path} -LO #{url}"
        out = system(cmd)

        cmd = "chmod +x #{target_path}"
        out = system(cmd)
      end

      def execute
        path = get_target_path

        cmd = "#{path}"
        out = system(cmd)
      end
    end
  end
end
