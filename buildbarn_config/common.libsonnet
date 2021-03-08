{
  blobstore: {
    contentAddressableStorage: {
      decomposing: {
      //grpc: {
        //address: 'storage-0:8981',
      //},
        backend: {
          sharding: {
            hashInitialization: 11946695773637837490,
            shards: [
              {
                backend: { grpc: { address: 'storage-0:8981' } },
                weight: 1,
              },
              {
                backend: { grpc: { address: 'storage-1:8981' } },
                weight: 1,
              },
            ],
          },
        },
        blockSizeBytes: 8*1024,
        maximumManifestSizeBytes: 9*1024*1024,
      },
    },
    actionCache: {
      //grpc: {
        //address: 'storage-0:8981',
      //},
      completenessChecking: {
        sharding: {
          hashInitialization: 14897363947481274433,
          shards: [
            {
              backend: { grpc: { address: 'storage-0:8981' } },
              weight: 1,
            },
            {
              backend: { grpc: { address: 'storage-1:8981' } },
              weight: 1,
            },
          ],
        },
      },
    },
  },
  browserUrl: 'http://localhost:7984',
  global: { 
    diagnosticsHttpServer: { 
      listenAddress: ':80',
      enablePprof: true,
      enablePrometheus: true,
    },
  },
  maximumMessageSizeBytes: 16 * 1024 * 1024,
}
