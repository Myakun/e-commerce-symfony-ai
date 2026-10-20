FROM node:24-slim

ENV COREPACK_ENABLE_DOWNLOAD_PROMPT=0
RUN corepack enable pnpm

USER node

WORKDIR /var/www/app/frontend

CMD ["pnpm", "dev", "--hostname", "0.0.0.0", "--port", "3000"]
