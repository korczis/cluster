# encoding: UTF-8
#
# Copyright (c) 2017 Tomas Korcak <korczis@gmail.com>. All rights reserved.
# This source code is licensed under the MIT-style license found in the
# LICENSE file in the root directory of this source tree.

require 'os'

require_relative "../helpers/helpers"

module Cluster
  class Aws
    class << self
      def get_version
        res = `curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`
        res.strip
      end

      def get_url
        'https://s3.amazonaws.com/aws-cli/awscli-bundle.zip'
      end

      def get_filename
        if OS.mac? || OS.linux?
          'aws'
        end
      end

      def get_compressed_filename
        if OS.mac? || OS.linux?
          'awscli-bundle.zip'
        end
      end

      def get_target_dir
        File.expand_path("../../../../tools/aws", __FILE__)
      end

      def get_target_path
        "#{get_target_dir}/bin/#{get_filename}"
      end

      def get
        url = get_url
        temp_path = Helpers.get_temp_path(get_compressed_filename)

        cmd = "curl -o #{temp_path} -LO #{url}"
        out = system(cmd)

        Dir.mktmpdir(get_compressed_filename) do |dir|
          Dir.chdir(dir) do
            cmd = "unzip #{temp_path}"
            out = system(cmd)
          end

          cmd = "#{dir}/awscli-bundle/install -i #{get_target_dir}"
          out = system(cmd)

          nil
        end

        nil
      end

      def execute(args = [])
        path = get_target_path

        cmd = "#{path} #{args.join(' ')}"
        out = system(cmd)
      end
    end
  end
end
