# encoding: UTF-8
#
# Copyright (c) 2017 Tomas Korcak <korczis@gmail.com>. All rights reserved.
# This source code is licensed under the MIT-style license found in the
# LICENSE file in the root directory of this source tree.

require 'os'
require 'tempfile'

module Cluster
  class KubeAws
    class << self
      def get_version
        'v0.9.5-rc.1'
      end

      def get_url
        version = KubeAws.get_version
        if OS.mac?
          "https://github.com/coreos/kube-aws/releases/download/#{version}/kube-aws-darwin-amd64.tar.gz"
        elsif OS.linux?
          "https://github.com/coreos/kube-aws/releases/download/#{version}/kube-aws-linux-amd64.tar.gz"
        end
      end

      def get_target_filename
        if OS.mac? || OS.linux?
          'kube-aws'
        end
      end

      def get_compressed_filename
        if OS.mac? || OS.linux?
          'kube-aws.tar.gz'
        end
      end

      def get_target_dir
        File.expand_path("../../../../tools", __FILE__)
      end

      def get_target_path
        "#{KubeAws.get_target_dir}/#{KubeAws.get_target_filename}"
      end

      def get_temp_path
        t = ::Tempfile.new(get_compressed_filename)
        temp_path = t.path
        t.close
        t.unlink
        temp_path
      end

      def get_compressed_directory
        if OS.mac?
          'darwin-amd64'
        elsif OS.linux?
          'linux-amd64'
        end
      end

      def get
        url = get_url
        temp_path = get_temp_path

        cmd = "curl -o #{temp_path} -LO #{url}"
        out = system(cmd)

        cmd = "tar -xvf #{temp_path} --strip-components 1 -C #{get_target_dir} #{get_compressed_directory}/#{get_target_filename}"
        out = system(cmd)

        target_path = get_target_path
        cmd = "chmod +x #{target_path}"
        out = system(cmd)

        nil
      end

      def execute
        path = get_target_path

        cmd = "#{path}"
        out = system(cmd)
      end
    end
  end
end
