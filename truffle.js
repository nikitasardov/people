module.exports = {
    networks: {
        development: {
          host: "localhost",
          port: 8545,
          network_id: "*" // Match any network id
        },
        prod: {
            host: "91.201.41.52",
            port: 8545,
            network_id: "*" // Match any network id
        }
    }
};
