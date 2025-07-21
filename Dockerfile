# ベースイメージとしてNode.jsを使用
FROM node:22-slim

# OSパッケージアップデート
RUN apt update && apt upgrade -y

# 作業ディレクトリを設定
WORKDIR /app

# パッケージファイルをコピー
COPY package.json package-lock.json ./

# 依存関係をインストール
RUN npm install

# アプリケーション本体をコピー
COPY . .

# Vite dev サーバーが使うポート
EXPOSE 3000

# 開発用サーバの起動
CMD ["npm", "run", "dev"]
