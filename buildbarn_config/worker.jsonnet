# The contents of this file are covered by APACHE License Version 2.
# Modifications were made to this file for remote-apis-testing compatability

local common = import 'common.libsonnet';

{
  blobstore: common.blobstore,
  maximumMessageSizeBytes: common.maximumMessageSizeBytes,
  scheduler: { address: 'scheduler:8983' },
  global: { 
    diagnosticsHttpServer: { 
      listenAddress: ':7986',
      enablePprof: true,
      enablePrometheus: true,
    },
  },
  maximumMemoryCachedDirectories: 1000,
  instanceName: 'blake-client',
  buildDirectories: [{
    native: {
      buildDirectoryPath: '/worker/build',
      cacheDirectoryPath: '/worker/cache',
      maximumCacheFileCount: 10000,
      maximumCacheSizeBytes: 1024 * 1024 * 1024,
      cacheReplacementPolicy: 'LEAST_RECENTLY_USED',
    },
    runners: [{
      endpoint: { address: 'unix:///worker/runner' },
      concurrency: 8,
      platform: {},
      defaultExecutionTimeout: '1800s',
      maximumExecutionTimeout: '3600s',
      workerId: {
        datacenter: 'paris',
        rack: '4',
        slot: '15',
        hostname: 'ubuntu-worker.example.com',
      },
    }],
  }],
}
