# docker-ssh-hands-on

## 事前準備

1. 下記のURLを参考にDockerをインストール (Mac対象、WindowsはPro版でしかDockerが使えない)

[https://sukkiri.jp/technologies/virtualizers/docker/docker-mac_install.html](https://sukkiri.jp/technologies/virtualizers/docker/docker-mac_install.html)


2. このレポジトリをクローン

```bash
$ git clone https://github.com/YutaInoueCommudePH/docker-ssh-hands-on.git
```


3. 私の方で作成したDockerfileからイメージをビルドする。

```bash
$ docker build -t ssh-training ./
```

このイマージはSSHサーバーとWebサーバーが入っています。


4. 動作確認

```bash
$ docker-compose up -d
```

コマンドが終了しましたら、[http://localhost:8080](http://localhost:8080) で確認する。テストページが表示されればOK


5. 片付け
```bash
$ docker-compose down
```
