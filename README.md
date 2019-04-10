# spresensesdk-builder

[![CircleCI](https://circleci.com/gh/pioka/spresensesdk-builder.svg?style=shield)](https://circleci.com/gh/pioka/spresensesdk-builder)

Spresense SDK アプリのビルド用コンテナです。

:whale: [Docker Hub](https://hub.docker.com/r/pioka/spresensesdk-builder)

## :warning: Caution
ビルドはできますが、実機へ書き込んでの検証はしていません。なぜなら Spresense を持っていないから。

## :rocket: Get started with 'hello Example'
以下、Spresense SDK 付属サンプルのビルド手順です。あらかじめ Docker と Git をインストールしてください。

Spresense SDK をクローンします。

```sh
$ git clone --recursive https://github.com/sonydevworld/spresense.git
```

コンテナに入ります。（クローンした`spresense`ディレクトリをコンテナの`/opt/spresense`にマウントします）

```sh
$ cd spresense
$ docker run -it --rm -v `pwd`:/opt/spresense -w /opt/spresense pioka/spresensesdk-builder:latest bash
```

以下コンテナ内での作業

```sh
$ cd sdk

# カーネルとSDKの設定 #
$ ./tools/config.py --kernel release
$ ./tools/config.py board/spresense

$ tools/config.py -m
# 'Examples' → 'Hello, World! example' にチェックを入れて 'Save' してください #

# アプリケーションのビルド #
$ make buildkernel
$ make
```
`sdk`ディレクトリ配下に`nuttx.spk`が生成されます。
