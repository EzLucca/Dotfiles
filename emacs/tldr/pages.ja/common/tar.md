# tar

> アーカイブ(複数のファイルやフォルダを 1 つのファイルに纏める)の為のユーティリティー。
> gzip や bzip2 などの圧縮方法と組み合わせることが多いです。
> 詳しくはこちら: <https://www.gnu.org/software/tar>

- アーカイブを作成し、それをファイルに書き込む:

`tar cf {{出力ファイル名.tar}} {{ファイル1 ファイル2 ...}}`

- gzip 形式で圧縮されたアーカイブを作成し、それをファイルに書き込む:

`tar czf {{出力ファイル名.tar.gz}} {{ファイル1 ファイル2 ...}}`

- 相対パスを用いてディレクトリから gzip 形式のアーカイブを作成する:

`tar czf {{出力ファイル名.tar.gz}} --directory={{ディレクトリへの相対パス}} .`

- (圧縮された)アーカイブファイルを、カレントディレクトリに過程を詳細表示しながら展開する:

`tar xvf {{入力ファイル名.tar[.gz|.bz2|.xz]}}`

- (圧縮された)アーカイブファイルを、指定のディレクトリに展開する:

`tar xf {{入力ファイル名.tar[.gz|.bz2|.xz]}} --directory={{ディレクトリ}}`

- 圧縮されたアーカイブを作成し、それにファイルを書き込む。なお、接尾辞で圧縮プログラムを指定する:

`tar caf {{出力ファイル名.tar.xz}} {{ファイル1 ファイル2 ...}}`

- tar ファイルの内容を詳細に表示する:

`tar tvf {{入力ファイル名.tar}}`

- アーカイブファイルからパターンに合致するファイルを抽出する:

`tar xf {{入力ファイル名.tar}} --wildcards "{{*.html}}"`