# Deploy to Surge.sh

This action use [surgecli](https://github.com/YieldRay/surgecli) to deploy your static site to [surge.sh](https://surge.sh/)

You may prefer [this](https://github.com/yavisht/deploy-via-surge.sh-github-action-template) for your node.js project

See [this](https://surge.sh/help/adding-a-custom-domain) if you want to setup a custom domain

> If you use official [surge](https://github.com/sintaxi/surge) client, you can fetch your token using command `surge token`  
> If you use [surgecli](https://github.com/YieldRay/surgecli), you use command `surgecli fetch-token` instead

## Getting Started

```yml
name: Deploy to Surge.sh
on: [push]
jobs:
    build-and-deploy:
        concurrency: ci-${{ github.ref }} # Recommended if you intend to make multiple deployments in quick succession.
        runs-on: ubuntu-latest
        steps:
            - name: Checkout 🛎️
              uses: actions/checkout@v3

            - name: Install and Build 🔧 # This example project is built using npm and outputs the result to the 'build' folder. Replace with the commands required to build your project, or remove this step entirely if your site is pre-built.
              run: |
                  npm ci
                  npm run build

            - name: Deploy 🚀
              uses: YieldRay/deploy-to-surge-action@v1
              with:
                  folder: dist # The folder the action should deploy.
                  domain: mydomain.surge.sh # Your domain or use surge.sh provided.
                  token: ${{ secrets.SURGE_TOKEN }} # Get token using command: surgecli fetch-token
```
