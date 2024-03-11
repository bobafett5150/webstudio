# Dockerfile
# Node.jsの公式イメージをベースに使用
FROM node:18

# 作業ディレクトリを設定
WORKDIR /usr/src/app

# pnpmをインストール
RUN npm install -g pnpm@8.8 && \
    apt-get update && \
    apt-get install -y postgresql-client


# アプリケーションの依存ファイルをコピー
#COPY package*.json ./
#COPY patches ./patches
COPY . .

# 依存関係のインストール
#RUN pnpm install

# アプリケーションのソースをコピー
#COPY . .

# ビルドコマンドの実行
#RUN pnpm build

# データベースマイグレーション
#RUN pnpm migrations migrate

# アプリケーションの起動
#CMD ["pnpm", "dev"]

# アプリケーションの起動ではなく、コンテナを稼働させ続ける
CMD ["tail", "-f", "/dev/null"]


# 起動後
# pnpm install
# pnpm build
# pnpm migrations migrate
# pnpm dev
