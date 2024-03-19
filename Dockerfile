# Dockerfile
# Node.jsの公式イメージをベースに使用
FROM node:18

# 作業ディレクトリを設定
WORKDIR /usr/src/app

ENV NODE_ENV=development

# pnpmをインストール
RUN npm install -g pnpm@8.8 && \
    apt-get update && \
    apt-get install -y postgresql-client


# アプリケーションの依存ファイルをコピー
#COPY package*.json ./
#COPY patches ./patches
COPY . .

# 依存関係のインストール
RUN pnpm install
RUN pnpm build
RUN pnpm migrations migrate

# アプリケーションの起動
CMD ["pnpm", "dev"]
#CMD ["tail", "-f", "/dev/null"]

#    pnpm build && \
#    pnpm migrations migrate
# アプリケーションのソースをコピー
#COPY . .

#RUN sleep 10

# ビルドコマンドの実行
#RUN pnpm build

# データベースマイグレーション
#RUN pnpm migrations migrate

## アプリケーションの起動
#CMD ["pnpm", "dev"]

# アプリケーションの起動ではなく、コンテナを稼働させ続ける
#CMD ["tail", "-f", "/dev/null"]

# apps/.env.example をコピーして apps/.envを作成
# AUTH_SECRET="" にパスワード4桁以上を書く

# 起動後
# pnpm install
# pnpm build
# pnpm migrations migrate
# pnpm dev
