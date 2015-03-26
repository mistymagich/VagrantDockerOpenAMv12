# Vagrant-Docker-OpenAMv12

OpenAM version 12.0をVirtualBox（Vagrant&Docker）で動かすもの一式

OpenAMの評価用途。ホストOS Windows 8.1 x64で確認


# 必要なもの

- ホストの空きメモリ2GB
- VirtualBox(https://www.virtualbox.org/)
- Vagrant(https://www.vagrantup.com/)
- Vagrant Host Manager(https://github.com/smdahlen/vagrant-hostmanager)
    vagrant plugin install vagrant-hostmanager

# 起動方法

	git clone https://github.com/mistymagich/Vagrant-Docker-OpenAMv12.git
    cd Vagrant-Docker-OpenAMv12
    vagrant up

# 初期設定

1. 起動後、ブラウザで
  http://openam.example.com:8080/openam/
  にアクセス

2. インストール画面が表示されるので、「デフォルト設定の作成」を選択

3. ソフトウェアライセンスに同意後、「デフォルトユーザー」・「デフォルトポリシーエージェント」のパスワードを設定する。パスワードは8文字以上で異なるパスワードにする。

4. インストールが完了するとログイン画面に遷移できるので、ユーザー名：amAdmin・パスワード：設定したものを入力してログイン

