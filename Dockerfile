FROM kong:3.9
COPY kong.yml /etc/kong/kong.yml
ENV KONG_DATABASE=off
ENV KONG_DECLARATIVE_CONFIG=/etc/kong/kong.yml
ENV KONG_PROXY_LISTEN=0.0.0.0:8000
ENV KONG_ADMIN_LISTEN=off
# Keep Cloudflare's X-Forwarded-Proto: https, so the BFF sets its Secure cookie.
# The ELB only accepts Cloudflare (aether-infra restrict_elb.sh).
ENV KONG_TRUSTED_IPS=0.0.0.0/0,::/0
