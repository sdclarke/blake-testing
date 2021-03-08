local common = import 'common.libsonnet';

{
  blobstore: common.blobstore,
  global: { 
    diagnosticsHttpServer: { 
      listenAddress: ':7980',
      enablePprof: true,
      enablePrometheus: true,
    },
  },
  grpcServers: [{
    listenAddresses: [':8980'],
    authenticationPolicy: { allow: {} },
  }],
  schedulers: {
    '': { endpoint: { address: 'scheduler:8982' } },
  },
  maximumMessageSizeBytes: common.maximumMessageSizeBytes,
}
