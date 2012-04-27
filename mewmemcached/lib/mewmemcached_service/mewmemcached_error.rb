# Copyright (c) 2009-2011 VMware, Inc.
$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', '..', '..', 'base', 'lib')
require 'base/service_error'

module VCAP
  module Services
    module Mewmemcached
      class MewmemcachedError < VCAP::Services::Base::Error::ServiceError
        # 31100 - 31199  Mewmemcached-specific Error
        MEWMEMCACHED_SAVE_INSTANCE_FAILED        = [31100, HTTP_INTERNAL, "Could not save instance: %s"]
        MEWMEMCACHED_DESTORY_INSTANCE_FAILED     = [31101, HTTP_INTERNAL, "Could not destroy instance: %s"]
        MEWMEMCACHED_FIND_INSTANCE_FAILED        = [31102, HTTP_NOT_FOUND, "Could not find instance: %s"]
        MEWMEMCACHED_START_INSTANCE_FAILED       = [31103, HTTP_INTERNAL, "Could not start instance: %s"]
        MEWMEMCACHED_STOP_INSTANCE_FAILED        = [31104, HTTP_INTERNAL, "Could not stop instance: %s"]
        MEWMEMCACHED_INVALID_PLAN                = [31105, HTTP_INTERNAL, "Invalid plan: %s"]
        MEWMEMCACHED_CLEANUP_INSTANCE_FAILED     = [31106, HTTP_INTERNAL, "Could not cleanup instance, the reasons: %s"]
        MEWMEMCACHED_CONNECT_INSTANCE_FAILED     = [31107, HTTP_INTERNAL, "Could not connect mewmemcached instance"]
        MEWMEMCACHED_SET_INSTANCE_PASS_FAILED    = [31108, HTTP_INTERNAL, "Could not set mewmemcached instance password"]
        MEWMEMCACHED_RESTORE_FILE_NOT_FOUND      = [31109, HTTP_INTERNAL, "Could not find mewmemcached restore data file %s"]
      end
    end
  end
end
