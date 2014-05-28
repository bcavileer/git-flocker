require "git/flock/version"
require 'json'

module Git
  module Flock
    def self.execute
      Flocker.new(options).flockem
    end

    def self.options
      {orgname: ARGV[0], token: ARGV[1]}
    end

    class Flocker
      def initialize(options)
        @orgname = options[:orgname] || fail_args
        @token = options[:token] || fail_args
      end

      attr_reader :orgname, :token

      def flockem
        JSON.load(repos).each { |repo| `git clone #{repo['ssh_url']}` }
      rescue Exception => e
        puts e.message
        fail_args
      end

      def repos
        `curl -u #{token}:x-oauth-basic -s https://api.github.com/orgs/#{orgname}/repos`
      end

      def fail_args
        puts 'usage: git-flock org-name api-key'
        exit
      end
    end
  end
end
