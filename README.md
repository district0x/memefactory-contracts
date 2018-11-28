# <img src="https://district0x.io/images/logo@2x.png" alt="district0x" width="400px">

# Meme Factory EVM Package

[![NPM Package](https://img.shields.io/npm/v/memefactory-contracts.svg?style=flat-square)](https://www.npmjs.org/package/memefactory-contracts)

This repository contains [MemeFactory](https://memefactory.io/) smart contracts packaged as a reusable EVM Package.
You can deploy them as-is, or extend to suit your needs to build custom contracts and more complex decentralized systems.

## Install

```bash
npm install memefactory-contracts
```

## Packaged contracts

- DSAuth
- DSGuard
- EternalDb
- Registry
- MiniMeTokenFactory
- DankToken
- MemeToken
- MemeFactory

## Development

### prerequisites

You need [ZeppelinOS](https://docs.zeppelinos.org/docs/start.html) comand-line interface installed:

```bash
npm install --global zos
```

### <a name="development">Developing and contributing</a>

Add contracts:

```bash
zos add DSAuth:ds-auth
zos add DSGuard:ds-guard
zos add EternalDb:meme-registry-db
zos add Registry:meme-registry
zos add MiniMeTokenFactory:minime-token-factory
zos add DankToken:DANK
zos add MemeToken:meme-token
zos add MemeFactory:meme-factory
```

Start session with a network called `local` (defined in truffle-config):

```bash
zos session --network local --from <address> --expires 3600
```

Deploy all the added logic contracts to the network:

```bash
zos push
```

### <a name="using">Using this package</a>

Create a new ZeppelinOS project, and add the `memefactory-contracts` EVM package:

```bash
zos init MyProject
zos link memefactory-contracts
```

Start session with a network called `local` (defined in truffle-config), using an address [different from the default](https://docs.zeppelinos.org/docs/pattern.html#transparent-proxies-and-function-clashes):

```bash
zos session --network local --from <address> --expires 3600
```

Deploy all the added logic contracts to the network (note that this step is only needed on local networks, when working on public networks ZeppelinOS will automatically used the pre-deployed implementation contracts):

```bash
zos push --deploy-dependencies
```

### <a name = "update">Update contracts</a>

Update to a new version of the package and deploy changes to the logic contracts:

```bash
zos link memefactory-contracts@new-version
zos push --deploy-dependencies
```

Deploy updated instances of the contracts to interact with:

```bash
zos update meme-factory
```

## <a name="deploy">Deploy upgradeable instances of the contracts:</a>

```bash
OWNER=<address>
DB=$(zos create meme-registry-db --init initialize)
REGISTRY=$(zos create meme-registry --init --args $DB,$OWNER)
MINI_ME_TOKEN_FACTORY=$(zos create minime-token-factory)
DANK_TOKEN=$(zos create DANK --init --args $MINI_ME_TOKEN_FACTORY,1000000000000000000000000000,$OWNER)
MEME_TOKEN=$(zos create meme-token --init --args $REGISTRY)
MEME_FACTORY=$(zos create meme-factory --init --args $REGISTRY,$DANK_TOKEN,$MEME_TOKEN,1)
```

## <a name="interact">Interact with the contracts</a>

---

**NOTE**

When interacting with deployed contracts use a different address than that of the owner (admin) addressed used when [creating](#development) it.
The [transparent proxy pattern](https://docs.zeppelinos.org/docs/pattern.html#transparent-proxies-and-function-clashes) posits that the calls from the admin address will not be delegated to the proxy contract holding the logic.

---

```bash
npx truffle console --network local
```

```bash
var address='contract-instance-address';
memeFactory=MemeFactory.at(address)
var opts = {from: 'address'};
memeFactory.version(opts)
```

## License

Released under the [Eclipse Public License](LICENSE)
