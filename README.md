# Deploy to Surge.sh

This action use [`surgecli`](https://github.com/YieldRay/surgecli) to deploy your static site to [surge.sh](https://surge.sh/).

You may prefer [this](https://github.com/yavisht/deploy-via-surge.sh-github-action-template) for your node.js project.

See [this](https://surge.sh/help/adding-a-custom-domain) if you want to setup a custom domain.

> If you use official [surge](https://github.com/sintaxi/surge) client, you can fetch your token using command `surge token`.  
> If you use [surgecli](https://github.com/YieldRay/surgecli), then you use command `surgecli token` or `surgecli fetch-token` instead.

## Getting Started

```yml
name: Deploy to Surge.sh
on:
    push:
        branches: ["main"]
    workflow_dispatch:

jobs:
    build-and-deploy:
        runs-on: ubuntu-latest
        # Recommended if you intend to make multiple deployments in quick succession.
        concurrency: ci-${{ github.ref }}
        # Optionally setup environment.
        environment:
            name: preview
            url: https://${{ steps.deployment.outputs.preview }}
        steps:
            - name: Checkout 🛎️
              uses: actions/checkout@v4

              # Replace with the commands required to build your project,
              # or remove this step entirely if your site is pre-built.
            - name: Install and Build 🔧
              run: |
                  npm install
                  npm run build

            - name: Deploy 🚀
              id: deployment
              uses: YieldRay/deploy-to-surge-action@v3
              with:
                  # The folder the action should deploy.
                  folder: dist
                  # Your domain or use surge.sh provided.
                  domain: my-domain.surge.sh
                  # Config token via: Settings > Secrets and variables > Actions > New repository secret
                  token: ${{ secrets.SURGE_TOKEN }}
```
