# Uptime-Kuma on Railway
[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/new/template/wGt-6B?referralCode=radityaharya)

Run [Uptime-Kuma](https://github.com/louislam/uptime-kuma) on [Railway](https://railway.app) with [Tailscale](https://tailscale.com) support.

note: Presistent storage is not supported on railway, so if you restart the instance, all your data will be lost. You can periodically export your data and import it back in but it's not ideal.
## How to use

1. Click the button above to deploy to Railway
2. Set the environment variables
3. Click "Deploy"
4. Wait for the deployment to finish
5. Open the app using the URL provided
6. Follow the instructions on the Uptime Kuma website to set up your account

## Environment Variables
- PORT: 80
- TAILSCALE_AUTHKEY (optional): Your tailscale authkey, if you want to use tailscale to access your instance and access services inside your tailscale network (set http proxy to localhost:1055) [more info](https://login.tailscale.com/admin/settings/keys)
- TAILSCALE_HOSTNAME (optional): The hostname for your tailscale instance,
- ONLY_TAILSCALE (optional): If set to true, the app will only be accessible through tailscale. "tailscale serve" will be started, and the app will be accessible at your tailscale domain
- TAILSCALE_EXITNODE (optional): If set, tailscale will advertise this instance as an exit node. [more info](https://tailscale.com/kb/1103/exit-nodes/)
## Disclaimer
I am not affiliated with Uptime-Kuma, Railway or Tailscale in any way, I just wanted to make this for myself and thought I'd share it with others. The "Deploy on Railway" contains a referral code, which gives me a small amount of credit if you use it. If you don't want to use it, you can remove it from the URL.